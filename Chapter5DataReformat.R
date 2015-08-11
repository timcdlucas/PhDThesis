

setwd('~/Dropbox/phd/Documents/thesis/')
library(reshape2)
library(dplyr)
library(ggplot2)
library(plyr)



allModels <- read.csv('data/Chapter5/AllModels_percenterror.csv',  stringsAsFactors = FALSE, header = TRUE)

modNames <- c('SW9', 'SW8', 'SW7',  'SW6', 'SW5', 'SW4',  'SW3', 'SW2', 'SW1', 'NW7', 'NW6', 'NW5', 'REM','NW4', 'NW3', 'NW2', 'NW1', 'SE4', 'SE3',  'SE2', 'SE1', 'NE3', 'NE2', 'NE1', 'gas')

oldOrder <- c('SW7', 'SW8', 'SW4', 'SW5', 'SW9', 'SW6', 'NW7', 'NW6', 'NW5', 'REM', 'SW3', 'SW2', 'SW1', 'NW4', 'NW3', 'NW2', 'NW1', 'SE4', 'SE3', 'NE3', 'SE2', 'NE2', 'NE1', 'SE1', 'gas')

modsClean <- allModels[5:NROW(allModels),] %>%
               melt(variable.name = 'model', value.name = 'percentageerror') %>%
               select(model, percentageerror) %>%
               mutate(model = factor(as.character(model), 
                 levels = modNames)) %>% 
               mutate(expression = mapvalues(model, from = modNames, 
                 to = c(rep(1, 9), rep(2, 3), 3, rep(2, 3), 3, 1, 1, 4, 5, 2, 6, 7, 8)))


ggplot(modsClean, aes(x = model, y = percentageerror, fill = expression)) + 
  geom_boxplot() +
  theme(legend.position = 'none') + 
  xlab('gREM Submodel') +
  ylab('Percentage Error')

write.csv(modsClean, file = 'data/Chapter5/all_models_tidy.csv', row.names = FALSE)






tort <- read.csv('data/Chapter5/max_angle_change_percentageerror.csv',  stringsAsFactors = FALSE)



tortClean <- tort[5:NROW(tort),] %>%
               melt(variable.name = 'model', value.name = 'percentageerror') %>%
               mutate(model2 = ifelse(grepl('\\.', model), as.character(model), '.4')) %>%
               mutate(maxAngle = gsub('.*\\.', '', model2)) %>%
               mutate(maxAngle = factor(maxAngle, levels = c('4', '1', '2', '3'), 
                      labels = c('0',	'pi/3', '2pi/3', 'pi'))) %>%
               mutate(model = gsub('\\..*', '', model)) %>%
               select(model, percentageerror, maxAngle)

ggplot(tortClean, aes(x = maxAngle, y = percentageerror)) + 
  geom_boxplot() +
  facet_grid(. ~ model)

write.csv(tortClean, file = 'data/Chapter5/max_angle_tidy.csv', row.names = FALSE)






wait <- read.csv('data/Chapter5/Prop_time_still_percentageerror.csv',  stringsAsFactors = FALSE)



waitClean <- wait[5:NROW(tort),] %>%
               melt(variable.name = 'model', value.name = 'percentageerror') %>%
               mutate(model2 = ifelse(grepl('\\.', model), as.character(model), '.4')) %>%
               mutate(wait = gsub('.*\\.', '', model2)) %>%
               mutate(wait = factor(wait, levels = c('4', '1', '2'), 
                      labels = c('0',	'0.5', '0.75'))) %>%
               mutate(model = gsub('\\..*', '', model)) %>%
               select(model, percentageerror, wait)

ggplot(waitClean, aes(x = wait, y = percentageerror)) + 
  geom_boxplot() +
  facet_grid(. ~ model)

write.csv(waitClean, file = 'data/Chapter5/prop_time_still_tidy.csv', row.names = FALSE)


  

