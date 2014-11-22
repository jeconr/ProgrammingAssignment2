## These functions create a special object (a list) containing a matrix,
## cached version of it's inverse as wee as functions that access 
## said matrix and inverse.  This cached inverse will be returned if 
## the inverse has already been calculated, hence preventing the potential 
## costly recalculations of the matrix 



## makeCacheMatrix will create the vectors and functions and return them in the 
## special object-list 
## argument 'x' is the invertible matrix for which the inverse may be calculated
## 'inverse' is the variable which may cache the inverse of x
## set(), get(), setinverse() and getinverse() are respective accessor functions 
makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL
    set <- function(NewMatrix){
        x <<- NewMatrix
        inverse <<- NULL
    }
    get <- function() x
    setinverse <- function(newInverse) inverse <<- newInverse
    getinverse <- function() inverse
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## cacheSolve will calculate and cache the inverse the matrix in x, if it has not 
## already been calculated.  Otherwise it will return the cached inverse matrix
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inverse <- x$getinverse()
    if(!is.null(inverse)) {
        message("getting cached data")
        return(inverse)
    }
    data <- x$get()
    inverse <- solve(data, ...)
    x$setinverse(inverse)
    inverse
}
