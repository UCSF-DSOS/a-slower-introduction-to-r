# 1.2 A common cutoff for a borderline high LDL cholesterol level is 130 mg/dL.
# In the first line of your script, type code that stores the value of 130 as
# ldl_borderline, using object assignment.
ldl_borderline<-130

# 1.3 A common cutoff for a high LDL cholesterol level is 160 mg/dL.In the
# second line, type code that stores the value of 160 as ldl_high, using object
# assignment.
ldl_high<-160

# 2 import the data (i meant to mention in the slides that you should copy and
# paste the code into your script)
nhanes<-read.csv('nhanes_l.csv')

# 3.1 The head() and tail() functions, mentioned earlier, can be used not only to
# preview data but also to preview variables within data. Use these functions to
# view the first few, and the last few, values of the gender variable.
head(nhanes$gender)
tail(nhanes$gender)

# 3.2 The range() function will show the range of a variable (this is, the minimum
# and maximum values). Use range() to find the age range of individuals in the
# NHANES data (the age variable is ridageyr).
range(nhanes$ridageyr)

# 4.1 The bpxodi1 variable stores measurements of diastolic blood pressure. Try to
# find the mean of this variable. You should see a value of NA.
mean(nhanes$bpxodi1)

# 4.2 Now check the class of this variable. You should see that the variable is in
# fact a numeric object.
class(nhanes$bpxodi1)

# 4.3 Finally, use head() to take a look at the first few values of the variable.
# Why do you think might mean() returned NA in the first problem here? We'll
# talk next week about how to approach this!
head(nhanes$bpxodi1)