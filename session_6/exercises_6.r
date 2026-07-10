# load the packages
library(ggplot2)

# import the data
nhanes<-read.csv('nhanes_l.csv')

# create density plots of systolic blood pressure, with faceting by asthma
ggplot(subset(nhanes,!is.na(asthma)),aes(x=bpxosy1))+
  geom_density()+
  labs(y='Density',x='Systolic blood pressure (mmHg)')+
  facet_grid(asthma~.)

# define a mini version of nhanes
ex2<-subset(nhanes,!is.na(lbxglu)&!is.na(lbdhdd))
ex2<-ex2[1:10,c('ridageyr','dmdborn4','dmdeduc2','lbxglu','lbdhdd')]

# subset to people 40--49 years of age
subset(ex2,ridageyr>=40 & ridageyr<=49)

# subset to people with high values of fasting glucose and cholesterol
subset(ex2,lbxglu>=100 & lbdhdd>=50)

# count the number of people born in the us with a high-school degree
sum(ex2$dmbdorn4==1 & ex2$dmdedu2==3)

# count the number of people 50 years of age or older with glucose >= 100
sum(ex2$ridageyr>=50 & ex2$lbxglu>=100)

# conduct a t-test for systolic versus asthma, among smokers
t.test(bpxosy1~asthma,data=subset(nhanes,smoking=='History of smoking'))

# fit a linear model for systolic versus diastolic, among smokers
lm(bpxosy1~bpxodi1,data=subset(nhanes,smoking=='History of smoking'))

# define moderate physical activity
nhanes$moderate_activity<-replace(nhanes$pad800,
                                  nhanes$pad800==7777|nhanes$pad800==9999,
                                  NA)
table(nhanes$pad800,useNA='always')
table(nhanes$moderate_activity,useNA='always')

# define alcohol use
nhanes$alcohol_use<-replace(nhanes$alq130,
                            nhanes$alq130==777|nhanes$alq130==999,
                            NA)
table(nhanes$alq130,useNA='always')
table(nhanes$alcohol_use,useNA='always')
