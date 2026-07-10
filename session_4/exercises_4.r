# import the data
nhanes<-read.csv('nhanes_l.csv')

# create a scatterplot for systolic versus diastolic
plot(nhanes$bpxosy1~nhanes$bpxodi1,
     ylab='Systolic (mmHg)',
     xlab='Diastolic (mmHg)')

# create a scatterplot for diastolic versus pulse
plot(nhanes$bpxodi1~nhanes$bpxopls1,ylab='Diastolic (mmHg)',xlab='Pulse')

# fit a linear model for diastolic versus pulse
mm<-lm(nhanes$bpxodi1~nhanes$bpxopls1)
summary(mm)

# create a boxplot for diastolic versus asthma
boxplot(nhanes$bpxodi1~nhanes$asthma,ylab='Diastolic (mmHg)',xlab='')

# obtain a 95% confidence interval for the difference in means
t.test(nhanes$bpxodi1~nhanes$asthma)

# obtain a 90% confidence interval for the difference in means
t.test(nhanes$bpxodi1~nhanes$asthma,conf.level=0.90)

# conduct a wilcoxon-rank sum test
wilcox.test(nhanes$bpxodi1~nhanes$asthma)

# create a contingency table of gender and asthma
table(nhanes$gender,nhanes$asthma)

# find the row-wise percents
prop.table(table(nhanes$gender,nhanes$asthma),margin=1)*100

# conduct a fisher's exact test
fisher.test(table(nhanes$gender,nhanes$asthma))

# store the test
tt<-fisher.test(table(nhanes$gender,nhanes$asthma))

# extract the odds ratio and confidence interval
tt$estimate
tt$conf.int