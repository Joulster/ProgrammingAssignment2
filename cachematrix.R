## MakeCacheMatrix and CacheSolve are two functions. First one sets, gets, sets inverse, gets inverse of matrix and caches the inverse in a list
## CacheSolve function calls for the inverse of matrix if its already cached or inverses the matrix and returns the inverse

## makeCacheMatrix does the following operations sets the matrix using << operator to assign value local to the environment
## gets the matrix, sets its inverse and gets its inverse in list 

makeCacheMatrix <- function(x = matrix()) {

  i <- NULL
  set <- function(y=matrix()){
    x<<-y
    i<-NULL
  }
  get <- function()x
  setinverse <- function(inv) i <<- inv
  getinverse <- function() i
  list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}


## CacheSolve function calls the inverse if its exists 
## else computes it using solve function 
# "i" denotes inverse of matrix 

cacheSolve <- function(x, ...) {
i <- x$getinverse()
if(!is.null(i)){
  message("getting cached data")
  return(i)
}
data <- x$get()
i <- solve(data,...)
x$setinverse(i)
i
}
