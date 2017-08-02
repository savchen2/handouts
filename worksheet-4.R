## Tidy data concept

install.packages(c('dplyr','tidyr'))

response <- data.frame(
  trial = 1:3,
  treatment = c(0.22, 0.58, 0.31),
  control = c(0.42, 0.19, 0.40)
)
response 
## Reshaping multiple columns in category/value pairs

library(tidyr)

df3 <- gather(response,key="factor",value="response", -trial) # -trial all of the columns except for trial 
counts <- data.frame(
  site = rep(1:3, each = 2),
  species = rep(c("lynx", "hare"), 3),
  n = c(2, 341, 7, 42, 0, 289)
)

#transform into wide 
# want to spread species column
counts_spread <- spread(counts,
                        key = species, 
                        value = n)

# subset: take row 5, blak = everything in that column
counts<-counts[-5,]
spread(counts, key=species, value=n) #gives you NA for missing data 

spread(counts, key=species, value=n, fill=0) # gives zero for missing data 
## Exercise 1

...

## Read comma-separated-value (CSV) files

animals <- read.csv('data/animals.csv', )
animals <-read.csv('data/animals.csv', na.strings="") # if you see a missing data, give me NA instead of blank
str(animals)

library(dplyr)


con <- ...(..., host = 'localhost', dbname = 'portal')
animals_db <- ...
animals <- ...
dbDisconnect(...)

## Subsetting and sorting

library(dplyr)
animals_1990_winter <- filter(animals,
                              year==1990,
                              month %in% 1:3) # I wnat it to me month as Jan Feb March

animals_1990_winter <- select(animals_1990_winter, -year)

#sort by columns
#first sort by species id alphab in reverse (desc=descending) and then by weight

sorted <- arrange(animals_1990_winter,
              desc(species_id),weight)

head(sorted)
View(sorted)

## Exercise 2


## Chainning with pipes

sorted_pipe <- animals %>%
    ... # filter to the first 3 months of 1990
    ... # select all columns but year
    ... # sort with descening species_id and weight

## Grouping and aggregation

counts_1990_winter <- animals_1990_winter %>%
    group_by(...) %>%
    ...

weight_1990_winter <- animals_1990_winter %>%
    ...
    summarize(avg_weight = mean(...))

## Exercise 3

...

## Transformation of variables

prop_1990_winter <- counts_1990_winter %>%
    mutate(...)

## Exercise 4

...

## Database Connection

library(...)

con <- ...(PostgreSQL(), host = 'localhost', dbname = 'portal')
animals_db <- ...

species_month_prop <- ...
    group_by(species_id, month) %>%
    summarize(count = n()) %>%
    mutate(prop = count / sum(count)) %>%
    select(-count)

pivot <- ...
  spread(month, prop, fill = 0)

dbDisconnect(con)


install.packages("ggplot2")
