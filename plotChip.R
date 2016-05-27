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