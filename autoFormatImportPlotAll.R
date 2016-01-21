# Creates a 3x4 layout for the plots. Numbers define the order in which they are added.
# Change the order of the numbers to define the order of your plots
rows <- matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12), byrow = TRUE, ncol = 4)
#print(rows) 
layout(rows)

# Creates a vector containing titles for the plots. Added in the same order as plots.
# Put in manually
titles <- c('3.3.12 MeJA non-inf Ani Base', 
            '3.3.12 MeJA inf Ani Base', 
            '3.3.14 MeJA non-inf Ani Base', 
            '3.3.14 MeJA inf Ani Base', 
            '3.3.12 MeJA non-inf Ani Base',
            '3.3.12 MeJA inf Ani Base', 
            '3.3.14 MeJA non-inf Ani Base', 
            '3.3.14 MeJA inf Ani Base', 
            '3.3.12 MeJA non-inf Ani Base',
            '3.3.12 MeJA inf Ani Base',
            '3.3.14 MeJA non-inf Ani Base',
            '3.3.14 MeJA inf Ani Base')

for(i in c(1:12)) {
  nam <- paste("Sample", i, sep = "") # Creates names for data frames: 'Sample1' to 'Sample12'
  # Searches for files within the working directory with a phrases: 'Sample1.csv' to 'Sample12.csv'. Return the name of the file.
  a <- grep(paste("Sample", i, ".csv", sep = ""), list.files(getwd()), value = TRUE) 
  assign(nam, read.csv(a, skip = 17, nrows = 1060)) # Reads the file, skipping first 17 lines.
  b <- get(nam)             # 'Calls' the names 'Sample1' to 'Sample12' to appropriate data frames
  
  plot(b$Time, b$Value,     # values for x-axis and y-axis, respectively
       type = 'l',          # Defines the type of the plot: 'l' -> 'line' plot
       col = 'red',         # Defines the colour of the plot
       xlim = c(18, 53),    # limits the x-axis to the given values
       xlab = 'Time (sec)', # x-axis label
       ylab = '(FU)',       # y-axis label
       main = titles[i])    # main title extracted from the vector 'titles'
}