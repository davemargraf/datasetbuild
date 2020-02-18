# Generate random categorical values
library(dplyr)
library(ggplot2)

# Set your seed number if you want to reproduce your pseudo randomly generated numbers.
set.seed(1907)

x <- runif(1000,0,1000)
y <- rnorm(1000, 50, 10)
z <- runif(1000,0,3)
df <- tibble(x,y,z)
df <- df %>%
  mutate(c = case_when(
    z <= 1 ~ "A",
    z <= 2 & z > 1 ~ "B",
    z <= 3 & z > 2 ~ "C"
  ))

# We can change the distribution of 'c' to have probabilistic interpretation to simulate different proportions of categorical values.
z <- runif(1000,0,1)
df <- tibble(x,y,z)
df <- df %>%
  mutate(c = case_when(
    z <= .1 ~ "A",
    z > .1 & z <= .6 ~ "B",
    z > .6 & z <= 1 ~ "C"
  ))


p <- ggplot(df, aes(x, y, color = c)) +
  geom_point() +
  theme_bw()
p
