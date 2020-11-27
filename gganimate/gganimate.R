library(ggplot2)     
library(gganimate)  ## the key package!
library(gifski)     ## necessary for making GIFs



##------------ Making simple animated plots, using the gapminder dataset ####

library(gapminder)   ## Package that includes data



p <- ggplot(data = gapminder, 
       aes(x = pop, 
           y = lifeExp)) +
  geom_point() +                        ## scatterplot with population on x 
                                        ## and life expectancy on y
  facet_wrap(~ continent) +             ## subplots by continent
  scale_x_log10() +                     ## log scale on x-axis
  
  ## this bit is key for animating your plot:
  labs(title = 'Year: {frame_time}') +  ## add the year as the title
  transition_time(year)                 ## cycle through years

animate(p)                              ## if all goes well, should make a GIF
anim_save("gganimate/animation.gif")    ## and this saves the GIF



## See https://gganimate.com/ for more ways to animate plots, including how 
## to transition between individual frames




##----------------------- More challenging data: US National Park visits ####

## (Details at https://github.com/rfordatascience/tidytuesday/tree/master/data/2019/2019-09-17)
## You can load the data like this:

park_visits <- read.csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-09-17/national_parks.csv")