library("captioner")
table_nums <- captioner::captioner(prefix = "Table")
fig_nums <- captioner()
if (!require("pacman")) install.packages("pacman")
pacman::p_load(knitr, captioner, bundesligR, stringr)
library("tidyverse")













## install.packages("ggplot2")

## library("ggplot2")

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

setwd("/home/sthu/Dropbox/hsf/23-ss/ds/")
x <- "hello world"
print(x)

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

## 
## Import data
## 
## Table `r table_nums("tab:covid", display = "cite")` shows COVID for three states in Germany:
## 	
## | state           | Bavaria | North Rhine-Westphalia | Baden-Württemberg |
## |-----------------|---------|------------------------|-------------------|
## | deaths (in mio) | 4,92M   | 5,32M                  | 3,69M             |
## | cases           | 24.111  | 25.466                 | 16.145            |
## 
## Table: `r table_nums(name = "tab:covid", caption = "Covid cases and deaths till August 2022")`
## 	
## Write down the code you would need to put into the R-console...
## 
## - ...to store each of variables _state_ and _deaths_ in a vector.
## - ...to store both vectors in a data frame with the name `df_covid`.
## - ...to store both vectors in a tibble with the name `tbl_covid`.
## 
## Please find solution to the exercise [here](https://raw.githubusercontent.com/hubchev/courses/main/scr/import_covid_data.R)
## 

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



## 
## Generate and drop variables
## 
## Use the _mtcars_ dataset. It is part of the package _datasets_ and can be called with
## 
## mtcars

## 
## Base R or pipe
## 
## a) Using the mtcars dataset, write code to create a new dataframe that includes only the rows where the number of cylinders is either 4 or 6, and the weight (wt) is less than 3.5.
## 
## Do this in two different ways using:
## 
## 1. The `%in%` operator and the pipe |> .
## 2. Base R without the pipe |>.
## 
## Compare the resulting dataframes using the identical() function.
## 
## b) Using the mtcars dataset, generate a logical variable that indicates with `TRUE` all cars with either 4 or 6 cylinders that wt is less than 3.5 and add this variable to a new dataset.
## 
## Please find solutions [here](https://raw.githubusercontent.com/hubchev/courses/main/scr/exe_base_pipe.R).
## 

## 
## Subsetting
## 
## 1. Check to see if you have the mtcars dataset by entering the command mtcars.
## 1. Save the mtcars dataset in an object named cars.
## 1. What class is cars?
##   1. How many observations (rows) and variables (columns) are in the mtcars dataset?
##   1. Rename mpg in cars to MPG. Use rename().
## 1. Convert the column names of cars to all upper case. Use rename_all, and the toupper command.
## 1. Convert the rownames of cars to a column called car using rownames_to_column.
## 1. Subset the columns from cars that end in "p" and call it pvars using ends_with().
## 1. Create a subset cars that only contains the columns: wt, qsec, and hp and assign this object to carsSub. (Use select().)
## 1. What are the dimensions of carsSub? (Use dim().)
## 1. Convert the column names of carsSub to all upper case. Use rename_all(), and toupper() (or colnames()).
## 1. Subset the rows of cars that get more than 20 miles per gallon (mpg) of fuel efficiency. How many are there? (Use filter().)
## 1. Subset the rows that get less than 16 miles per gallon (mpg) of fuel efficiency and have more than 100 horsepower (hp). How many are there? (Use filter() and the pipe operator.)
## 1. Create a subset of the cars data that only contains the columns: wt, qsec, and hp for cars with 8 cylinders (cyl) and reassign this object to carsSub. What are the dimensions of this dataset? Do not use the pipe operator.
## 1. Create a subset of the cars data that only contains the columns: wt, qsec, and hp for cars with 8 cylinders (cyl) and reassign this object to carsSub2. Use the pipe operator.
## 1. Re-order the rows of carsSub by weight (wt) in increasing order. (Use arrange().)
## 1. Create a new variable in carsSub called wt2, which is equal to wt^2, using mutate() and piping `%>%`.
## 
## Please find solutions [here](https://raw.githubusercontent.com/hubchev/courses/main/scr/exe_subset.R).
## 

