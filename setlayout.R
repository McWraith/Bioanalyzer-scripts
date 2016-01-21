## This function sets the layout for multiple plots.
## As default it sets a 3 x 4 layout arranged by row
## Setting print.layout to TRUE will print the layout in the command line
## for inspection

setlayout <- function(x = 1:12, byrow = TRUE, ncol = 4, print.layout = FALSE) {
        
        if(print.layout == TRUE) {
                print(matrix(x, byrow = byrow, ncol = ncol))
        }
        
        layout(matrix(x, byrow = byrow, ncol = ncol))
}