## This function creates a red line type scatter plot 
## with default axis labels and x-axis limits
## It also resets the layout to a single plot by default

ltplot <- function(x, type = "l", 
                   xlab = "Time (sec)", 
                   ylab = "(FU)", 
                   col = "red", 
                   xlim = c(18,55),
                   reset = TRUE) {
        if(reset == TRUE) {
                layout(1) # Resets layout to a single plot
        }
        
        plot(x, type = type, xlab = xlab, ylab = ylab, col = col, xlim = xlim)
}