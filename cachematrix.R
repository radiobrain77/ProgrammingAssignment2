## Two functions for calculating inverse of a matrix whilst 
## caching the results.

## Creates a list storing the matrix with functions to get and set
## the matrix and it's inverse.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  
  get <- function() x
  setinverse <- function(inv_mat) m <<- inv_mat
  getinverse <- function() m
  list (set = set,
        get = get,
        setinverse = setinverse,
        getinverse = getinverse)
}


## A function to calculate the inverse using the list from
## the makeCacheMatrix function. This function checks to see
## if x contains an already calculated inverse. If it is 
## already calculated then the cached copy is retrieved.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if (!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}
