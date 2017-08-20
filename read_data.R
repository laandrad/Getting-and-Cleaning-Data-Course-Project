library(dplyr)
setwd("/Users/alejandro/Dropbox (Personal)/Coursera Data Science/Cleaning Data/Course Project")
source("extract_file.r")
source("cachedownload.r")

link = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
temp = tempfile()
makeCache = makeCacheZipFile(link)
cacheDownload(makeCache, temp)
zip_folder = unzip(temp)

var_names = strsplit(zip_folder, "/") %>% unlist %>% .[grep(".txt", .)] %>% 
                strsplit(., ".txt") %>% unlist %>% tolower 

n.test = read.table(zip_folder[grep("test/y_test", zip_folder)]) %>% nrow
n.train = read.table(zip_folder[grep("train/y_train", zip_folder)]) %>% nrow
test = "test" %>% rep(n.test) %>% data.frame
train = "train" %>% rep(n.train) %>% data.frame

for (f in seq_along(zip_folder)) {
        print(paste("reading file:", 
                    var_names[f], f, "of", length(zip_folder)))
        
        if (grepl("test|train", zip_folder[f])) {
                if (grepl("test", var_names[f])) {
                        var_name = sub("_test", "", var_names[f])
                        dat = extract_file(zip_folder[f], var_name)
                        test = data.frame(test, dat)
                        
                } else {
                        var_name = sub("_train", "", var_names[f])
                        dat = extract_file(zip_folder[f], var_name)
                        train = data.frame(train, dat)
                }  
        }
}

dim(train)
dim(test)

dat = bind_rows(train, test)
dim(dat)

act_labls = read.table(zip_folder[grep("act", zip_folder)])
dat$y = dat$y %>% factor(levels = 1:6, labels = act_labls$V2)
dat = rename(dat, activity_label = y, condition = .)
names(dat)

write.csv(dat, "wearables.csv")
