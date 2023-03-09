library(nflfastR)
library(ggplot2)
library(ggimage)
library(tidyverse)
library(dplyr)
library(rmarkdown)

teamtotals <-read.csv("C:\\Users\\griff\\Downloads\\NFLDraft2000-2022 - Team wAV drafted.csv")
view(teamtotals)



teamtotals[-c(33), ]

## Eliminating "Total" row

  
teamtotal.df <- as.data.frame(teamtotals)

## Creating a visual for team draft success

library(ggimage)
asp_ratio <- 1.618

wAV_logos <- teamtotal.df %>%
  left_join(nflfastR::teams_colors_logos, by = c("Tm" = "team_abbr")) %>% 
  ggplot(aes(x = Expected.wAV, y = Total.wAV)) +
  geom_image(aes(image = team_logo_wikipedia), size = 0.07, by = "width", asp = asp_ratio) +
  scale_fill_identity(aesthetics = c("fill", "colour")) +
  theme(
    panel.grid.major.y = element_blank(),
    aspect.ratio = 1/asp_ratio
  ) +
  geom_hline(yintercept = 2000) +
  labs(
    x = "Predicted wAV",
    y = "wAV",
    title = "Predicted wAV vs True wAV for NFL teams",
    subtitle = "Drafted players, 2000-2022",
  )

wAV_logos + 
  geom_abline(
  mapping = NULL,
  data = NULL,
  slope=1,
  intercept=0,
  na.rm = FALSE,
  show.legend = NA
)
