library(XML)

print("Getting BATTING info from cricinfo.com")

dir.create("~/Desktop/data/batting")
setwd('~/Desktop/data/batting')

theurl <- "http://stats.espncricinfo.com/ci/engine/stats/index.html?class=2;spanmin1=01+Jan+2005;spanval1=span;template=results;type=batting;wrappertype=print"
data <- readHTMLTable(theurl)
pages = as.integer(unlist(strsplit(as.character(as.data.frame(data[2])$NULL.V1),"of"))[2])
data <- as.data.frame(data$'Overall figures')
write.csv(data,file='batting.1.csv',eol='\n',row.names = FALSE,quote = TRUE)
i=2
while (i <= pages){
  theurl <- paste0("http://stats.espncricinfo.com/ci/engine/stats/index.html?class=2;page=",i,";spanmin1=01+Jan+2005;spanval1=span;template=results;type=batting;wrappertype=print")
  data <- readHTMLTable(theurl)
  print(paste("got the data of ",as.character(as.data.frame(data[2])$NULL.V1)))
  data <- as.data.frame(data$'Overall figures')
  file_name= paste0('batting.',i,'.csv')
  print(paste("saving page ",i))
  write.csv(data,file=file_name,eol='\n',row.names = FALSE,quote = TRUE)
  i = i + 1
}

print("Getting BOWLING info from cricinfo.com")

dir.create("~/Desktop/data/bowling")
setwd('~/Desktop/data/bowling')

theurl <- "http://stats.espncricinfo.com/ci/engine/stats/index.html?class=1;spanmin1=01+Jan+2005;spanval1=span;template=results;type=bowling;wrappertype=print"
data <- readHTMLTable(theurl)
pages = as.integer(unlist(strsplit(as.character(as.data.frame(data[2])$NULL.V1),"of"))[2])
data <- as.data.frame(data$'Overall figures')
print("saving page 1")
write.csv(data,file='bowling.1.csv',eol='\n',row.names = FALSE,quote = TRUE)
i=2
while (i <= pages){
  theurl <- paste0("http://stats.espncricinfo.com/ci/engine/stats/index.html?class=1;page=",i,";spanmin1=01+Jan+2005;spanval1=span;template=results;type=bowling;wrappertype=print")
  data <- readHTMLTable(theurl)
  print(paste("got data of ",as.character(as.data.frame(data[2])$NULL.V1)))
  data <- as.data.frame(data$'Overall figures')
  file_name= paste0('bowling.',i,'.csv')
  print(paste("saving page ",i))
  write.csv(data,file=file_name,eol='\n',row.names = FALSE,quote = TRUE)
  i = i + 1
}

print("Getting FIELDING info from cricinfo.com")

dir.create("~/Desktop/data/fielding")
setwd('~/Desktop/data/fielding')

theurl <- "http://stats.espncricinfo.com/ci/engine/stats/index.html?class=2;spanmin1=1+Jan+2005;spanval1=span;template=results;type=fielding;wrappertype=print"
data <- readHTMLTable(theurl)
pages = as.integer(unlist(strsplit(as.character(as.data.frame(data[2])$NULL.V1),"of"))[2])
data <- as.data.frame(data$'Overall figures')
print("saving page 1")
write.csv(data,file='fielding.1.csv',eol='\n',row.names = FALSE,quote = TRUE)
i=2
while (i <= pages){
  theurl <- paste0("http://stats.espncricinfo.com/ci/engine/stats/index.html?class=2;page=",i,";spanmin1=1+Jan+2005;spanval1=span;template=results;type=fielding;wrappertype=print")
  data <- readHTMLTable(theurl)
  print(paste("got data of ",as.character(as.data.frame(data[2])$NULL.V1)))
  data <- as.data.frame(data$'Overall figures')
  file_name= paste0('fielding.',i,'.csv')
  print(paste("saving page ",i))
  write.csv(data,file=file_name,eol='\n',row.names = FALSE,quote = TRUE)
  i = i + 1
}