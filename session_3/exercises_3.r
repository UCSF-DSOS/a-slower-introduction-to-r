# 2.1. At the top of a new script, include code for importing the data.
# Hopefully, you already copied and pasted code for doing this from last week.
# If you didn't, re-obtain the code by using RStudio's import tool. Add a
# comment above that code. Run that code.
nhanes<-read.csv('nhanes_l.csv')

# 2.2. In the console, write code for displaying a histogram of fasting glucose
# (`lbxglu`). Now do this again, specifying that you want to use 60 bins. Feel
# free to try other numbers of bins.
hist(nhanes$lbxglu,breaks=60)

# 2.3. A common threshold for a health level of fasting glucose is 100 mg/dL. In
# the console or the script, add a red vertical line to your histogram at that
# threshold: `abline(v=100,col='red')`.
abline(v=100,col='red')

# 2.4. In the script, type code for finding the mean level of fasting glucose.
# Add a comment above that code. Run that code.
mean(nhanes$lbxglu,na.rm=TRUE)

# 2.5. In the script, type code for finding the 25th, 50th, and 75th percentiles
# of fasting glucose. Add a comment above that code. Run that code.
quantile(nhanes$lbxglu,c(0.25,0.5,0.75),na.rm=TRUE)

# 3.1. In the script from Exercise 2, write code for obtaining the percent of
# adults who have a history of smoking (`smoking`). Add a comment above that
# code. Run that code.
prop.table(table(nhanes$smoking))*100

# 3.2. In the script, write code for obtaining the percent of adults who have a
# history of asthma (`asthma`). Add a comment above that code. Run that code.
prop.table(table(nhanes$asthma))*100