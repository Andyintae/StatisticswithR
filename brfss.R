library(tidyverse)
library(ggplot2)
library(dplyr)

load("brfss2013.RData")

glimpse(brfss2013)


brfss2013 %>%
  filter(sleptim1 <= 24) %>% 
  ggplot(aes(sleptim1, menthlth))+
  geom_col()+
  facet_wrap(.~genhlth)

brfss2013 %>%
  ggplot(aes(menthlth, genhlth))+
  geom_point()

brfss_1 <- brfss2013 %>% select(seqno, genhlth, physhlth, menthlth, poorhlth, sleptim1, sex)

brfss_1 %>% 
  filter(sleptim1 <= 24) %>% 
  ggplot(aes(sleptim1, menthlth))+
  geom_point()

brfss_1 %>% 
  filter(sleptim1 <= 24) %>% 
  ggplot(aes(sleptim1))+
  geom_point()


summary(brfss_1)