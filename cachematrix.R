## Matrix inversion is usually a costly computation and their may be some 
## benefit to caching the inverse of a matrix rather than compute it 
## repeatedly. This assignment is to write a pair of functions that cache
## the inverse of a matrix.

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
	## inv is initialized to NULL
	i <- NULL
	
	## setter for the original matrix to solve and set inv back to NULL
    set <- function(y) {
            x <<- y
            i <<- NULL
    }
	## getter for the original matrix
    get <- function() x
	
    ## setter for inverse matrix
	setinverse <- function(inverse) i <<- inverse
    
	## getter for inverse matrix
	getinverse <- function() i
    
	## return information
	list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## This function computes the inverse of the special "matrix" returned by 
## makeCacheMatrix above. If the inverse has already been calculated (and the 
## matrix has not changed), then the cachesolve should retrieve the inverse
## from the cache.

cacheSolve <- function(x, ...) {
        ## get inverse matrix from the special matrix object
		i <- x$getinverse()
        
		## check if an inverse matrix is already cached, if so return the value
		if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        
		## if no cached value for inverse matrix, get the original matrix and 
		    ## compute the inverse
		data <- x$get()
        i <- solve(data, ...)
        
		 ## store and return the inverse matrix
		x$setinverse(m)
        i
}
