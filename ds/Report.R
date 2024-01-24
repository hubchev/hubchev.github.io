if (!require("pacman")) install.packages("pacman")
pacman::p_load(knitr, captioner, bundesligR, stringr,tidyverse,recipes,dplyr)

table_nums <- captioner::captioner(prefix = "Table")
fig_nums <- captioner()














## install.packages("ggplot2")

## library("ggplot2")

## install.packages(
##   c("arrow", "babynames", "curl", "duckdb", "gapminder",
##     "ggrepel", "ggridges", "ggthemes", "hexbin", "janitor", "Lahman",
##     "leaflet", "maps", "nycflights13", "openxlsx", "palmerpenguins",
##     "repurrrsive", "tidymodels", "writexl")
##   )
## library(
##   c("arrow", "babynames", "curl", "duckdb", "gapminder",
##     "ggrepel", "ggridges", "ggthemes", "hexbin", "janitor", "Lahman",
##     "leaflet", "maps", "nycflights13", "openxlsx", "palmerpenguins",
##     "repurrrsive", "tidymodels", "writexl")
##   )

## # Install and load the required packages using p_load
## if (!require(pacman)) install.packages("pacman")
## 
## pacman::p_load(
##   arrow, babynames, curl, duckdb, gapminder,
##   ggrepel, ggridges, ggthemes, hexbin, janitor, Lahman,
##   leaflet, maps, nycflights13, openxlsx, palmerpenguins,
##   repurrrsive, tidymodels, writexl
## )

## if (!require(pacman)) install.packages("pacman")

## > q()
## Save workspace image? [y/n/c]:

## > q(save = "no")

## install.packages("swirl")
## library("swirl")
## install_course_github("hubchev", "swirl-it")
## swirl()

## library(swirl)
## install_course_github("swirldev", "R_Programming_E")
## swirl()

## file.create("hello.R")

## setwd("/home/sthu/Dropbox/hsf/23-ss/ds/")
## x <- "hello world"
## print(x)

## source( "hello.R" )

## source("./scripts/hello.R")

sales <- 350

sales

350 -> sales

## # Set working directory
## setwd("~/Dropbox/hsf/23-ss/ds")
## # Create a vector that contains the sales data
## sales_by_month <- c(0, 100, 200, 50, 3, 4, 8, 0, 0, 0, 0, 0)
## sales_by_month
## sales_by_month[2]
## sales_by_month[4]
## february_sales <- sales_by_month[2]
## february_sales
## sales_by_month[5] <- 25 # added May sales data
## sales_by_month
## # Do I have 12 month?
## length( x = sales_by_month )
## # Assume each unit costs 7 Euro, then the revenue is
## price <- 7
## revenue <- sales_by_month*price
## revenue
## # To get statistics for daily revenue we define the number of days:
## days_per_month <- c(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
## # Calculate the daily revenue
## revenue_per_day <- revenue/days_per_month
## revenue_per_day
## # round number
## round(revenue_per_day)

## ?round()

## name_of_function <- function(argument1, argument2) {
##     statements or code that does something
##     return(something)
## }

square_it <- function(x) { 
   square <- x * x
   return(square)
} 

square_it(5)

# check if dplyr is loaded
if("dplyr" %in% search()) {
  # unload dplyr
  detach("package:tidyr", unload = TRUE)
  detach("package:dplyr", unload = TRUE)
  message("dplyr package unloaded.")
} else {
  message("dplyr package not loaded.")
}


