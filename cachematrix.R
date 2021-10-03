## The following code is to create a special matrix object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
 inv <- NULL
     
     ## The following code is to to set the matrix
     set <- function(y) {
          x <<- y
          inv <<- NULL
     }
     
     ## The following code is to get the matrix
     get <- function() x
     
     # The following code is to set the inverse of the matrix   
     setinverse <- function(inverse) inv <<- inverse
     
     # The following code is to get the inverse of the matrix
     getinverse <- function() inv
     
     ## The following code return a list of the methods    
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## The following code is to compute the inverse of the special matrix returned by "makeCacheMatrix"

cacheSolve <- function(x, ...) {
        ## The following code is to return a matrix that is the inverse of 'x'
        inv <- x$getinverse()
     
        ## The following code is to return the inverse if its already set
        if(!is.null(inv)) {
          message("getting cached result")
          return(inv)
     }
     ## The following code is to get the matrix 
     data <- x$get()
     
     ## The following code is to calculate the inverse using matrix multiplication
     inv <- solve(data, ...)
     
    ## The following code is to set the inverse to the object
     x$setinverse(inv)
     
     ## The following code is to return the matrix
     inv
}
