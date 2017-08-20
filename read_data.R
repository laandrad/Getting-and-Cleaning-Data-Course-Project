library(dplyr)

folder = "/Users/alejandro/Dropbox (Personal)/Coursera Data Science/Cleaning Data"

folders = list(
        paste0(folder, "/UCI HAR Dataset/train/"),
        paste0(folder, "/UCI HAR Dataset/train/Inertial Signals/"),
        paste0(folder, "/UCI HAR Dataset/test/"),
        paste0(folder, "/UCI HAR Dataset/test/Inertial Signals/")
)

file_in_folder = lapply(folders, function(f) {
        list.files(f, ".txt") %>% paste0(f, .)    
        }
) %>% unlist

var_names = strsplit(file_in_folder, "/") %>% unlist %>% .[grep(".txt", .)] %>% 
                strsplit(., ".txt") %>% unlist %>% tolower 

n.test = read.table(file_in_folder[13]) %>% nrow
n.train = read.table(file_in_folder[1]) %>% nrow
test = "test" %>% rep(n.test) %>% data.frame
train = "train" %>% rep(n.train) %>% data.frame

source(paste0(folder, "/Course Project/help_functions.r"))
for (f in seq_along(file_in_folder)) {
        print(paste("reading file:", 
                    var_names[f], f, "of", length(file_in_folder)))
        
        if (grepl("test", var_names[f])) {
                var_name = sub("_test", "", var_names[f])
                dat = extract_file(file_in_folder[f], var_name)
                test = data.frame(test, dat)
                        
        } else {
                var_name = sub("_train", "", var_names[f])
                dat = extract_file(file_in_folder[f], var_name)
                train = data.frame(train, dat)
        }
}

dim(train)
dim(test)

dat = bind_rows(train, test)
dim(dat)

act_labls = read.table(paste0(folder, "/UCI HAR Dataset/activity_labels.txt"))
dat$y = dat$y %>% factor(levels = 1:6, labels = act_labls$V2)
colnames(dat)[c(1,5)] = c("condition", "activity_label")

write.csv(dat, paste0(folder, "/Course Project/wearables.csv"))
