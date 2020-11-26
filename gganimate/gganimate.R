library(gapminder) ## Package that includes data
library(ggplot2)
library(gganimate)
library(gifski) ## necessary for making GIFs


## We will use the gapminder dataset:

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
anim_save("gganimate/animation.gif")              ## and this saves the GIF


