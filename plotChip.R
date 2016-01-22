plotChip <- function(chip, type = "l", 
                     xlab = "Time (sec)", 
                     ylab = "(FU)", 
                     col = "red", 
                     xlim = c(18,55)) {
        
        for(smpl in chip) {
                # 'Calls' the objects 'Sample1' to 'Sample12' 
                # of appropriate data frames
                b <- get(nam)             
                # Plots a red, line scatter plot for each data frame
                # with pre-defined axis lables and x-axis limits
                plot(b$Time, b$Value,
                     type = type,
                     col = col,
                     xlim = xlim,
                     xlab = xlab,
                     ylab = ylab,
                     main = titles[i])
        }
}