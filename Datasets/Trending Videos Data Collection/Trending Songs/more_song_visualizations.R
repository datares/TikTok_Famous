### Generating plots for remaining top songs:

library(tidyverse)
library(viridis)
library(RColorBrewer)

library(dplyr)
library(stringr)

options(scipen=999)
myPalette <- colorRampPalette(rev(brewer.pal(11, "Spectral")))

# Song 1: Young Thug - Relationship ft Future
song_1 <- read.csv("song_data6736930971020528389.csv")

yt_rship_plot <- ggplot(song_1, aes(x=create_time, y=log(n_shares), linetype="Trendline")) + 
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
sj_roses_plot <- ggplot(song_2, aes(x=create_time, y=log(n_shares), linetype="Trendline")) + 
  geom_point(aes(colour=n_followers)) + 
  ggtitle("Song: Saint JHN - Roses (Imanbek Remix)") + xlab("Create Time") + 
  ylab("Number of Shares (log scale)") + 
  labs(subtitle = "Number of Shares vs Time of Creation", color = "Follower Count") + 
  theme(axis.text.x = element_blank(), axis.ticks.x = element_blank()) +
  geom_smooth(method="lm", se=F, aes(group=1), color="#EE1D52") + 
  scale_linetype_discrete(name = "") + 
  scale_colour_gradient(high = "#EE1D52", low = "#69C9D0",breaks = waiver(), n.breaks = 5)


# Song 3
song_3 <- read.csv("song_data6744446812653947654.csv")
kc_lottery_plot <- ggplot(song_3, aes(x=create_time, y=log(n_shares), linetype="Trendline")) + 
  geom_point(aes(colour=n_followers)) + 
  ggtitle("Song: K Camp - Lottery") + xlab("Create Time") + 
  ylab("Number of Shares (log scale)") + 
  labs(subtitle = "Number of Shares vs Time of Creation", color = "Follower Count") + 
  theme(axis.text.x = element_blank(), axis.ticks.x = element_blank()) +
  geom_smooth(method="lm", se=F, aes(group=1), color="#EE1D52") + 
  scale_linetype_discrete(name = "") + 
  scale_colour_gradient(high = "#EE1D52", low = "#69C9D0",breaks = waiver(), n.breaks = 5)


# Song 4
song_4 <- read.csv("song_data6746368108098784006.csv")
az_roxanne_plot <- ggplot(song_4, aes(x=create_time, y=log(n_shares), linetype="Trendline")) + 
  geom_point(aes(colour=n_followers)) + 
  ggtitle("Song: Arizona Zervas - Roxanne") + xlab("Create Time") + 
  ylab("Number of Shares (log scale)") + 
  labs(subtitle = "Number of Shares vs Time of Creation", color = "Follower Count") + 
  theme(axis.text.x = element_blank(), axis.ticks.x = element_blank()) +
  geom_smooth(method="lm", se=F, aes(group=1), color="#EE1D52") + 
  scale_linetype_discrete(name = "") + 
  scale_colour_gradient(high = "#EE1D52", low = "#69C9D0",breaks = waiver(), n.breaks = 5)

# Song 5
song_5 <- read.csv("song_data6755145210856016645.csv")
kl_money_plot <- ggplot(song_5, aes(x=create_time, y=log(n_shares), linetype="Trendline")) + 
  geom_point(aes(colour=n_followers)) + 
  ggtitle("Song: Kendrick Lamar - Money Trees") + xlab("Create Time") + 
  ylab("Number of Shares (log scale)") + 
  labs(subtitle = "Number of Shares vs Time of Creation", color = "Follower Count") + 
  theme(axis.text.x = element_blank(), axis.ticks.x = element_blank()) +
  geom_smooth(method="lm", se=F, aes(group=1), color="#EE1D52") + 
  scale_linetype_discrete(name = "") + 
  scale_colour_gradient(high = "#EE1D52", low = "#69C9D0",breaks = waiver(), n.breaks = 5)

# Song 6
song_6 <- read.csv("song_data6763054442704145158.csv")
dj_sayso_plot <- ggplot(song_6, aes(x=create_time, y=log(n_shares), linetype="Trendline")) + 
  geom_point(aes(colour=n_followers)) + 
  ggtitle("Song: Doja Cat - Say So") + xlab("Create Time") + 
  ylab("Number of Shares (log scale)") + 
  labs(subtitle = "Number of Shares vs Time of Creation", color = "Follower Count") + 
  theme(axis.text.x = element_blank(), axis.ticks.x = element_blank()) +
  geom_smooth(method="lm", se=F, aes(group=1), color="#EE1D52") + 
  scale_linetype_discrete(name = "") + 
  scale_colour_gradient(high = "#EE1D52", low = "#69C9D0",breaks = waiver(), n.breaks = 5)


# Song 7
song_7 <- read.csv("song_data6778286560891718406.csv")
rr_box_plot<- ggplot(song_7, aes(x=create_time, y=log(n_shares), linetype="Trendline")) + 
  geom_point(aes(colour=n_followers)) + 
  ggtitle("Song: Roddy Ricch - The Box") + xlab("Create Time") + 
  ylab("Number of Shares (log scale)") + 
  labs(subtitle = "Number of Shares vs Time of Creation", color = "Follower Count") + 
  theme(axis.text.x = element_blank(), axis.ticks.x = element_blank()) +
  geom_smooth(method="lm", se=F, aes(group=1), color="#EE1D52") + 
  scale_linetype_discrete(name = "") + 
  scale_colour_gradient(high = "#EE1D52", low = "#69C9D0",breaks = waiver(), n.breaks = 5)


