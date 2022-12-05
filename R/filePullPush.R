#' Load a dataset from a specified path
#'
#' This function returns the path to a file from a specified path, where the file 
#' is also specified
#'
#' @param filePathIn Path to the input file
#' @param fileName File name and extension
#' @return filepath to data file
#' @export
filePathedToRead <- function(filePathIn, fileName){
  return(file.path(filePathIn, fileName))
} # end filePathedToRead


#' Save out a dataset to a specified path
#'
#' This function writes out a file to a specified path, defaulting to .txt
#'
#' @param dataSet the dataset to be written out (as .txt)
#' @param filePathOut Path to where the file should be written
#' @param fileName File name and extension
#' @return nothing, writes file
#' @export
filePathedTableWrite <- function(dataSet, filePathOut, fileName, extension = ".txt", 
                                 sep1 = ",", 
                                 row.names1 = FALSE, 
                                 col.names1 = TRUE){
  write.table(dataSet, stringr::str_c(filePathOut,"\\",fileName, extension), 
              sep = sep1, 
              row.names = row.names1, 
              col.names = col.names1
  )
} # end filePathedTableWrite
