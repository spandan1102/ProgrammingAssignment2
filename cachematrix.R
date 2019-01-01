##  write a pair of functions that cache the inverse of a matrix.

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  invm <- NULL
  get <- function() x
  setinv <- function(inversem) invm <<- inversem
  getinv <- function() invm
  list (get = get, setinv = setinv, getinv = getinv)
}

## This function will call the above function and first find the cache of inverse. If ot doesn't find, then it calculates and puts it in cache

cacheSolve <- function(x, ...) {
  m <- x$getinv()
  if(!is.null(m)){
    message("Getting Cache Data")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$setinv(m)
  m
}
