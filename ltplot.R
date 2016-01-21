## This function creates a scatter plot with type 'l'
## and with set labels and x-axis limits

ltplot <- function(x) {
        layout(1) # Resets layout to a single plot
        
        plot(x,  
             type = "l", 
             xlab = "Time (sec)", 
             ylab = "(FU)", 
             col = "red", 
             xlim = c(18,55))
}