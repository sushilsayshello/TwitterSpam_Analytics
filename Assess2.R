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

# Create a separated density plot of the 'no_follower' column
ggplot(TwitterSpam, aes(x = no_follower, fill = factor(label))) +
  geom_density() +
  facet_grid(label ~ .) +
  xlim(c(0, 6000)) +
  labs(title = "Separated Density Plot of Followers Count (no_follower)",
       x = "Number of Followers",
       y = "Density",
       fill = "Account Type") +
  theme_minimal()

#Task 2 ########################################################

# Create an overlapping scatterplot of 'accout_age' vs. 'no_follower', colored by 'label'
ggplot(TwitterSpam, aes(x = accout_age, y = no_follower, color = factor(label))) +
  geom_point(alpha = 0.7) +
  labs(title = "Scatterplot of Account Age vs. Number of Followers",
       x = "Account Age",
       y = "Number of Followers",
       color = "Account Type") +
  theme_minimal()

# Create separated scatterplots of 'accout_age' vs. 'no_follower'
ggplot(TwitterSpam, aes(x = accout_age, y = no_follower, color = factor(label))) +
  geom_point(alpha = 0.7) +
  facet_wrap(~ label, nrow = 1) +
  labs(title = "Separated Scatterplots of Account Age vs. Number of Followers",
       x = "Account Age",
       y = "Number of Followers",
       color = "Account Type") +
  theme_minimal()


#Task 3 ########################################################

# Create overlapping scatterplots with regression lines for 'accout_age' vs. 'no_follower'
ggplot(TwitterSpam, aes(x = accout_age, y = no_follower, color = factor(label))) +
  geom_point(size = 3, alpha = 0.6) + 
  geom_smooth(method = 'lm', se = FALSE, aes(color = factor(label)), size = 1.2) + 
  labs(title = "Overlapping Scatterplot with Regression Lines",
       x = "Account Age",
       y = "Number of Followers",
       color = "Account Type") +
  theme_minimal(base_size = 15) + 
  theme(legend.position = "top", 
        panel.grid.major = element_line(color = "grey80"),  
        panel.grid.minor = element_blank()) 

ggplot(TwitterSpam, aes(x = accout_age, y = no_follower, color = factor(label))) +
  geom_point(alpha = 0.7) +  # Scatterplot points
  geom_smooth(method = 'lm', se = FALSE, aes(color = factor(label))) +  # Add regression lines
  labs(title = "Overlapping Scatterplot with Regression Lines of Account Age vs. Number of Followers",
       x = "Account Age",
       y = "Number of Followers",
       color = "Account Type") +
  theme_minimal()



