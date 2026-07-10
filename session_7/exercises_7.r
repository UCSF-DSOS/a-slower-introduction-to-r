# load packages
library(basecase)
library(dplyr)

# import data
nhanes<-read.csv('nhanes_l.csv')

# re-order the cholesterol groups
nhanes$chole<-factor(nhanes$cholesterol,
                     c('Desirable','Borderline high','High'))
table(nhanes$chol,useNA='always')
table(nhanes$cholesterol,useNA='always')

# define a gender variable with labeled groups
nhanes$gender_base<-base_match(nhanes$riagendr,'Male'=1,'Female'=2)
table(nhanes$riagendr,useNA='always')
table(nhanes$gender_base,useNA='always')

# define a race/ethnicity variable with labeled groups
nhanes$re<-base_match(nhanes$ridreth3,
                      'Asian'=6,
                      'Mexican American'=1,
                      'White'=3,
                      'Other Hispanic'=2,
                      'Black'=4,
                      'Other'=7)
table(nhanes$ridreth3,useNA='always')
table(nhanes$re,useNA='always')

# define another gender variable with labeled groups
nhanes$gender_dplyr<-case_match(nhanes$riagendr,1~'Male',2~'Female')
table(nhanes$riagendr,useNA='always')
table(nhanes$gender_dplyr,useNA='always')

# check the class of the two variables
class(nhanes$gender_base)
class(nhanes$gender_dplyr)

# define age group
nhanes$age3_base<-base_when(
  'Youngest' = nhanes$ridageyr>=18 & nhanes$ridageyr<=34,
  'Middle' = nhanes$ridageyr>=35 & nhanes$ridageyr<=54,
  'Oldest' = nhanes$ridageyr>=55
)
sum(nhanes$ridageyr>=18 & nhanes$ridageyr<=34)
sum(nhanes$ridageyr>=35 & nhanes$ridageyr<=54)
sum(nhanes$ridageyr>=55)
table(nhanes$age3_base,useNA='always')

# define vigorous physical activity, with missing values encoded
nhanes$vigorous_cont<-replace(nhanes$pad820,
                              nhanes$pad820==7777|nhanes$pad820==9999,
                              NA)
table(nhanes$pad820,useNA='always')
table(nhanes$vigorous_cont,useNA='always')

# define a categorical variable for vigorous physical activity
nhanes$vigorous<-base_when(
  'Less than 1 hour' = nhanes$vigorous_cont<60,
  '1-2 hours' = nhanes$vigorous_cont>=60 & nhanes$vigorous_cont<120,
  '2+ hours' = nhanes$vigorous_cont>=120
)
sum(nhanes$vigorous_cont<60,na.rm=TRUE)
sum(nhanes$vigorous_cont>=60 & nhanes$vigorous_cont<120,na.rm=TRUE)
sum(nhanes$vigorous_cont>=120,na.rm=TRUE)
table(nhanes$vigorous,useNA='always')

# define age group again
nhanes$age3_dplyr<-case_when(
  nhanes$ridageyr>=18 & nhanes$ridageyr<=34 ~ 'Youngest',
  nhanes$ridageyr>=35 & nhanes$ridageyr<=54 ~ 'Middle',
  nhanes$ridageyr>=55 ~ 'Oldest'
)
table(nhanes$age3_dplyr,useNA='always')

# check the class of the two variables
class(nhanes$age3_base)
class(nhanes$age3_dplyr)