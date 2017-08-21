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
dat = select(dat, subject, condition, activity_label, x_mean, x_sd, body_acc_x_mean:total_acc_z_sd)
str(dat)

write.table(dat, "wearables.txt", row.names = F)

names(dat)
dat2 = group_by(dat, subject, activity_label) %>% 
        summarise(mean(x_mean), mean(x_sd), mean(body_acc_x_mean),
                  mean(body_acc_x_sd), mean(body_acc_y_mean), mean(body_acc_y_sd),
                  mean(body_acc_z_mean), mean(body_acc_z_sd), mean(body_gyro_x_mean),
                  mean(body_gyro_x_sd), mean(body_gyro_y_mean), mean(body_gyro_y_sd),
                  mean(body_gyro_z_mean), mean(body_gyro_z_sd), mean(total_acc_x_mean),
                  mean(total_acc_x_sd), mean(total_acc_y_mean), mean(total_acc_y_sd),
                  mean(total_acc_z_mean), mean(total_acc_z_sd))
head(dat2)
write.table(dat2, "wearables_summary.txt", row.names = F)
