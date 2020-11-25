library(gapminder)
library(ggplot2)
library(gganimate)
library(gifski)

p <- ggplot(data = gapminder, 
       aes(x = pop, 
           y = lifeExp)) +
  geom_point() +
  facet_wrap(~ continent) +
  scale_x_log10() +
  labs(title = 'Year: {frame_time}', 
       x = 'GDP per capita', 
       y = 'Life expectancy') +
  transition_time(year)

animate(p)
anim_save("animation.gif")


