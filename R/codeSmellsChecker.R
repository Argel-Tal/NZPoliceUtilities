#' Function which scans any code file, and checks it for various code conventions
#'
#' @param codePath  : path to file to be checked
#' @param lineLengThresh  : desired soft max for line length
#' Things checked for
#' - un-spaced commas
#' - un-spaced operators
#' - excessively long lines
#'
#' @export
codeSmellsChecker <- function(codePath, lineLengThresh = 100){
  # read in code file
  codeRaw <- readr::read_file(codePath)
  codeText <- stringr::str_split(codeRaw, "\n")
  
  # compute count of and identify where commas are un-spaced
  countCommaNoSpace <- sum(stringr::str_extract_all(codeRaw, ",.")[[1]]!=", ")
  listCommaNoSpace <- unlist(stringr::str_extract_all(codeRaw, ",."))[which(stringr::str_extract_all(codeRaw, ",.")[[1]]!=", ")]
  # compute count of and identify where operators are un-spaced
  countOperatorNoSpace <- length(setdiff(stringr::str_extract_all(codeRaw, "[\\+\\-\\*].")[[1]], 
                                         unlist(stringr::str_match_all(str_extract_all(codeRaw, "[\\+\\-\\*].")[[1]], ". "))))
  listOperatorNoSpace <- setdiff(stringr::str_extract_all(codeRaw, "[\\+\\-\\*].")[[1]], 
                                 unlist(stringr::str_match_all(stringr::str_extract_all(codeRaw, "[\\+\\-\\*].")[[1]], ". ")))
  
  # compute count of and identify where line lengths exceed a user defined (defaulted) threshold
  # set up lines for length counting
  lineStripped <- stringr::str_remove_all(codeText[[1]], "\\r")
  empty_vec <- rep(NA, length(lineStripped))
  # iterate through lines
  for (line in c(1:length(lineStripped))){
    empty_vec[line] <- nchar(lineStripped[line])
  } # end for
  countLongLines <-  sum(empty_vec>lineLengThresh)
  listLongLines <- which(empty_vec>lineLengThresh)
  
  # print out findings
  cat("file: ", str_split(codePath, "/")[[1]][length(str_split(codePath, "/")[[1]])],
      "\n Has", countCommaNoSpace, "non-spaced commas;\n\t", listCommaNoSpace, 
      "\n Has", countOperatorNoSpace, "non-spaced operator;\n\t", listOperatorNoSpace,
      "\n Has", countLongLines, "lines over", lineLengThresh, "characters long;\n\t line no.s:", listLongLines
      ) # end cat
  
} # end function codeSmellsChecker()



