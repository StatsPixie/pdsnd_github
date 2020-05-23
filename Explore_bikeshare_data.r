
library(ggplot2)

library(magrittr)

ny = read.csv('new_york_city.csv')
wash = read.csv('washington.csv')
chi = read.csv('chicago.csv')

head(ny)

head(wash)

head(chi)

ggplot (aes(x=Trip.Duration), data=wash) + geom_histogram(binwidth=5) + ggtitle('Histogram of Time Spent On Bike') + labs(x='Length of bike rides', y='Number of riders')+ scale_x_continuous(limits = c(0,2501))

summary(wash$Trip.Duration/60)




by (wash$Trip.Duration, wash$User.Type, summary)

ggplot(aes(x=Trip.Duration/60), data=subset(wash, !is.na(User.Type)))+ geom_histogram (binwidth=1) + ggtitle('Histogram of rental time per user type') + labs(x='Length of time', y='Number of riders')+ scale_x_continuous(limits = c(0,80)) + facet_wrap(~User.Type) 

ny$age<- 2020-ny$Birth.Year
boxplot(ny$age ~ ny$Gender, col="orange", main="Distribution of age and gender", ylab="Number of Users", xlab="Gender")

by (ny$age, ny$Gender, summary)

system('python -m nbconvert Explore_bikeshare_data.ipynb')
