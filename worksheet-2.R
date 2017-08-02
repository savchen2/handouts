## The Editor

vals <- seq(1,100)

vals <- seq(from=1, to=100)
vals<-1:100

## Vectors

counts<-c(4,6,8,2)

##list
list(1,2,"c")

## Exercise 1

...

## Factors

education <- factor(c("college", "highschool", "college", "middle"),
                 levels = c("middle", "highschool", "college"))

education <- factor(c("college", "highschool", "college", "middle"),
                 levels = c("middle", "highschool", "college"),
                 ordered =TRUE )

## Data Frames

df<-data.frame(education,counts)

## Exercise 2

species<-factor(c("whales", "monkeys"))
abundance<-c(1000,2000)
spex<-c("bla", "bla1")

  data<-data.frame(species, abundance)
  str(data)
  data
  data1<-data.frame(spex, abundance)

## Load data into R
  

plots <- read.csv("../data/plots.csv") #../ means go up a directory 
animals <- ...(...)

## Exercise 3

df["counts"] # shows what's included in the counts
df$counts    # shortcut to do the above 


...

## Names

...(df) <- c(...)

## Subsetting ranges

days <- c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")
weekdays <- ...
...

## Exercise 4

...

## Anatomy of a function

function(...) {
  ...
  return(...)
}

## Flow control

if (...) {
    ...
} else {
    ...
}

firts <- function(...) {
    if (...) {
        ...
    } else {
        ...
    }
}

## Linear models

animals <- read.csv(..., stringsAsFactors = FALSE, na.strings = '')
fit <- lm(
  ...,
  data = ...)

## Exercise 6

...

## Pay attention to factors

animals$species_id <- ...
fit <- lm(
  log(weight) ~ ...,
  data = animals)
