
## Download and unzip, if specified, into folder dirDest and use localFName if specified, else derive the name from the 
##  last component of the remote URL path.
fetchRemoteFile <- function(locRemote, dirDest, unzip = FALSE, localFName = NULL) {
    require(tools)
    
    if(!file.exists(dirDest)) 
        dir.create(dirDest)
    
    if(is.null(localFName) || is.na(localFName) || nchar(localFName) == 0 ) {
        fileExt <- file_ext(basename(URLdecode(locRemote)))
        destFile <- file_path_sans_ext(basename(URLdecode(locRemote)))
        destFile <- paste(dirDest, .Platform$file.sep, destFile, "_", as.Date(Sys.time()), ".", fileExt, sep="")
    } else {
        destFile = localFName
    }
    
    codeSucc <- download.file(locRemote, destFile, method = "curl")
    if(codeSucc != 0) 
        stop(paste("Unable to download file from :", locRemote))
    
    retVal = destFile
    
    if(isTRUE(unzip))
        retVal <- unzip(destFile, exdir=dirDest)
    
    retVal   
}


##
##  This load the test and training data & add columns indicating the activity and subject
## 
loadTypeDataSet <- function(folder, xfile, yfile, subjfile, colNms, sampleType) {
    ## Test data folder
    folderForSet <- paste(folderBase,folder, sep="")
    
    ## Read in the columns which hold the measurements (features) of interest
    dfDataSet <- read.table(paste(folderForSet, xfile, sep=""), header = FALSE, numerals=("no.loss"), blank.lines.skip = TRUE, stringsAsFactors = FALSE, colClasses = colCls)
    
    ## Add activity labels to the dataset
    df_Y <- read.table(paste(folderForSet, yfile, sep=""), header = FALSE, numerals=c("no.loss"), blank.lines.skip = TRUE, stringsAsFactors = FALSE)
    colLabels <- apply(df_Y, c(2), function(x) { df_ActivityLabels$label[x] })
    
    ## Add the subject info to the dataset (as the last column)
    df_Subj <- read.table(paste(folderForSet, subjfile, sep=""), header = FALSE, numerals=c("no.loss"), blank.lines.skip = TRUE, stringsAsFactors = FALSE)
    dfDataSet <- cbind(colLabels, dfDataSet)
    dfDataSet <- cbind(df_Subj$V1, dfDataSet)
    
    ## All the column names, except for the newly added one has been named (for now). 
    ##  Setting name of the new column to 'activity' viz. represents one of the Activity Labels
    colnames(dfDataSet) <- c(c('subjectid', 'activity'), colNms)
    
    dfDataSet[,"activity"] <- as.factor(dfDataSet[,"activity"])
    dfDataSet[,"subjectid"] <- as.factor(dfDataSet[,"subjectid"])
    
    newCol <- c(rep(sampleType, nrow(dfDataSet)))
    dfDataSet <- cbind(dfDataSet, newCol)
    colnames(dfDataSet)[ncol(dfDataSet)] <- "source"
    dfDataSet[,"source"] <- as.factor(dfDataSet[,"source"])

    dfDataSet
}


remoteFile <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'

dataFiles <- fetchRemoteFile(remoteFile, 'data/', unzip=TRUE)

## top leve base folder for the data
folderBase <- "data/UCI HAR Dataset/"

## Read the data sets common to both test and training data
df_ActivityLabels <- read.table(paste(folderBase, "activity_labels.txt", sep=""), header = FALSE, numerals=c("no.loss"), blank.lines.skip = TRUE, stringsAsFactors = FALSE)
## rename the columns 
names(df_ActivityLabels) <- c("ordinal", "label")

df_Features <- read.table(paste(folderBase, "features.txt", sep=""), header = FALSE, numerals=c("no.loss"), blank.lines.skip = TRUE, stringsAsFactors = FALSE)
## rename columns
names(df_Features) <- c("ordinal", "label")


## vector with the ordinals of the features of interest
idxMean <- grep("mean", df_Features$label)  ## this inclused mean() and meanFreq()
idxStd <- grep("std", df_Features$label)


####
#### Extract only the columns (measurements) of interest into data.table from the test and training data
####
## We know that all of the cols contain doubles (numeric)
## Construct a colClasses vector to be used in the call to read.table
##  to extract only the cols of interest from the file


## Prep columns indicating the ordinal of the feature measurement and its label
colCls <- c(rep(NA, 561))
colNms <- c(rep(character(), 561))

## TODO MGH
## Could be better than one of the apply functions, but need to get more comfortable with them!
## Get the measurement (column names)
for(i in seq(1,561,1)) {
    colCls[i] <- "NULL"
    if((i %in% idxMean) | (i %in% idxStd)) {
        colCls[i] <- "numeric"
        colNms <- append(colNms, df_Features$label[i])
    }
}

dfDataSet_Test <- loadTypeDataSet(folder="test/", xfile="X_test.txt", yfile="y_test.txt", subjfile="subject_test.txt", colNms=colNms, sampleType='test')
dfDataSet_Train <- loadTypeDataSet(folder="train/", xfile="X_train.txt", yfile="y_train.txt", subjfile="subject_train.txt", colNms=colNms, sampleType='training')

#####
##### Merge tables
#####

dfMerged <- merge(dfDataSet_Test, dfDataSet_Train, all=TRUE)
if(nrow(dfMerged) != (nrow(dfDataSet_Test) + nrow(dfDataSet_Train))) 
    stop("Unexpected error occurred - The number of rows in the merged data set was different than expected.")

### Set to 'cleaned' labels for column names
colMappings <- read.csv('./colmappings.csv', stringsAsFactors=FALSE, header=TRUE)
for(i in seq(1, nrow(colMappings), 1)) {
    colnames(dfMerged)[which(names(dfMerged) == colMappings$rawname[i])] <- colMappings$cleanname[i]
}


### Write out the tidied and merged dataset to file
write.csv(dfMerged, './mergedTidyDataSet.csv', row.names=FALSE)

### Function to calculate means 
getMean <- function(subj, act, measure) {
    ss <- dfMerged[which(dfMerged$subjectid == subj & dfMerged$activity == act),]
    vals <- ss[which(names(ss) == measure)]
    ret <- mean(vals[,1])
    ret
}

computedMeansDataSet <- data.frame(feature = colMappings$cleanname)
NUM_SUBJECTS <- 30
for(act in df_ActivityLabels$label) {
    for(subj in seq(1, NUM_SUBJECTS, 1)) {
        newColVals <- vector(mode='numeric', length=0)
        newColNm <- paste0('subject',subj, '.',act)
        for(imap in seq(1, nrow(colMappings), 1)) {
            meanVal <- getMean(subj, act, colMappings$cleanname[imap])
            newColVals[imap] <- meanVal
        }
        
        computedMeansDataSet[,newColNm] <- newColVals
    }
}

write.table(computedMeansDataSet, './computedMeansTidyDataSet.txt', row.names=FALSE)

