# SETUP
# Load required packages
install.packages("dplyr")
library(dplyr)

# Create empty data frame
project_produce <- data.frame()

# DATA GATHERING
# Get data from CSV
project_produce <- read.csv("project_produce.csv", stringsAsFactors = FALSE)

# CLEAN DATA
# Do basic clean up
project_produce$Var1 <- as.factor(project_produce$Var1)
project_produce$Var2 <- as.numeric(project_produce$Var2)

# Remove any missing rows
project_produce <- na.omit(project_produce)

# GROUP DATA
# Group data by Var1
grouped <- group_by(project_produce, Var1)

# SUMMARIZE DATA
# Get count of observations for each var1
summary_by_var1 <- summarise(grouped, count=n())

# Merge back into original data set
project_produce <- merge(project_produce, summary_by_var1, by="Var1")

# Calculate average Var2
summary_by_var2 <- summarise(grouped, mean=mean(Var2))

# Merge back into original data set
project_produce <- merge(project_produce, summary_by_var2, by="Var1")

# FILTER DATA
# Filter out observations with low counts
project_produce <- filter(project_produce, count>=100)

# AGGREGATION
# Aggregate by Var1
agg_by_var1 <- aggregate(project_produce$Var2, by=list(project_produce$Var1), FUN=mean)

# Plot
plot(agg_by_var1$x, agg_by_var1$x, type="l", col="blue")

# EXPORT RESULTS
write.csv(project_produce, file="project_produce_results.csv")