## Bioanalyzer 'package' - Contains functions to analyse data 
## from Bioanalyzer chips

##
ltplot <- function(...,
                   type = "l", 
                   xlab = "Time (sec)", 
                   ylab = "(FU)", 
                   col = "red", 
                   xlim = c(18,55),
                   reset = TRUE) {
  if(reset == TRUE) {
    layout(1) # Resets layout to a single plot
  }
  
  plot(..., type = type, xlab = xlab, ylab = ylab, col = col, xlim = xlim)
}
##
setlayout <- function(x = 1:12, byrow = FALSE, ncol = 4, print.layout = FALSE) {
  
  if(print.layout == TRUE) {
    print(matrix(x, byrow = byrow, ncol = ncol))
  }
  
  layout(matrix(x, byrow = byrow, ncol = ncol))
}
##
loadChip <- function(directory = getwd(), no.samples = 12) {
  chip_list <- list()
  for(i in c(1:no.samples)) {
    # Creates names for data frames: 'Sample1' to 'Sample12'
    nam <- paste("Sample", i, sep = "") 
    # Searches for files within the directory 
    # with a phrases: 'Sample1.csv' to 'Sample12.csv'. 
    # Returns the name of the file.
    a <- grep(paste("Sample", i, ".csv", sep = ""), 
              list.files(path = directory), value = TRUE)
    # Reads appropriate lines from the file and adds it to a list
    
    chip_list <- append(chip_list, 
                        read.csv(a, skip = 17, nrows = 1060))
  }
  chip_df <-  as.data.frame(chip_list)
  cnam <- c("Sample1_Time", "Sample1_Value",
            "Sample2_Time", "Sample2_Value",
            "Sample3_Time", "Sample3_Value",
            "Sample4_Time", "Sample4_Value",
            "Sample5_Time", "Sample5_Value",
            "Sample6_Time", "Sample6_Value",
            "Sample7_Time", "Sample7_Value",
            "Sample8_Time", "Sample8_Value",
            "Sample9_Time", "Sample9_Value",
            "Sample10_Time", "Sample10_Value",
            "Sample11_Time", "Sample11_Value",
            "Sample12_Time", "Sample12_Value")
  colnames(chip_df) <- cnam[1:(no.samples*2)]
  chip_df
}
##
plotChip <- function(chip, directory = getwd(), no.samples = 12, ...) {
  title.table <- readLines(paste(directory, 'titles.txt', sep = '/'), 
                                 warn = FALSE)
  t = 0
  for(i in c(1:no.samples*2)) {
    t = t+1
    ltplot(x = chip[,i-1], y = chip[,i], ..., 
           main = title.table[t], reset = FALSE)
  }
}
##
bioAnalyze <- function(directory = getwd(), no.samples = 12) {
  cur.chip <<- loadChip(directory, no.samples)
  setlayout(x = 1:no.samples)
  plotChip(cur.chip, directory, no.samples)
}