# Set working directory
setwd("~/Dropbox/hsf/23-ss/ds")
# Create a vector that contains the sales data
sales_by_month <- c(0, 100, 200, 50, 3, 4, 8, 0, 0, 0, 0, 0)
sales_by_month
sales_by_month[2]
sales_by_month[4]
february_sales <- sales_by_month[2]
february_sales
sales_by_month[5] <- 25 # added May sales data
sales_by_month
# Do I have 12 month?
length( x = sales_by_month )
# Assume each unit costs 7 Euro, then the revenue is
price <- 7
revenue <- sales_by_month*price
revenue
# To get statistics for daily revenue we define the number of days:
days_per_month <- c(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
# Calculate the daily revenue
revenue_per_day <- revenue/days_per_month
revenue_per_day 
# round number 
round(revenue_per_day) 

detach("package:recipes")
if(any(grepl("package:dplyr", search()))) detach("package:dplyr") else message("dplyr not loaded")

lag(revenue)
(revenue/lag(revenue)-1)*100 

# check if the package is installed
find.package("dplyr")
# I already installed the package so I can just load it
# install.packages("dplyr")
library("dplyr")

lag(revenue)
(revenue/lag(revenue)-1)*100 

growth_rate <- function(x)(x/lag(x)-1)*100 
growth_rate(revenue)
sales_gr_rate <- growth_rate(revenue)
sales_gr_rate

c(NA, diff(revenue)/head(revenue, -1))*100        
(revenue/c(NA,revenue[-length(revenue)])-1)*100


## install.packages("tidyverse")
## library("tidyverse")

# create some data `x`
x <- c(1, 1.002, 1.004, .99, .99)
# take the logarithm of `x`, 
log_x <- log(x)
# compute the lagged and iterated differences (see `diff()`)
growth_rate_x <- diff(log_x)
growth_rate_x
# round the result (4 digit)
growth_rate_x_round <- round(growth_rate_x, 4)
growth_rate_x_round 

round(diff(log(x)), 4)

# load one of these packages: `magrittr` or `tidyverse`
library(tidyverse)

# Perform the same computations on `x` as above
x |> 
  log() |>
  diff() |>
  round(4)


mtcars |> 
  filter(cyl>4) |> 
  group_by(cyl) |> 
  summarise_at(c("mpg", "hp"), mean)

# defining multiple vectors using the colon operator `:`
v_a <- c(1:3)
v_a
v_b <- c(10:12)
v_b

# creating matrix
m_ab <- matrix(c(v_a, v_b), ncol = 2)
m_cbind <- cbind(v_a, v_b)
m_rbind <- rbind(v_a, v_b)

# print matrix
print(m_ab)
print(m_cbind)
print(m_rbind)

# defining row names and column names
rown <- c("row_1", "row_2", "row_3")
coln <- c("col_1", "col_2")

# creating matrix
m_ab_label <- matrix(m_ab, ncol = 2, byrow = FALSE, 
            dimnames = list(rown, coln))
  
# print matrix
print(m_ab_label)

# convert the matrix into dataframe
df_ab=as.data.frame(m_ab_label)
tbl_ab=as_tibble(m_ab_label)

library("datasets")
head(mtcars, 3)
?mtcars  # data dictionary

# install.packages("wbstats") 
library("wbstats")
# GDP at market prices (current US$) for all available countries and regions
df_gdp <- wb(indicator = "NY.GDP.MKTP.CD")
head(df_gdp, 3)
glimpse(df_gdp)
summary(df_gdp)

class(mtcars) # mtcars is a data frame
rownames(mtcars) 

tbl_mtcars <- as_tibble(mtcars)
class(tbl_mtcars) # check if it is a tibble now
is_tibble(tbl_mtcars) # alternative check
head(tbl_mtcars, 3)

tbl_mtcars <- mtcars |> 
  rownames_to_column(var = "car") |>
  as_tibble() 
class(tbl_mtcars)
head(tbl_mtcars, 3)

integer_var <- c(1, 2, 3, 4, 5)
numeric_var <- c(1.1, 2.2, NA, 4.4, 5.5)
character_var <- c("apple", "banana", "orange", "cherry", "grape")
factor_var <- factor(c("red", "yellow", "red", "blue", "green"))
logical_var <- c(TRUE, TRUE, TRUE, FALSE, TRUE)
date_var <- as.Date(c("2022-01-01", "2022-02-01", "2022-03-01", "2022-04-01", "2022-05-01"))

date_var[2] - date_var[5] # number of days in between these two dates



x <- c(1, 3, 5, 7)
y <- c(2, 4, 6, 8)
z <- c(1, 2, 3)

x %in% y  
x %in% z  
z %in% x

a <- mtcars[3, ]
b <- mtcars["Datsun 710", ]
identical(a, b)
a

c <- mtcars[,"cyl"]
d <- mtcars[, 2]
identical(x, y)
c

e <- mtcars$cyl
f <- mtcars[["cyl"]]
identical(e, f)
e

mtcars[mtcars$cyl >= 6, ]

mtcars[mtcars$cyl == 4 | mtcars$cyl == 6 , ]

mtcars[mtcars$cyl == 4 & mtcars$mpg > 22, ]

mtcars[mtcars$wt < 3.5 | mtcars$gear > 4, ]

mtcars[(mtcars$mpg > 25 | mtcars$carb < 2) & mtcars$cyl %in% c(4,8), ]

# Example of if statement
if (mean(mtcars$mpg) > 20) {
  print("The average miles per gallon is greater than 20.")
}

# Example of if-else statement
if (mean(mtcars$mpg) > 20) {
  print("The average miles per gallon is greater than 20.")
} else {
  print("The average miles per gallon is less than or equal to 20.")
}

# Example of if-else if statement
if (mean(mtcars$mpg) > 25) {
  print("The average miles per gallon is greater than 25.")
} else if (mean(mtcars$mpg) > 20) {
  print("The average miles per gallon is between 20 and 25.")
} else {
  print("The average miles per gallon is less than or equal to 20.")
}

# Example of if_else function
mtcars_2 <- mtcars
mtcars_2$mpg_category <- ifelse(mtcars_2$mpg > 20, "High", "Low")


mtcars_cyl <- mtcars %>%
  mutate(cyl_category = case_when(
    cyl == 4 ~ "four",
    cyl == 6 ~ "six",
    cyl == 8 ~ "eight"
  ))

library(tidyverse)

# load mtcars dataset
data(mtcars)

# arrange rows by mpg in descending order
mtcars |> 
  arrange(desc(mpg))

# filter rows where cyl = 4
mtcars |> 
  filter(cyl == 4)

# select columns mpg, cyl, and hp
mtcars |> 
  select(mpg, cyl, hp) |> 
  head()

# select columns all variables except wt and hp
mtcars |> 
  select(-wt, -hp) |> 
  head()

# select only variables starting with `c`
mtcars |> 
  select(starts_with("c"))

# summarize avg mpg by number of cylinders
mtcars |> 
  group_by(cyl) |> 
  summarize(avg_mpg = mean(mpg))

# create new column wt_kg, which is wt in kg
mtcars |> 
  select(wt) |> 
  mutate(wt_kg = wt / 2.205) |> 
  head()

# Create a new variable by calculating hp divided by wt
mtcars_new <- mtcars |> 
  select(wt, hp) |> 
  mutate(hp_per_t = hp/wt) |> 
  head()

# Print the first few rows of the updated dataset
head(mtcars_new)

# Rename hp to horsepower
mtcars |> 
  rename(horsepower = hp) |> 
  glimpse()


# Creating dataframe
df <- tibble(
  integer_var, numeric_var, character_var, factor_var, logical_var, date_var,
)

# Overview of the data
head(df)
summary(df)
glimpse(df)

# look closer at variables

# unique values
unique(df$integer_var)
unique(df$factor_var)
table(df$factor_var)
length(unique(df$factor_var))

# distributions
df |> count(factor_var)
prop.table(table(df$factor_var))
df |> 
  count(factor_var) |> 
  mutate(prop = n / sum(n))
aggregate(df$numeric_var, 
          by = list(fruit = df$factor_var), 
          mean)
# --> the mean of red cannot be calculated as there is a NA in it
# Solution: exclude NAs from calculation:
aggregate(df$numeric_var, 
          by = list(fruit = df$factor_var), 
          mean,
          na.rm = TRUE)

#install.packages("janitor")
require("janitor")
mtcars |> 
  tabyl(cyl) 
mtcars |> 
  tabyl(cyl, hp) 



## mtcars

library("tidyverse")
library("haven")
auto <- read_dta("http://www.stata-press.com/data/r8/auto.dta")

  #install.packages("datasauRus")
  library("datasauRus")
  library("tidyverse")

ds <- datasaurus_dozen
ds_wide <- datasaurus_dozen_wide

??datasaurus

## ds
## dim(ds)
## head(ds)
## glimpse(ds)
## view(ds)
## summary(ds)

unique(ds$dataset)  
unique(ds$dataset) |> 
  length()

ds |> 
  group_by(dataset) |> 
  summarise(mean_x = mean(x),
            mean_y = mean(y))

ds |> 
  group_by(dataset) |> 
  summarise(mean_x = round(mean(x),2),
            mean_y = round(mean(y),2),
            sd_x = round(sd(x),2),
            sd_y = round(sd(y),2),
            med_x = round(median(x),2),
            med_y = round(median(y),2),
            cor = round(cor(x,y),4))

## The standard deviation, the mean, and the correlation are basically the same for all datasets. The median is different.

ggplot(ds, aes(x = x, y = y)) +
  geom_point() +
  facet_wrap(~ dataset, ncol = 3) +
  theme(legend.position = "none") 

# Get unique values
uni_ds <- unique(ds$dataset)    

# Scatter plot for each dataset
for (uni_v in uni_ds) {
  # Select data for the current value
  subset_ds <- ds |> 
    filter(dataset == uni_v) %>%
    select(x, y)
  
  # Make plot
  graph <- ggplot(subset_ds, aes(x = x, y = y)) +
    geom_point() +
    labs(title = paste("Dataset:", uni_v),
         x = "X",
         y = "Y") +
    theme_bw()
  
  # Save the plot as a PNG file
  filename <- paste0("fig/", "plot_ds_", uni_v, ".png")
  ggsave(filename, plot = graph)
}

## setwd("/home/sthu/Dropbox/hsf/exams/22-11/scr/")

## rm(list=ls())

# install.packages("tidyverse")
# install.packages("ggpubr")
# install.packages("sjPlot")
library("tidyverse")
library("ggpubr")
library("sjPlot")

load(url("https://github.com/hubchev/courses/raw/main/dta/forest.Rdata"))

# load("forest.Rdata")

head(df,8)

tail(df,1)

# panel data set
# date and country.x

observations_df <- dim(df)

df <- rename(df, nation=country.x)
df <- rename(df, year=date)

df <- df |> 
  select(nation, year, gdp, pop, gdppc, unemployment)

df <- df |> 
  mutate(gdp_pc = gdp/pop)

df <- df |> filter(nation=="Germany" | nation=="France")

df  |> 
  group_by(nation) |> 
  summarise(mean(unemployment), mean(gdppc))

df  |> 
  filter(year==2020) |>  
  group_by(nation) |> 
  summarise(mean(unemployment), mean(gdppc))

df  |> 
  group_by(nation) |> 
  summarise(max(unemployment), max(gdppc))

df |>  
  group_by(nation) |> 
  summarise(sd(gdppc), sd(unemployment))

df |> 
  group_by(nation) |> 
  summarise(sd(unemployment), mean(unemployment), cov = sd(unemployment)/mean(unemployment))

df |> 
  group_by(nation) |>  
  summarise(sd(gdppc),mean(gdppc), cov = sd(gdppc)/mean(gdppc))

# df_ger <- df |>  
#   filter(nation == "Germany") 
# pger <- ggplot(df_ger, aes( x = year, y = unemployment)) +
#   geom_line() +
#   ggtitle("Germany")
# plot(pger)
df |> 
  filter(nation == "Germany") |> 
  ggplot(aes(x = year, y = unemployment)) +
  geom_line() +
  ggtitle("Germany")

labels <- 1992:2020
dfra <- df |>  filter(nation == "France")
plot(dfra$gdppc, dfra$unemployment, type = "b", xlab = "GDP per capita", ylab = "Unemployment rate"); text(dfra$gdppc + 0.1, dfra$unemployment + 0.1, labels); title("France")

# Data
x <- c(1, 2, 3, 4, 5, 4, 7, 8, 9)
y <- c(12, 16, 14, 18, 16, 13, 15, 20, 22)
labels <- 1970:1978

# Connected scatter plot with text
plot(x, y, type = "b", xlab = "Var 1", ylab = "Var 2"); text(x + 0.4, y + 0.1, labels) 

dfger <- df |>  filter(nation == "Germany")
labels <- 1992:2020
plot(dfger$gdppc, dfger$unemployment, type = "b", 
     xlab = "Var 1", ylab = "Var 2"); text(dfger$gdppc + 0.7, dfger$unemployment + 0.4, labels); title("Germany")

library("haven")
classdata <- read.csv("https://raw.githubusercontent.com/hubchev/courses/main/dta/classdata.csv")

library("tidyverse")

df <- read_csv("https://raw.githubusercontent.com/hubchev/courses/main/dta/df-calories.csv")

# OLS Regression
reg_base <- lm(weight ~ calories, data = df)
summary(reg_base)

# (Install and) load packagages
pacman::p_load(
  bundesligR,
  tidyverse
  )

# Read in the data as tibble
liga <- as_tibble(bundesligR) |> 
  rename_all(tolower)

dfb_bal <- liga |> 
  select(season, team, position) |> 
  as_tibble() |> 
  complete(season, team) 

dfb_fck <- dfb_bal |> 
  filter(team == "1. FC Kaiserslautern") 

fck_pic <- ggplot(dfb_fck, aes(x = season, y = position)) +
  geom_point() +
  geom_line() +
  scale_y_reverse(breaks = seq(1, 18, by = 1))

fck_pic

dfb_bal <- dfb_bal |> 
  mutate(godown = ifelse(season <= 1964, 14.5, NA)) |> 
  mutate(godown = ifelse(season > 1964 & season <= 1973, 16.5, godown)) |>
  mutate(godown = ifelse(season > 1973 & season <= 1980, 15.5, godown)) |>
  mutate(godown = ifelse(season > 1980 & season <= 1990, 16, godown)) |>
  mutate(godown = ifelse(season == 1991, 16.5, godown)) |>
  mutate(godown = ifelse(season > 1991 & season <= 2008, 15.5, godown)) |>
  mutate(godown = ifelse(season > 2008 , 16, godown)) |> 
  mutate(inliga = ifelse(is.na(position), 0, 1))

dfb_subset <- subset(dfb_bal, team == "1. FC Koeln")
  
efzplot <- ggplot(dfb_subset, aes(x = season)) +
    geom_point(aes(y = position), shape = 15) +
    geom_line(aes(y = position)) +
    geom_point(aes(y = godown), shape = 25) +
    scale_y_reverse(breaks = seq(1, 20, by = 1) , limits = c(20, 1)) + 
    xlim(1963, 2015) +
    theme(panel.grid.minor = element_blank()) +
    geom_hline(yintercept = 1.5, linetype = "dashed", color = "gray") +
    geom_point(aes(y = position), shape = 1) +
    labs(title = paste("Ranking History:", "1. FC Koeln"))

efzplot

## # setwd("/home/sthu/Dropbox/hsf/exams/22-11/scr/")

rm(list=ls())

# install.packages("tidyverse")
# install.packages("ggpubr")
# install.packages("sjPlot")
library("tidyverse")
library("ggpubr")
library("sjPlot")

load(url("https://github.com/hubchev/courses/raw/main/dta/forest.Rdata"))

head(df,8)

tail(df,1)

 # panel data set
 # date and country.x

observations_df <- dim(df)

df <- rename(df, nation=country.x)
df <- rename(df, year=date)

df <- df %>% 
  select(nation, year, gdp, pop, gdppc, unemployment)

df <- df %>% 
  mutate(gdp_pc = gdp/pop)

df <- df %>% filter(nation=="Germany" | nation=="France")

df  %>%
  group_by(nation) %>%
  summarise(mean(unemployment), mean(gdppc))

df  %>%
  filter(year==2020) %>% 
  group_by(nation) %>%
  summarise(mean(unemployment), mean(gdppc))

df  %>%
  group_by(nation) %>%
  summarise(max(unemployment), max(gdppc))

df %>% 
  group_by(nation) %>%
  summarise(sd(gdppc), sd(unemployment))

df %>% 
  group_by(nation) %>% 
  summarise(sd(unemployment), mean(unemployment), cov = sd(unemployment)/mean(unemployment))

df %>% 
  group_by(nation) %>% 
  summarise(sd(gdppc),mean(gdppc), cov = sd(gdppc)/mean(gdppc))

pger <- df %>% 
  filter(nation=="Germany") %>% 
  ggplot(.,aes(x=year, y=unemployment)) +
  geom_line() +
  ggtitle("Germany")
plot(pger)

labels <- 1992:2020
dfra <- df %>% filter(nation == "France")
plot(dfra$gdppc, dfra$unemployment, type = "b", xlab = "GDP per capita", ylab = "Unemployment rate"); text(dfra$gdppc + 0.1, dfra$unemployment + 0.1, labels); title("France")

# Data
x <- c(1, 2, 3, 4, 5, 4, 7, 8, 9)
y <- c(12, 16, 14, 18, 16, 13, 15, 20, 22)
labels <- 1970:1978

# Connected scatter plot with text
plot(x, y, type = "b", xlab = "Var 1", ylab = "Var 2"); text(x + 0.4, y + 0.1, labels) 

dfger <- df %>% filter(nation == "Germany")
labels <- 1992:2020
plot(dfger$gdppc, dfger$unemployment, type = "b", 
     xlab = "Var 1", ylab = "Var 2"); text(dfger$gdppc + 0.7, dfger$unemployment + 0.4, labels); title("Germany")

# load packages
if (!require(pacman)) install.packages("pacman")
pacman::p_unload(all)
setwd("~/Dropbox/hsf/exams/24-01/Rmd")

rm(list=ls())

pacman::p_load(tidyverse, haven, janitor, jtools)

df <- read_dta(
  "https://github.com/hubchev/courses/raw/main/dta/city.dta", 
  encoding="latin1") |> 
  as_tibble()

head(df)
tail(df)

dim(df)

summary(df)

df <- df |> 
  rename(city = stadt) 

df <- df |> 
  select(-pop1970, -pop1987) 

df  %>%
  group_by(state) %>%
  summarise( mean(pop2011), 
             sum(pop2011)
  )

df <- df %>%
  mutate(state = case_when(
    state == "Baden-Wrttemberg"  ~ "Baden-Württemberg",
    state == "Th_ringen" ~ "Thüringen",
    TRUE ~ state
  ))

df  %>%
  group_by(state) %>%
  summarise( mean(pop2011), 
             sum(pop2011)
  )

df |> 
  filter(state == "Saarland") |> 
  print(n = 100)

df <-  df |> 
  filter(!(city=="Perl" & is.na(pop2011)) )

df |> 
  filter(state == "Saarland") |> 
  print(n = 100)

df  %>%
  filter(state == "Saarland") %>%
  summarise( mean(pop2011), 
             sum(pop2011)
  )

df |>  
  group_by(city) |> 
  mutate(unique_count = n()) |> 
  arrange(city, state) |> 
  filter(unique_count > 1) |> 
  select(city, status, state, starts_with("pop"), unique_count) |> 
  print(n = 100) 

df |>  
  group_by(city, state) |> 
  mutate(unique_count = n()) |> 
  arrange(city, state) |> 
  filter(unique_count > 1) |> 
  select(city, status, state, starts_with("pop"), unique_count) |> 
  print(n = 100) 


df <- df |> 
  group_by(city, state) |> 
  mutate(n_row = row_number() ) |> 
  filter(n_row == 1) |> 
  select(-n_row)

df |>  
  group_by(city, state) |> 
  mutate(unique_count = n()) |> 
  arrange(city, state) |> 
  filter(unique_count > 1) |> 
  select(city, status, state, starts_with("pop"), unique_count) |> 
  print(n = 100) 

save.image("city_clean.RData")

df <- df |> 
  ungroup() |> 
  arrange(desc(pop2011)) |> 
  mutate(rank = row_number() )

df |>  
  select(-rankX, -status, -state) |> 
  head()


cor(df$pop2011, df$rank, method = c("pearson"))

ggplot(df, aes(x = rank, y = pop2011)) +
  geom_point() +  
  geom_smooth(method = "lm", se = FALSE, color = "blue") 

df <- df |> 
  mutate(lnrank = log(rank) ) |> 
  mutate(lnpop2011 = log(pop2011) )

df |>  
  select(city, rank, lnrank, pop2011, lnpop2011) |> 
  head()


cor(df$lnpop2011, df$lnrank, method = c("pearson"))

ggplot(df, aes(x = lnrank, y = lnpop2011)) +
  geom_point() +  
  geom_smooth(method = "lm", se = FALSE, color = "blue") +  
  labs(title = "Scatterplot with Regression Line",
       x = "lnrank (Logarithmized Rank)",
       y = "lnpop2011 (Logarithmized Population 2011)")

zipf <- lm(lnpop2011 ~ lnrank, data = df)
summary(zipf)

df <- df |> 
  mutate(prediction = predict(zipf, newdata = df)) |> 
  mutate(pred_pop = exp(prediction))
df |> 
  select(city, pop2011, pred_pop) |> 
  filter(city == "Regensburg")

## @article{huber2016calculate,
##   title={Calculate travel time and distance with OpenStreetMap data using the Open Source Routing Machine (OSRM)},
##   author={Huber, Stephan and Rust, Christoph},
##   journal={The Stata Journal},
##   volume={16},
##   number={2},
##   pages={416--423},
##   year={2016},
##   publisher={SAGE Publications Sage CA: Los Angeles, CA}
## }

## ---
## title: "Untitled"
## author: "Stephan Huber"
## date: "`r Sys.Date()`"
## output: html_document
## bibliography: lit.bib
## ---

## csl: "https://raw.githubusercontent.com/citation-style-language/styles/master/apa.csl"

## install.packages("papaja")
## library("papaja")

library("captioner")
table_nums <- captioner(prefix = "Table")

## /Users/huber/Rbook/rcourse-book.pdf

path.expand("~")

getwd()

getwd()

## setwd("/Users/huber/Rbook/data")
## setwd("./Rbook/data")

## list.files()

## getwd()
## [1] "C:/Users/huber/

## setwd( "C:/Users/huber" )
## setwd( "C:\\Users\\huber" )

sessionInfo()