## 
## Data transformation
## 
## Please download and open the R-script you find [here](https://raw.githubusercontent.com/hubchev/courses/main/scr/data_transformation.R) and try to answer the questions therein.
## 
## Solutions to the questions are linked in the script.
## 

## Load the Stata dataset "auto" using R
## 
library("tidyverse")
library("haven")
auto <- read_dta("http://www.stata-press.com/data/r8/auto.dta")

## DatasauRus
## 
## ![(\#fig:label) The logo of the DatasauRus package^[Figure is taken from https://github.com/jumpingrivers/datasauRus]](fig/datasaurus.png){ width=25% }
## 
## a) Load the packages `datasauRus` and `tidyverse`. If necessary, install these packages.
## 
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

## 
## Convergence
## 
## The dataset convergence.dta, see  https://github.com/hubchev/courses/blob/main/dta/convergence.dta, contains the per capita GDP of 1960 (gdppc60) and the average growth rate of GDP per capita between 1960 and 1995 (growth) for different countries (country), as well as 3 dummy variables indicating the belonging of a country to the region Asia (asia), Western Europe (weurope) or Africa (africa).
## 
## 
## -  Some countries are not assigned to a certain country group. Name the countries which are assign to be part of Western Europe, Africa or Asia. If you find countries that are members of the EU, assign them a '1' in the variable weurope.
## -  Create a table that shows the average GDP per capita for all available points in time. Group by Western European, Asian, African, and the remaining countries.
## -  Create the growth rate of GDP per capita from 1960 to 1995 and call it gdpgrowth. (Note: The log value X minus the log value X of the previous period is approximately equal to the growth rate).
## -  Calculate the unconditional convergence of all countries by constructing a graph in which a scatterplot shows the GDP per capita growth rate between 1960 and 1995 (gdpgrowth) on the y-axis and the 1960 GDP per capita (gdppc60) on the x-axis. Add to the same graph the estimated linear relationship. You do not need to label the graph further, just two things: title the graph `world` and label the individual observations with the country names.
## -  Create three graphs describing the same relationship for the sample of Western European, African and Asian countries. Title the graph accordingly with `weurope`, `africa` and `asia`.
## -  Combine the four graphs into one image. Discuss how an upward or downward sloping regression line can be interpreted.
## -  Estimate the relationships illustrated in the 4 graphs using the least squares method. Present the 4 estimation results in a table, indicating the significance level with stars. In addition, the Akaike information criterion, and the number of observations should be displayed in the table. Interpret the four estimation results regarding their significance.
## -  Put the data set into the so-called long format and calculate the GDP per capita growth rates for the available time points in the countries.
## 
## 
## Please find solutions [here](https://raw.githubusercontent.com/hubchev/courses/main/scr/convergence.R).
## 

## 
## Unemployment and GDP in Germany and France
## 
## The following exercise was a former exam.
## 
## Please answer all (!) questions in an R script. Normal text should be written as comments, using the '#' to comment out text. Make sure the script runs without errors before submitting it. Each task (starting with 1) is worth five points. You have a total of 120 minutes of editing time. Please do not forget to number your answers.
## 
## When you are done with your work, save the R script, export the script to pdf format and upload the pdf file.
## 
## Suppose you aim to empirically examine unemployment and GDP for Germany and France. The data set that we use in the following is 'forest.Rdata'.
## 
## (0)
## Write down your name, matriculation number, and date.
## 
## (1)
## Set your working directory.
## 
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

## 
## Import data and write a report
## 
## Reproduce Figure 3 of @Hortacsu2015Ongoing[p. 99] using R. Write a clear report about your work, i.e., document everything with a R script or a R Markdown file.
## 
## Here are the required steps:
## 
##   1. Go to [https://www.aeaweb.org/articles?id=10.1257/jep.29.4.89](https://www.aeaweb.org/articles?id=10.1257/jep.29.4.89) and download the _replication package_ from the _OPENICPSR_ page. Please note, that you can download the replication package after you have registered for the platform.
##   2. Unzip the replication package.
##   3. In the file _diffusion_curves_figure.xlsx_ you find the required data. Import them to R.
##   4. Reproduce the plot using ggplot().
## 
## 
## Please find solutions [here](https://raw.githubusercontent.com/hubchev/courses/main/scr/hortacsu_figure_3.R).
## 

