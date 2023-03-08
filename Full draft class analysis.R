library(ggplot2)
library(tidyverse)
library(dplyr)
library(rmarkdown)

draft.data <- read.csv("C:\\Users\\griff\\Downloads\\NFLDraft2000-2022 - Cleaned Dataset.csv")
## Runningback picks from 2012-2022

ggplot(data = draft.data, mapping = aes(x = Pick.Value, y = wAV)) + geom_pointaes()+ geom_smooth(method="gam", formula = y ~s(x))

draftpick.wAV2.lm <- lm(wAV ~ Pick.Value + I((Pick.Value)^.5), data = draft.data)
summary(draftpick.wAV2.lm)

## Formula for expected Weighted Averae Value: E[wVA] = 4.7963862 + .9762101*(Pick.Value^.5) + -.0001793*(Pick.Value)

ggplot(data = draft.data, mapping = aes(x = Pick, y = wAV)) + geom_smooth(method="gam", formula = y ~s(x))+geom_point()
  

draftpick.wAV.lm <- lm(wAV ~ Pick.Value + I((Pick.Value)^-1), data = draft.data)
summary(draftpick.wAV.lm)

## First Round picks only
draftround1 <-  filter(draft.data, Rnd==1)
ggplot(data = draftround1, mapping = aes(x = Pick, y = wAV)) + geom_point()

firstround.lm <- lm(wAV ~ (Pick), data = draftround1)
summary(firstround.lm)

## Factoring for Season drafted
draftpick.wAV3.lm <- lm(wAV ~  I((Pick.Value)^.5) + I(2023-From), data = draft.data)
summary(draftpick.wAV3.lm)

## New formula: E[wAV]= 8.14135 + .93697*(Pick.Value)^.5 - .38452*(2023-To)

## Year drafted should potenitally be used multuplied instead of added

draftpick.wAV4.lm <- lm(wAV ~ I((Pick.Value)^0.5) * I((2023 - From)^-0.3) + 
     I((Pick.Value)^0.5) + I((2023 - From)^-0.3), data = draft.data)
summary(draftpick.wAV4.lm)

## This is the final formula used, as it yields the highest R-Squared at .333