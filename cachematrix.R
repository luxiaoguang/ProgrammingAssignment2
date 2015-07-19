## Overall these two functions together can get the inverse of a matrix(assume 
## that the matrix supplied is always invertible).
## If a new matrix created, the function will calculate the inverse. If no new 
## matrix created, the fucntion will just get the inverse from cache.
## This will save a lot of time when we need to get the inverse for the same 
## matrix for many times.

## This function creates a new matrix(assume that the matrix supplied is always 
## invertible) that will be inversed. And clear last time inverse result.

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        set <- function(y) {
                x <<- y
                i <<- NULL
                
        }
        get <- function()
                x
        
        setinverse <- function(solve)
                i <<- solve
        
        getinverse <- function()
                i
        
        list(
        set = set,get = get,setinverse = setinverse,getinverse = getinverse
        )
}


## This function will get last time inverse of the matrix if no new matrix 
## created.
## If a new matrix created, the function will calculate the inverse. Save the 
## inverse result for others to get.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i <- x$getinverse()
        if (!is.null(i)) {
                message("getting cached data")
                return(i)
                ## get last time inverse of 'x' from cache.
        }
        
        data <- x$get()
        i <- solve(data,...)
        x$setinverse(i)
        ## Calculate the inverse of 'x' and save it in cache.
}
