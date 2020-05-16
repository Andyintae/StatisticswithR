set.seed(9102015)

library(statsr)
library(dplyr)
library(ggplot2)

data(ames)
head(ames)

n <- 60
samp <- sample_n(ames,n)

samp %>% ggplot(aes(area))+
  geom_histogram()


z_star_95 <- qnorm(0.975)
z_star_95

samp %>% 
  summarise(lower = mean(area) - z_star_95 * (sd(area)/sqrt(n)),
            upper = mean(area) + z_star_95 * (sd(area)/sqrt(n)))

params <- ames %>% 
  summarise(mu = mean(area))
head(params$mu)

ci <- ames %>% 
  rep_sample_n(size = n, reps = 50, replace = TRUE) %>% 
  summarize(lower = mean(area) - z_star_95*(sd(area)/sqrt(n)),
            upper = mean(area) + z_star_95*(sd(area)/sqrt(n)))
ci %>%  slice(1:5)

ci <- ci %>% 
  mutate (capture_mu = ifelse(lower < params$mu & upper > params$mu, "yes", "no"))

head(ci)

ci_data <- data.frame(ci_id = c(1:50, 1:50),
                      ci_bounds = c(ci$lower, ci$upper),
                      capture_mu = c(ci$capture_mu, ci$capture_mu))

ci_data %>% ggplot(aes(x = ci_bounds, y = ci_id,
                       group = ci_id, color = capture_mu))+
  geom_point(size = 2) +
  geom_line()+
  geom_vline(xintercept = params$mu, color = "darkgray")

z_star_99 <- qnorm(0.975)
