#Task 1 ############################
# Load Twitter Spam dataset into R studio
TwitterSpam <- read.csv("~/Downloads/Data Analytics/Assessment1/TwitterSpam/TwitterSpam.txt")

# Check the class of the data to ensure it's loaded correctly
class(TwitterSpam)

# Print the top Seven lines of the data
head(TwitterSpam, 7)

#Task 2 ############################

# Check column names
colnames(TwitterSpam)

#Task 3 ############################

# Print the number of observations and variables in Twitter Spam dataset
str(TwitterSpam)

# Conceptualize it as a matrix
dim(TwitterSpam)

# Print the number of observations (rows)
n_obs <- nrow(TwitterSpam)

# Print the number of variables (columns)
n_vars <- ncol(TwitterSpam)

# Print the results
cat("Number of Observations:", n_obs, "\n")
cat("Number of Variables:", n_vars, "\n")

#Task 4 ############################
# Compute variance of the ‘no_follower’ column for spammers
no_follower_spammer <- with(TwitterSpam, no_follower[label == "spammer"])
var(no_follower_spammer)
# Compute standard deviation of the ‘no_follower’ column for spammers
sd(no_follower_spammer)
# Compute variance of the ‘no_follower’ column for non-spammers
no_follower_nonspammer <- with(TwitterSpam, no_follower[label == "non-spammer"])
var(no_follower_nonspammer)
# Compute standard deviation of the ‘no_follower’ column for non-spammers
sd(no_follower_nonspammer)

# Print the results
cat("Variance of 'no_follower' for spammers:", var_spammer, "\n")
cat("Standard deviation of 'no_follower' for spammers:", sd_spammer, "\n")
cat("Variance of 'no_follower' for non-spammers:", var_nonspammer, "\n")
cat("Standard deviation of 'no_follower' for non-spammers:", sd_nonspammer, "\n")


#Task 5 #########################################

# Compute the numeric summary of the 'no_tweets' column
no_tweets <- with(TwitterSpam, no_tweets)
summary(no_tweets)

#Task 6 #########################################
# Plot the histogram to show the distribution of the 'no_char' column
hist(TwitterSpam$no_char, 
     xlab = "Number of chars", 
     main = "Histogram of the Number of Chars", 
     ylab = "Frequency",
     col = cm.colors(6),  # Pink and blue color palette
     border = "black")
