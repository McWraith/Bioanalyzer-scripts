loadChip <- function(directory = getwd()) {
        chip_list <- list()
        for(i in c(1:12)) {
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
        colnames(chip_df) <- c("Sample1_Time", "Sample1_Value",
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
        chip_df
}