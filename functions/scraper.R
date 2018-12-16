# Author: MHGottlieb
# Date: Sun Dec 16 17:08:06 2018
# --------------
# Description:
# web-scraper for www.dr.dk/nyheder/allenyheder
# Bruger RCurl, se: https://cran.r-project.org/web/packages/RCurl/RCurl.pdf
# --------------


# Libraries ---------------------------------------------------------------
  
  library(httr)
  library(XML)

# Settings ----------------------------------------------------------------
  
  url_base <- "http://www.dr.dk/nyheder/allenyheder/"
  date_start <- as.Date("2018-07-01")
  date_end <- as.Date("2018-12-16")


# Scraping URL's to news stories on dr.dk ---------------------------------

  days <- as.integer(difftime(date_end, date_start))
  urls <- NULL
  
  for(i in 0:days){
    date_i <- date_start + i
    url <- paste0(url_base, format(date_start+i, "%d%m%Y"))
    temp <- GET(url)
    temp <- htmlParse(temp)
    links <- as.vector(xpathSApply(temp, "//h3/a/@href"))
    urls <- unique(c(links, urls))
    message(paste("scraping", date_i, "-", length(urls), "urls collected"))
  }

  remove(temp, links, i, days, url, date_i, url_base)
  

# Scraping text for each article ------------------------------------------

 # for(i in 1:length(urls)){
    temp <- get(paste0("www.dr.dk/", urls[i]))
    temp <- htmlParse(temp)
    
    
 # }
  
  
  
  
  
  save.image()
  