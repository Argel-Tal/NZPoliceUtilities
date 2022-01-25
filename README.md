# NZPoliceUtilities
## Helper R package to assist the design of R products for New Zealand Police's (NZP) National Road Policing Centre (NRPC).

Will contain useful functions and non-private data for quick reference and auto-formatting, _i.e._ 
- loading the approved NZP colours as an R theme, for use in graphing
- pulling in and pushing out files from arbitrary paths, read from elsewhere and stored in env instead of as plaintext in codebase
    
This is NOT to be used to store filepaths, actual files or data on NZP processes/people.

## To load this package in R:
1. Install the required packages for loading non-CRAN packages
2. Load this package
``` R
install.packages("devtools") # only have to do this if `devtools` has never been installed before
devtools::install_github("Argel-Tal/NZPoliceUtilities")
```
#### To see the full list of exported functions:
``` R
library("NZPoliceUtilities")
ls("package:NZPoliceUtilities")
```

## _WFH to do_
Convert this to binaries so it can be loaded wihtout Rtools 🙄😠

# Credits
## Author(s): 
#### Jack MacCormick
- Phone:  `+64 21 846 817`
- Email:  `jack.maccormick@police.govt.nz`
## Style attributions:
#### Fong Chun Chan
- How to make R packages: blog post
  + https://tinyheero.github.io/jekyll/update/2015/07/26/making-your-first-R-package.html
- README design: R package `tinyutils`
  + https://github.com/tinyheero/tinyutils

