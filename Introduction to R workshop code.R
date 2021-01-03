# Code by Megan Stachura
# January 15, 2015
# For NMFS SF3 Introduction to R workshop

# This is a comment

########################################################################

# Print "hello world" in the R console
print("hello world")

########################################################################
### Basic R commands

2+2
2^2
2*1+1
2*(1+1) 

exp(0)
log(2.718282)
log(2.718282, base = 10) # Specifying the optional argument base, default value of base is e=2.718
sqrt(16)

# Exercise 1
1+(2*(3+4)) 
log((4^3+3^(2+1)), base = 10) 
sqrt((4+3)*(2+1)) 

########################################################################
### Help within R

help.search("logarithm")
?log
help(log)

########################################################################
### Assigning and viewing objects

# Assigning numeric values to the object answer
answer <- log(2.718282)
answer = log(2.718282)
answer = log(2.718282, base = 10)

# Assigning characters to the object myName 
# Can use single or double quotes
myName <- "Megan" 
myName <- 'Megan' 

# Putting a command in parentheses will display the assigned object in the R Console
(myName <- "Megan") 

# Viewing objects
print(answer)
answer

# You can manipulate objects
answer* 10

########################################################################
### Working with vectors
# A vector is an ordered collection of numbers

x <- c(1,2,3) # create vector x
x # view x

# Use brackets [ ] to access elements of a vectorx[3] 
x[3]

# rep replicates the values in x by a certain argument - default is times
rep(x, length=10) 
rep(x, times=2) 

# seq generates a sequence of values
seq(from=0, to=10, by=2) 

# Operations on vectors work elementwise
log(x)
x + 1
x * 2
y <- 4:6
x + y

# Exercise 2
seq(from=1, to=99, by=1) 
seq(from=1, to=99, by=2)
z <- c(3,2,1) 
z <- seq(from=3, to=1, by=-1) # this gives you the same resuls as line above
rep(z, length=8)

########################################################################
### Importing and viewing data

# Set the working directory
# Working directory tells R what folder to look in for the files you want to import
setwd("H:/R workshop/")

# See the current working directory
getwd()

# Read in the data
# Specify the file name and if ther is a header row with column names
mona.loa <- read.csv("Mona Loa Carbon Dioxide Data.csv", 
                     header=TRUE)

# Use head() to view the first few observations of the data
head(mona.loa)

# Get the column names of the data
names(mona.loa)

# Use the $ operator to extract variables from data frames
# Save the values for May in a separate object
may <- mona.loa$May

########################################################################
### Statistics

# Arithmetic functions to look at the May values
length(may)
min(may)
max(may)
mean(may)
median(may)
quantile(may)
var(may)
sd(may)
range(may)

# Linear regression
may.model <- lm(mona.loa$May~mona.loa$Years)
may.model <- lm(May~Years, data=mona.loa) # Give you the same result as the line above

# Summary of linear regression results
summary(may.model)

########################################################################
### Plotting

# Plot May Mona Loa CO2 data
plot(x=mona.loa$Years, y=mona.loa$May)

# Plot with axis labels and title
plot(x=mona.loa$Years, y=mona.loa$May, xlab="Years", 
     ylab="Atmospheric CO2 concentrations (ppmv)",
     main="Mona Loa, Hawaii May CO2 Observations")

# Add linear regression line to the plot
abline(may.model)

########################################################################
### Saving the plot as a jpeg file

# Specify how you want the plot to be saved
# This will be saved as a jpeg file with the name "May Mona Loa CO2 Plot.jpg"
jpeg("May Mona Loa CO2 Plot.jpg")

# Make the plot as above
plot(x=mona.loa$Years, y=mona.loa$May, xlab="Years", 
     ylab="Atmospheric CO2 concentrations (ppmv)",
     main="Mona Loa, Hawaii May CO2 Observations")
abline(may.model)

# Save the plot
dev.off()

########################################################################
### Logic examples

# Using boolean operators
rain <- c("Yes","Yes","No")
rain == "Yes"
rain != "No"
rain == "No"

# Conditional if statement
snow <- "Yes"
if(snow=="Yes"){
  print("It's snowing")
}

# Other useful logic functions
nums <-  c(12,9,8,14,7,16,3,2,9)
any(nums > 10) # are any nums greater than 10?
all(nums > 10) # are all the nums greater than 10?
which(nums > 10) # which nums are greater than 10?


########################################################################
### Loops
# Loops are useful if you want to do something many times

for(i in 1:5){
  print(i)
}

########################################################################
# Loops: make a plot for each month of Mona Loa data

# How to save the plots
pdf("Mona Loa CO2 Plots All Months.pdf") 

for(i in 2:13){
    
  # Plot the data for the data in column i
  # Title on the plot is the month name
  plot(x=mona.loa$Years, y=mona.loa[,i], xlab="Years", 
       ylab="Atmospheric CO2 concentrations (ppmv)",
       main=names(mona.loa)[i])
}
# Save the plot
dev.off()
