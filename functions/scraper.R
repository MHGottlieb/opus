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
  date_end <- as.Date("2018-12-15")

# Scraping URL's to news stories on dr.dk ---------------------------------

  days <- as.integer(difftime(date_end, date_start))
  articles <- NULL
  
  for(i in 0:days){
    date_i <- format(date_start+i, "%d%m%Y")
    url <- paste0(url_base, date_i)
    temp <- GET(url)
    temp <- htmlParse(temp)
    links <- cbind(as.vector(xpathSApply(temp, "//h3/a/@href")), date_i)
    articles <- unique(rbind(links, articles))
    message(paste("scraping", date_i, "-", length(articles), "urls collected"))
  }
  
  remove(temp, links, i, days, url, date_i, url_base)

  # Creating data frame -----------------------------------------------------
  
  articles <- data.frame(articles)
  names(articles) <- c("url", "date")
  
# Scraping text for each article ------------------------------------------
 
articles$text <- NA
  
  for(i in 1:nrow(articles)){
    temp <- GET(paste0("www.dr.dk", articles$url[i]))
    temp <- htmlParse(temp)
    text <- xpathSApply(temp, "//p", xmlValue)
    text <- paste(text, collapse=" ")
    articles$text[i] <- text 
    message(paste("scraping article", i, "of", nrow(articles) ))
  }


# Counting words in each article ------------------------------------------
  
  articles$words <- lengths(strsplit(articles$text, "\\W+"))
