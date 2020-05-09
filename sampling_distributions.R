library(statsr)
library(dplyr)
library(shiny)
library(ggplot2)

data(ames)

head(ames)

ggplot(data = ames, aes(x = area)) +
  geom_histogram(binwidth = 250)

ames %>% summarise(mu = mean(area),
                   pop_med = median(area),
                   sigma = sd(area),
                   pop_iqr = IQR(area),
                   pop_min = min(area),
                   pop_max = max(area),
                   pop_q1 = quantile(area, 0.25),
                   pop_q3 = quantile(area, 0.75))

# Which of the following is false?
 2
#   The distribution of areas of houses in Ames is unimodal and right-skewed.
# 50% of houses in Ames are smaller than 1,499.69 square feet.
# The middle 50% of the houses range between approximately 1,126 square feet and 1,742.7 square feet.
# The IQR is approximately 616.7 square feet.
# The smallest house is 334 square feet and the largest is 5,642 square feet.
 
 