
# Load necessary libraries
library(caret)  
library(randomForest)

# Loading the Dataset
library(readr)
TwitterSpam <- read_csv("/TwitterSpam.txt")


# Check the structure of the dataset
str(TwitterSpam)

# Convert the target variable to a factor (if necessary)
TwitterSpam$label <- as.factor(TwitterSpam$label)

# Randomly split the dataset into training (70%) and testing (30%) sets
set.seed(100)  # Ensure reproducibility
splitIndex <- createDataPartition(TwitterSpam$label, p = 0.7, list = FALSE)
trainingSet <- TwitterSpam[splitIndex, ]
testingSet <- TwitterSpam[-splitIndex, ]

# Train the Random Forest model using the training dataset
RF_model <- randomForest(label ~ ., data = trainingSet)

# Print the model summary
print(RF_model)

# Use the trained model to make predictions on the testing data
predictions <- predict(RF_model, testingSet)

# Generate and print the confusion matrix
confusion <- confusionMatrix(predictions, testingSet$label)
print(confusion)


# Plot the importance of features
varImpPlot(RF_model, main="Feature Importance in Random Forest")

# Visualize the confusion matrix
library(ggplot2)
library(reshape2)

confusion_mtx <- as.table(confusion)
confusion_df <- melt(confusion_mtx)

ggplot(data = confusion_df, aes(x = Reference, y = Prediction)) +
  geom_tile(aes(fill = value), color = "white") +
  scale_fill_gradient(low = "lightblue", high = "darkblue") +
  geom_text(aes(label = value), vjust = 1) +
  labs(title = "Confusion Matrix Heatmap", fill = "Count")

# Plot the accuracy over trees
plot(RF_model, main="Random Forest Accuracy Over Trees")


library(pROC)

# Compute probabilities for the ROC curve
pred_probs <- predict(RF_model, testingSet, type = "prob")[,2]

roc_curve <- roc(testingSet$label, pred_probs)
plot(roc_curve, col = "blue", main = "ROC Curve")


# Create a data frame for the metrics
metrics <- data.frame(
  Metric = c("Sensitivity (Recall)", "Specificity", "Precision (PPV)", "Negative Predictive Value", 
             "Prevalence", "Detection Rate", "Detection Prevalence", "Balanced Accuracy"),
  Value = c(0.9133, 0.8133, 0.8303, 0.9037, 0.5000, 0.4567, 0.5500, 0.8633)
)

# Plot the metrics
library(ggplot2)

ggplot(metrics, aes(x = Metric, y = Value)) +
  geom_bar(stat = "identity", fill = "steelblue", width = 0.7) +
  geom_text(aes(label = round(Value, 4)), vjust = -0.5, size = 3.5) +
  coord_flip() +
  ylim(0, 1) +
  labs(title = "Model Performance Metrics", y = "Metric Value", x = "Metric") +
  theme_minimal()

# Create a data frame with these additional metrics
detailed_metrics <- data.frame(
  Metric = c("Accuracy", "95% CI (Lower Bound)", "95% CI (Upper Bound)", 
             "No Information Rate", "P-Value [Acc > NIR]", "Kappa", 
             "McNemar's Test P-Value"),
  Value = c(0.8633, 0.8332, 0.8898, 0.5, 2.2e-16, 0.7267, 0.001362)
)

# Plot the detailed metrics
ggplot(detailed_metrics, aes(x = Metric, y = Value)) +
  geom_bar(stat = "identity", fill = "lightgreen", width = 0.7) +
  geom_text(aes(label = round(Value, 4)), vjust = -0.5, size = 3.5) +
  coord_flip() +
  labs(title = "Detailed Model Performance Metrics", y = "Metric Value", x = "Metric") +
  theme_minimal()