## 
## Explain the weight
## 
## In the statistic course of WS 2020, I asked 23 students about their weight, height, sex, and number of siblings. I wonder how good the height can explain the weight of students. Examine with corelations and a regression analysis the association. Load the data as follows:
## 
library("haven")
classdata <- read.csv("https://raw.githubusercontent.com/hubchev/courses/main/dta/classdata.csv")

## 
## Calories and weight
## 
## a) Write down your name, your matriculation number, and the date.
## b) Set your working directory.
## c) Clear your global environment.
## d) Load the following package: `tidyverse`
## 
library("tidyverse")

df <- read_csv("https://raw.githubusercontent.com/hubchev/courses/main/dta/df-calories.csv")

# OLS Regression
reg_base <- lm(weight ~ calories, data = df)
summary(reg_base)

## 
## Bundesliga
## 
## 
## Open the script that you find [here](https://raw.githubusercontent.com/hubchev/courses/main/scr/bundesliga.R) and work on the following tasks:
## 
## 1. Set your working directory.
## 
## 2. Clear th environment.
## 
## 3. Install and load the `bundesligR` and `tidyverse`.
## 
## 3. Read in the data `bundesligR` as a tibble.
## 
## 3. Replace "Bor. Moenchengladbach" with "Borussia Moenchengladbach."
## 
## 4. Check for the data class.
## 
## 5. View the data.
## 
## 6. Glimpse on the data.
## 
## 7. Show the first and last observations.
## 
## 8. Show summary statistics to all variables.
## 
## 9. How many teams have played in the league over the years?
## 
## 10. Which teams have played Bundesliga so far?
## 
## 11. How many teams have played Bundesliga?
## 
## 12. How often has each team played in the Bundesliga?
## 
## 13. Show summary statistics of variable `Season` only.
## 
## 14. Show summary statistics of all numeric variables (`Team` is a character).
## 
## 15. What is the highest number of points ever received by a team? Show only the name of the club with the highest number of points ever received.
## 
## 16. Create a new tibble using `liga` removing the variable `Pts_pre_95` from the data.
## 
## 17. Create a new tibble using `liga` renaming W, D, and L to Win, Draw, and Loss. Additionally rename GF, GA, GD to Goals_shot, Goals_received, Goal_difference.
## 
## 18. Create a new tibble using `liga` without the variable `Pts_pre_95` and only observations before the year 1996.
## 
## 19. Remove the three tibbles just created from the environment.
## 
## 20. Rename all variables of `liga` to lowercase and store it as `dfb`.
## 
## 21. Show the winner and the runner up after the year 2010. Additionally show the points received.
## 
## 22. Create a variable that counts how often a team was ranked first.
## 
## 23. How often has each team played in the Bundesliga?
## 
## 24. Make a ranking that shows which team has played the Bundesliga most often.
## 
## 25. Add a variable to `dfb` that contains the number of appearances of a team in the league.
## 
## 26. Create a number that indicates how often a team has played Bundesliga in a given year.
## 
## 27. Make a ranking with the number of titles of all teams that ever won the league.
## 
## 28. Create a numeric identifying variable for each team.
## 
## 29. When a team is in the league, what is the probability that it wins the league?
## 
## 30. Make a scatterplot with points on the y-axis and position on the x-axis.
## 
## 31. Make a scatterplot with points on the y-axis and position on the x-axis. Additionally, only consider seasons with 18 teams and add lines that make clear how many points you needed to be placed in between rank 2 and 15.
## 
## 
## Solutions are provided [here](https://raw.githubusercontent.com/hubchev/courses/main/scr/bundesliga.R).
## 
## <!--chapter:end:45_exercises.Rmd-->
## 
## # Write with R Markdown
## 
## ![(\#fig:examplermd) Example of an R Markdown file](fig/rmstudio.png){ width=75% }
## 
## R Markdown provides an authoring framework for data science. You can use a single
## R Markdown file to transcript your work, run code, and generate high quality reports, books, websites, articles, theses, blogs, and many more.
## 
## In contrast to Quarto (see: https://quarto.org and https://quarto.org/docs/get-started/hello/rstudio.html), which is the more recent format, R Markdown is around for some time and hence there are uncountable resources to learn it. For example:
## 
## - The [R Markdown Cheatsheet](https://raw.githubusercontent.com/rstudio/cheatsheets/main/rmarkdown.pdf) from posit offers an overview on the most important features of R Markdown.
## 
## ![(\#fig:rmdcheat) R Markdown Cheatsheet from posit](fig/rmdcheat.png){ width=50% }
## 
## 
## - The book  _R Markdown Cookbook_ by @Xie2020R offers an introduction. The [online version of the book](https://bookdown.org/yihui/rmarkdown-cookbook)  is regularly updated and free of costs.
## 
## ![@Xie2020R: R Markdown Cookbook](fig/rmarkdownbook.png){ width=25% }
## 
## - The book _R Markdown: The Definitive Guide_ by @Xie2018R offers a comprehensive introduction. [The online version of the book](https://bookdown.org/yihui/rmarkdown) is regularly updated and free of costs.
## 
## ![@Xie2018R: R Markdown: The Definitive Guide](fig/rmcb.png){ width=25% }
## 
## Please watch the video [What is R Markdown?](https://vimeo.com/178485416) and then study the [R Markdown tutorial from RStudio](https://rmarkdown.rstudio.com/lesson-1.html).
## 
## <iframe src="https://player.vimeo.com/video/178485416?h=8a57bf9b88&color=428bca" width="640" height="400" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen></iframe>
## 
## 
## 
## 
## Start Markdown and R Markdown
## 
## a) You can learn Markdown (not R Markdown!) in 10 minutes. Just go to https://www.markdowntutorial.com and work throught the interactive lessons.
## b) Now create your first R Markdown file in 3 minutes by doing the following:
##   - click in RStudio on _File > New File > R Markdown_
##   - click _OK_
##   - look for a button entitled _Knit_ and click it
##   - save your file (it will be saved with .Rmd file extension)
## c) Play around with the file. For example, change the output format can you create a word file or a presentation. Play around with the code chunks. Add a picture that you find somewhere online.
## d) Set your working directory to the folder where you have saved your first Rmd-file. Can you come up with a way to generate different output format with just one function.
## 