# Song 8
song_8 <- read.csv("song_data6800996740322297858.csv")
mt_savage_plot<- ggplot(song_8, aes(x=create_time, y=log(n_shares), linetype="Trendline")) + 
  geom_point(aes(colour=n_followers)) + 
  ggtitle("Song: Megan Thee Stallion - Savage") + xlab("Create Time") + 
  ylab("Number of Shares (log scale)") + 
  labs(subtitle = "Number of Shares vs Time of Creation", color = "Follower Count") + 
  theme(axis.text.x = element_blank(), axis.ticks.x = element_blank()) +
  geom_smooth(method="lm", se=F, aes(group=1), color="#EE1D52") + 
  scale_linetype_discrete(name = "") + 
  scale_colour_gradient(high = "#EE1D52", low = "#69C9D0",breaks = waiver(), n.breaks = 5)

# Song 9
song_9 <- read.csv("song_data6801699011402156806.csv")
d_nonstop_plot <- ggplot(song_9, aes(x=create_time, y=log(n_shares), linetype="Trendline")) + 
  geom_point(aes(colour=n_followers)) + 
  ggtitle("Song: Drake - Nonstop") + xlab("Create Time") + 
  ylab("Number of Shares (log scale)") + 
  labs(subtitle = "Number of Shares vs Time of Creation", color = "Follower Count") + 
  theme(axis.text.x = element_blank(), axis.ticks.x = element_blank()) +
  geom_smooth(method="lm", se=F, aes(group=1), color="#EE1D52") + 
  scale_linetype_discrete(name = "") + 
  scale_colour_gradient(high = "#EE1D52", low = "#69C9D0",breaks = waiver(), n.breaks = 5)


# Song 10
song_10 <- read.csv("song_data6839497849235950341.csv")
s_tapin_plot <- ggplot(song_10, aes(x=create_time, y=log(n_shares), linetype="Trendline")) + 
  geom_point(aes(colour=n_followers)) + 
  ggtitle("Song: Saweetie - Tap In") + xlab("Create Time") + 
  ylab("Number of Shares (log scale)") + 
  labs(subtitle = "Number of Shares vs Time of Creation", color = "Follower Count") + 
  theme(axis.text.x = element_blank(), axis.ticks.x = element_blank()) +
  geom_smooth(method="lm", se=F, aes(group=1), color="#EE1D52") + 
  scale_linetype_discrete(name = "") + 
  scale_colour_gradient(high = "#EE1D52", low = "#69C9D0",breaks = waiver(), n.breaks = 5)

# most popular song genres...
top_songs <- data.frame(sort(table(all_sug_users$song[all_sug_users$song != "original sound"]), dec = T))

top_songs <- top_songs[top_songs$Freq > 5,]

top_songs <- top_songs[!str_detect(top_songs$Var1, "ori"),]

top_songs <- top_songs[5:nrow(top_songs),]

top_songs <- top_songs[1:(nrow(top_songs)-6),]

top_songs <- top_songs[top_songs$Freq > mean(top_songs$Freq),]


top_songs <- top_songs[!is.na(top_songs$genre),]

top_songs_tot_nums <- top_songs %>% group_by(genre) %>% summarise(total = sum(Freq))


per <- table(top_songs$genre)
per <- per/sum(per) * 100
per <- round(per, 1)
per2 <- data.frame(table(top_songs$genre))
colnames(per2) <- c("Genre", "Freq")

ggplot(per2, aes(x="", y=Freq, fill=Genre)) +
  geom_bar(width=1, stat="identity") +
  coord_polar("y", start=0) +
  xlab("") +
  ylab("Value") +
  theme(axis.text.x=element_blank(),axis.ticks.x=element_blank()) 

#+ 
 # geom_text(aes(x = c(1, 1.5, 1, 1, 1.2, 1.3, 1.4, 1.5, 1.5, 1.5),
  #              label = paste(round(Freq/sum(Freq) * 100,1), "%", sep="")))


ggplot(top_songs, aes(x=factor(1), fill=genre)) + geom_bar(width=1) + coord_polar("y") +
  scale_colour_gradient(high = "#EE1D52", low = "#69C9D0",breaks = waiver(), n.breaks = 5) +
  theme(axis.text.x = element_blank(), axis.ticks.x = element_blank(), 
        axis.text.y = element_blank(), axis.ticks.y = element_blank(), 
        axis.title.x = element_blank(), axis.title.y = element_blank()) + 
  labs(color="Genre") + ggtitle("Distribution of the Top TikTok Songs by Genre") #+
  #geom_text(aes(label = paste(unname(per), "%", sep="")))
                #position=position_stack(vjust=0.5)))

#ggplot(top_songs_tot_nums, aes(x=factor(1),y=total, fill=genre)) + geom_bar(width=1) + coord_polar("y")

png("genres_of_top_songs.png", width = 1000, height = 666)

pie(per2$Freq, 
    labels = paste(round(100*per2$Freq/sum(per2$Freq),2), "%", sep=""), 
    col = rainbow(n=10), 
    main = "Genre Distribution of Top TikTok Songs", cex.main = 2) 

legend("topright", legend=paste(per2$Genre, ": ",
                                round(100*per2$Freq/sum(per2$Freq),2), "%" ,sep=""), fill = rainbow(n=10))
dev.off()

