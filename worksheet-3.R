# Installations
#apt-get install libssl-dev
install.packages('acs')

# load httr namespace

library(httr)

# define the api host, path and query

host <-"https://api.census.gov"
path <- '/data/2015/acs5' # path to the data
query <- list('get'="NAME,AIANHH",
              "for"='county',
               "in"='state:24')
response <- GET(url = host, path = path, query = query)
response 

# get a household income variable for tracts in MD
## http://api.census.gov/data/2015/acs5/variables/B19001_001E.json

query <- list('get'='NAME,B19001_00E',
              'for'='tract:*',
              'in' = 'state:24')
response <- GET(url = host, path = path, query = query)

# check the status

...(response)

# wrestle into a data frame

parsed <- ...(response, 'parsed')
content <- matrix(unlist(parsed), ncol = 5, byrow = TRUE)
df <- ...
names(df) <- ...
df$B19001_001E <- ...(df$B19001_001E)

# the "acs" package for R

library(acs)
api.key.install(key = '0bcb5e6099a0435c2ffd0b976a1d70263ca3b8d7')

geo <- geo.make(state='MD', county = '*', tract = '*')
result <- acs.fetch(endyear = 2015, geo=geo,table.number="B19001")
result
str(result)
# wrestle response into a data frame

df_geo <- data.frame(result@geography)
df_est <- data.frame(result@estimate)
df <- cbind(df_geo, df_est)

# visualize data
library(ggplot2)

ggplot(df, aes(x = factor(county), y = B19001_001)) +
  geom_boxplot()
