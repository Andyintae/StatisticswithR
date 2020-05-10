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


 
samp1 <- ames %>% sample_n(size = 50)
samp1

ggplot(data = samp1, aes(x = area)) +
  geom_histogram(binwidth = 250)

samp1 %>% summarise(x_bar = mean(area))


samp2 <- ames %>% sample_n(size = 50)
samp2 %>% summarise(x_bar = mean(area))

sample_means50 <- ames %>% 
  rep_sample_n(size = 50, reps = 15000, replace = TRUE) %>% 
  summarise(x_bar = mean(area))

ggplot(data = sample_means50, aes(x = x_bar))+
  geom_histogram(binwidth = 20)

sameple_means_small <- ames %>% 
  rep_sample_n(size = 10, reps = 25, replace = TRUE) %>% 
  summarise(x_bar = mean(area))

sameple_means_small


sameple_means_small %>% ggplot(aes(x_bar))+
  geom_histogram(binwidth = 20)



samp2 <- ames %>% sample_n(size = 50)

samp2 %>% summarise(mean_price = mean(price))

sample_means50 <- ames %>% 
  rep_sample_n(size = 50, reps = 5000, replace = TRUE)

sample_means50 %>% ggplot(aes(price))+
  geom_histogram(bins = 30)

sample_means150 <- ames %>% 
  rep_sample_n(size = 150, reps = 5000, replace = TRUE)

sample_means150 %>% ggplot(aes(price))+
  geom_histogram(bins = 30)

ames %>% sample_n(size = 15) %>% 
  summarize(mean(price))

sample_means15 <- ames %>% 
  rep_sample_n(size = 15, reps = 2000, replace = TRUE) %>% 
  summarize(mean_p = mean(price))

sample_means15 %>% ggplot(aes(mean_p))+
  geom_histogram()

sample_means150 <- ames %>% 
  rep_sample_n(size = 150, reps = 2000, replace = TRUE) %>% 
  summarize(mean_p = mean(price))

sample_means150 %>% ggplot(aes(mean_p))+
  geom_histogram()


