######################################
### Violin plots for reading age   ###
### v0.1 - Julia Shen - 4 Oct 2020 ###
######################################

########## Housekeeping ##############

library(ggplot2)
library(ggthemes)
library(dplyr)
library(here)
# set_here()

readages <- read.csv("ReadingAge_PP.csv")


colnames(readages)
readages <- readages %>% 
  dplyr::rename(Reading.Age = ï..Reading.Age..Years.)


########## Data checks ##############
summary(readages)
# head(readages)
# View(readages)

# Reading.Age     Pupil.Premium  
# Min.   : 6.917   Mode :logical  
# 1st Qu.: 9.417   FALSE:56       
# Median :10.583   TRUE :56       
# Mean   :10.848                  
# 3rd Qu.:12.521                  
# Max.   :16.417        

summary(subset(readages, Pupil.Premium == TRUE,
               select=Reading.Age))

# Summary stats for those receiving pupil premium
# Reading.Age    
# Min.   : 7.000  
# 1st Qu.: 9.417  
# Median :10.292  
# Mean   :10.332  
# 3rd Qu.:11.188  
# Max.   :13.583  


summary(subset(readages, Pupil.Premium == FALSE,
               select=Reading.Age))

# Summary stats for NOT receiving pupil premium
# Reading.Age    
# Min.   : 6.917  
# 1st Qu.: 9.688  
# Median :11.083  
# Mean   :11.363  
# 3rd Qu.:13.250  
# Max.   :16.417  


########## PLOT the data ##############

plot_readages <- ggplot(readages, 
                        aes(x=Pupil.Premium, 
                            y=Reading.Age)) + 
  geom_violin(trim=FALSE, aes(fill=Pupil.Premium)) + 
    theme_economist_white()

plot_readages

ggsave("plot_readages.png", dpi=600)
