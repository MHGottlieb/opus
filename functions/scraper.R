# Author: MHGottlieb
# Date: Sun Dec 16 17:08:06 2018
# --------------
# Description:
# web-scraper for www.dr.dk/nyheder/allenyheder
# Bruger RCurl, se: https://cran.r-project.org/web/packages/RCurl/RCurl.pdf
# --------------


# libraries ---------------------------------------------------------------
  
  library(httr)
  library(XML)

# settings

  url_base <- "http://www.dr.dk/nyheder/allenyheder/"
  date_start <- as.Date("2018-07-01")
  date_end <- as.Date("2018-12-16")
  
# scraper URL'er på dr.dk-nyheder
  
  days <- as.integer(difftime(date_end, date_start))
  
  for(i in 0:days){
    date_i <- date_start + i
    url <- paste0(url_base, format(date_start, "%d%m%Y"))
  }
  
  
  date_i <- date_start + i
  url_date_i <- paste0(url, format(date_start, "%d%m%Y"))
  
  
  
  temp <- GET(url_date_i)
  temp <- htmlParse(temp)
  links <- as.vector(xpathSApply(temp, "//h3/a/@href"))
  #free(temp)