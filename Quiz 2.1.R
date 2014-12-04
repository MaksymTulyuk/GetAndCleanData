# Register an application with the Github API here https://github.com/settings/applications.
# Access the API to get information on your instructors repositories (hint: this is the url you want "https://api.github.com/users/jtleek/repos").
# Use this data to find the time that the datasharing repo was created. What time was it created?
# This tutorial may be useful (https://github.com/hadley/httr/blob/master/demo/oauth2-github.r). You may also need to run the code in the base R package and not R studio.

library(httr)
library(httpuv)
oauth_endpoints("github")
# Registered application at https://github.com/settings/applications;
#    Use any URL you would like for the homepage URL (http://github.com is fine)
#    and http://localhost:1410 as the callback url
myapp <- oauth_app("github", "9a70d229b44719da3269", "ec3ff8814b7b9f76f2d3e11c66ca873aadf83373")

# Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# Get reply on request
gtoken <- config(token = github_token)
stop_for_status(req)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)

# convert to JSON and access data
json.data <- fromJSON(req$url)
json.data$git_url[[5]]
json.data$created_at[[5]]
