## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

##makeCacheMatrix: 
## This function creates a special "matrix" object 
## that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  ## set the matrix value
  set <- function(j){
    x <<- j
    i <<- NULL
  }
  ## get the matrix value
  get <- function(){
    x 
  }
  ## set the inverse matrix vlaue
  setInverse<- function(inverse){
    i <<- inverse
  } 
  ## get the inverse matrix value
  getInverse <- function(){
    i
  }
  ## return a list
  list(set = set, get= get, 
       setInverse = setInverse, 
       getInverse= getInverse)
}


## Write a short comment describing this function

##cacheSolve: 
##  This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
##  If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  i <- x$getInverse()
  ##Chekc whether the inverse is already calculated or not.
  ##cahced
  if(!is.null(i)){
      message("getting cached data")
      return(i)
  }
  data <- x$get()

  ##solve() function
  ## Computing inverse of square matrix
  ##If X is a square invertible matrix, 
  ## then solve(X) returns its inverse.
  i <- solve(data, ...)
  
  x$setInverse(i)
  i
}