## 
## R Markdown cite literature
## 
## a) Create a new R Markdown file (_File > New File > R Markdown_), save the file in an empty folder, and knit it.
## b)
## 
## - Make a new script with _File > New File > R Script_.
## - Go to [https://scholar.google.de/](https://scholar.google.de/) and search for _osrmtime_.
## - Click on _"cite"_ and _"BibTeX"_. Copy and paste everything that you see into your script and save the script as _lit.bib_. R Studio will ask you if you confirm the file type change. Click yes. Your _lit.bib_ file should look like this:
## 

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

## `papaja` (Preparing APA Journal Articles)
## 
## There is an easy way to write a manuscript that follows all the APA rules using the package `papaja` written by psychologists from Cologne. Please read their [manual](https://frederikaust.com/papaja_man/introduction.html) and consider their [repository on GitHub](https://github.com/crsh/papaja).
## 
## Now, install and load the package:
## 
## install.packages("papaja")
## library("papaja")

## 
## R Markdown template
## 
## Please follow the instructions below to access the file "23-09_ds-project-desc.Rmd" from my GitHub account:
## 
## 1. Download the file from my GitHub account by clicking on the link provided here.
## 2. Save the file in your working directory.
## 3. Use the knit function to run the file, but be aware that it may not work properly at first. If you encounter any issues, troubleshooting may be required. Don`t worry, error messages will usually provide guidance to help you resolve the issue. Please note that the YAML header is sensitive to spacing, so be careful when setting it up to avoid breaking the code.
## 4. In the project template, I have used BibTeX to cite literature. This method is excellent for automating tedious tasks such as citing papers and generating reference lists based on citation styles, saving time and reducing the likelihood of citation errors. The literature cited is in a separate file, which can be found on one of my GitHub repositories.
## 
## 

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
