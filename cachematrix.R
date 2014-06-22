## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## create an object that caches matrix and provides following functions.
## 1. set a matrix
## 2. get a matrix that is previously set.
## 3. set inverse of matrix
## 4. get inverse of matrix that is previously set.

makeCacheMatrix <- function(x = matrix()) {
    inverseMatrix <- NULL
    set <- function(argMatrix) {
        globalMatrix <<- argMatrix
        inverseMatrix <<- NULL
    }
    get <- function() globalMatrix
    setInverseMatrix <- function(argInverseMatrix) inverseMatrix <<- argInverseMatrix
    getInverseMatrix <- function() inverseMatrix
    list(set = set, get = get,
         setinverse = setInverseMatrix,
         getinverse = getInverseMatrix)
    
}


## Write a short comment describing this function
## get inverse of a matrix from object, 
## 1. from cached data, if already calculated.
## 2. calculate fresh, cache the inverse, and return inverse

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inverseM <- x$getinverse()
    if(!is.null(inverseM)) {
        message("getting cached data")
        return(inverseM)
    }
    m <- x$get()
    inverseM <- solve(m)
    x$setinverse(inverseM)
    inverseM
}
