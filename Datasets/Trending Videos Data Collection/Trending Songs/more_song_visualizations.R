### Generating plots for remaining top songs:

library(tidyverse)
library(viridis)
library(RColorBrewer)

options(scipen=999)
myPalette <- colorRampPalette(rev(brewer.pal(11, "Spectral")))

# Song 1: Young Thug - Relationship ft Future
song_1 <- read.csv("song_data6736930971020528389.csv")

ggplot(song_1, aes(x=create_time, y=log(n_shares), linetype="Trendline")) + 
  geom_point(aes(colour=n_followers)) + 
  ggtitle("Song: Young Thug - Relationship feat. Future") + xlab("Create Time") + 
  ylab("Number of Shares (log scale)") + 
  labs(subtitle = "Number of Shares vs Time of Creation", color = "Follower Count") + 
  theme(axis.text.x = element_blank(), axis.ticks.x = element_blank()) +
  geom_smooth(method="lm", se=F, aes(group=1), color="#EE1D52") + 
  scale_linetype_discrete(name = "") + 
  scale_colour_gradient(high = "#EE1D52", low = "#69C9D0",breaks = waiver(), n.breaks = 5)

# Song 2: Saint JHN - Roses (Imanbek Remix)
song_2 <- read.csv("song_data6738439639826287365.csv")
ggplot(song_2, aes(x=create_time, y=log(n_shares), linetype="Trendline")) + 
  geom_point(aes(colour=n_followers)) + 
  ggtitle("Song: Saint JHN - Roses (Imanbek Remix)") + xlab("Create Time") + 
  ylab("Number of Shares (log scale)") + 
  labs(subtitle = "Number of Shares vs Time of Creation", color = "Follower Count") + 
  theme(axis.text.x = element_blank(), axis.ticks.x = element_blank()) +
  geom_smooth(method="lm", se=T, aes(group=1), color="#EE1D52") + 
  scale_linetype_discrete(name = "") + 
  scale_colour_gradient(high = "#EE1D52", low = "#69C9D0",breaks = waiver(), n.breaks = 5)


# Song 3

# Song 4

# Song 5

# Song 6

# Song 7

# Song 8

# Song 9

# Song 10

