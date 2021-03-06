## Solution for the ProgammingAssignment2, just click on the file to check the solution.
## Programming Assignment 2: Lexical Scoping 
## Assignment: write a pair of functions that cache the inverse of a matrix.
##makeCacheMatrix: This function creates a special "matrix" #object that can cache its inverse.

makeCacheMatrix <- function(x = numeric()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinv <- function(solve) m <<- solve
        getinv <- function() m
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}

##This function computes the inverse of the special "matrix"
##returned by makeCacheMatrix above. If the inverse has already
##been calculated (and the matrix has not changed), then the
##cachesolve should retrieve the inverse from the cache.
##The inverse of a square matrix can be done with the solve function in R.



cacheSolve <- function(x, ...) {
        m <- x$getinv()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)   
        x$setinv(m)
        m
}

## To test the functions:
## m<-makeCacheMatrix(matrix(1:4,2,2))
## m$get()
##      [,1] [,2]
## [1,]    1    3
## [2,]    2    4
## m$get()
##      [,1] [,2]
## [1,]    1    3
## [2,]    2    4
## cacheSolve(m)
##      [,1] [,2]
## [1,]   -2  1.5
