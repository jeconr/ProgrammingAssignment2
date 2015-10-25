
# set length of square matrix to test
n = 100

# create a square matrix of length n with nxn random variables 
t <- matrix(runif(n*n,-1,1), nrow=n, ncol=n)

# create special Matrix object using "makeCacheMatrix" function
u <- makeCacheMatrix(t)

# Create inverse matrix
v <- cacheSolve(u)

# Create inverse matrix again (should read "getting cached data" instead of recomputing)
v <- cacheSolve(u)

# Multiply solved-matrix by original-matrix, 
# this should result in the identity matrix (1's on the diagonal & 0's otherwise) 
# round the result to 10 decimal places 
w <- round(v %*% t , 8)

#print the result
ifelse( all(w == diag(n)),
        print('Identity Matrix Produced, solve successful'),
        print('Identity Matrix not produced, solve unsuccessful'))
    
#look at first 10 rows and columns of resulting matrix, w 
print( head(w,min(n,10))[,1:min(n,10)] )


