# How many characters are in the 10th, 20th, 30th and 100th lines of HTML from this page: 
#
# http://biostat.jhsph.edu/~jleek/contact.html 
#
# (Hint: the nchar() function in R may be helpful)

download.file("http://biostat.jhsph.edu/~jleek/contact.html", "page.html")
page <- readLines("page.html")
lines <- c(10, 20, 30, 100)
for (line in lines) {
    nchar(page[i])
}
