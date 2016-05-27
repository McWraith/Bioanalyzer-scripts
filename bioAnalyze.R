bioAnalyze <- function(directory = getwd(), no.samples = 12) {
  cur.chip <- loadChip(directory, no.samples)
  setlayout(x = 1:no.samples)
  plotChip(cur.chip, directory, no.samples)
}