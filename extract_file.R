## This function extracts a file as is if it contains only a factor.
## Otherwise, it extracts the mean and sd of each row in the file

extract_file <- function(file, var_name) {
        if (grepl("^subject|^y", var_name)) {
                dat = read.table(file)
                print(paste("successfully read", 
                            paste(c("rows:", "cols:"), 
                                  dim(dat), collapse = ", ")))
                colnames(dat) = var_name 
        } else {
                dat = read.table(file)
                print(paste("successfully read", 
                            paste(c("rows:", "cols:"), 
                                  dim(dat), collapse = ", ")))
                mean.f = apply(dat, 1, function(x) mean(x, na.rm = T))
                sd.f = apply(dat, 1, function(x) sd(x, na.rm = T))
                dat = data.frame(mean.f, sd.f)
                colnames(dat) = paste0(var_name, "_", c("mean", "sd"))
        }
        return(dat)
}
