## The following two functions allow the user to store a zip file
## in the cache so that R does not have to download this file every time

## makeCacheZipFile initializes the url
## Example:
## makeCache = makeCacheZipFile(url)

makeCacheZipFile <- function(url) {
        m <- NULL
        set <- function(y) {
                url <<- y
                m <<- NULL
        }
        get <- function() url
        setdownload <- function(download) m <<- download
        getdownload <- function() m
        list(set = set, get = get,
             setdownload = setdownload,
             getdownload = getdownload)
}

## cachedownload solves whether to download or not from a makeCacheZipFile object.
## Example:
## cacheDownload(url)

cacheDownload <- function(x, ...) {
        m <- x$getdownload()
        if (!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- download.file(data, ...)
        x$setdownload(m)
        m
}
