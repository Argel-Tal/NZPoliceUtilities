#' Load a dataset from a specified path
#'
#' This function loads a file from a specified path, where the file 
#' type is also specified
#'
#' @param filePathIn Path to the input file
#' @param fileName File name and extension
#' @return dataset
#' @export
filePathedTableRead <- function(filePathIn, fileName, sep1 = ","){
  return(read.table(stringr::str_c(filePathIn, "/", fileName), sep = sep1))
} # end filePathedTableRead




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
                                 row.names1 = TRUE, 
                                 col.names1 = TRUE){
  write.table(dataSet, stringr::str_c(filePathOut,"\\",fileName, extension), 
              sep = sep1, 
              row.names = row.names1, 
              col.names = col.names1
  )
} # end filePathedTableWrite