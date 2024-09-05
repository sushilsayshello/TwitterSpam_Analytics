#Task 1 ########################################################

# Load the TwitterSpam dataset into R
TwitterSpam <- read.csv("~/Downloads/Data Analytics/Assessment1/TwitterSpam/TwitterSpam.txt")
View(TwitterSpam)

# Load necessary library
library(ggplot2)

# Ensure the dataset is loaded correctly by checking its structure
str(TwitterSpam)


# Create an overlapping density plot of the 'no_follower' column
ggplot(TwitterSpam, aes(x = no_follower, fill = factor(label))) +
  geom_density(alpha = 0.5) +
  xlim(c(0, 6000)) +
  labs(title = "Overlapping Density Plot of Followers Count (no_follower)",
       x = "Number of Followers",
       y = "Density",
       fill = "Account Type") +
  theme_minimal()


