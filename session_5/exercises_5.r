# load packages
library(ggplot2)

# import the data
nhanes<-read.csv('nhanes_l.csv')

# create a scatter plot of systolic versus age
ggplot(nhanes,aes(y=bpxosy1,x=ridageyr))+
  geom_point()+
  labs(y='Systolic (mmHg)',x='Age (years)')

# create a scatter plot of systolic versus age, with gender mapped to color
ggplot(nhanes,aes(y=bpxosy1,x=ridageyr,color=gender))+
  geom_point()+
  labs(y='Systolic (mmHg)',x='Age (years)',color='Gender')

# create a scatter plot of systolic versus age, with a loess smoother
ggplot(nhanes,aes(y=bpxosy1,x=ridageyr))+
  geom_point()+
  geom_smooth(method='loess',se=FALSE)+
  labs(y='Systolic (mmHg)',x='Age (years)')

# create a box plot of systolic versus hypertension
ggplot(nhanes,aes(y=bpxosy1,x=hypertension))+
  geom_boxplot()+
  labs(y='Systolic (mmHg)',x='Hypertension status')

# create a box plot of systolic versus hypertension
ggplot(nhanes,aes(y=bpxosy1,x=hypertension))+
  geom_violin()+
  labs(y='Systolic (mmHg)',x='Hypertension status')

# make a density plot for systolic, with hypertension mapped to color
ggplot(nhanes,aes(x=bpxosy1,color=hypertension))+
  geom_density()+
  labs(y='Density',x='Systolic (mmHg)',color='Hypertension status')

# make a density plot for systolic, with hypertension mapped to color, and facet
ggplot(nhanes,aes(x=bpxosy1,color=hypertension))+
  geom_density()+
  labs(y='Density',x='Systolic (mmHg)',color='Hypertension status')+
  facet_grid(.~gender)

# output the first scatterplot 
cairo_pdf('test2.pdf')
gg<-ggplot(nhanes,aes(y=bpxosy1,x=ridageyr))+
  geom_point()+
  labs(y='Systolic (mmHg)',x='Age (years)')
dev.off()