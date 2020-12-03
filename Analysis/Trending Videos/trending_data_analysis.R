#Trending Videos

setwd("~/Desktop/TikTok_famous/Datasets/Trending Videos Data Collection")
library(tidyverse)
library(viridis)
library(RColorBrewer)


## Import Datasets
top_users <- read.csv("top_users_vids.csv")
all_sug_users <- read.csv("sug_users_vids_all.csv")

## Cols
# [1] "id"            "create_time"   "user_name"     "hashtags"      "song"          "video_length"  "n_likes"      
# [8] "n_shares"      "n_comments"    "n_plays"       "n_followers"   "n_total_likes" "n_total_vids" 

View(table(all_sug_users$song))
top_users[top_users$user_name == top_users$user_name[1],]


plot(top_users$n_likes~top_users$n_plays)

abv_avg_likes <- top_users[top_users$n_likes > mean(top_users$n_likes),]

hist(abv_avg_likes$video_length)
hist(top_users$video_length)

ggplot(abv_avg_likes, aes(x=create_time, y=n_likes)) + geom_point(aes(colour = song))


x <- names(sort(table(abv_avg_likes$song), decreasing = T)[1:10])

top_songs_abv_avg <- abv_avg_likes[abv_avg_likes$song %in% x,]

abv_avg_likes$flwr_per_video <- numeric(nrow(abv_avg_likes))

for(i in 1:nrow(abv_avg_likes)){
  abv_avg_likes$flwr_per_video <- abv_avg_likes$n_followers / abv_avg_likes$n_total_vids
}

options(scipen=999)

## LIKES vs VIDEO LENGTH based on n_followers
ggplot(all_sug_users, aes(x=video_length, y=n_likes)) + 
  geom_point(aes(colour=n_followers)) + 
  scale_color_viridis_c() + geom_vline(xintercept = mean(abv_avg_likes$video_length)) +
  geom_hline(yintercept = mean(abv_avg_likes$n_likes)) +
  xlab("Video Length (s)") + ylab("Number of likes") + 
  ggtitle("Number of Likes vs Video Length") +
  labs(color = "Follower Count", subtitle = "Videos with Above Average Likes") + xlim(c(0, 60))

## PLAYS VS VIDEO LENGTH based on n_followers
ggplot(all_sug_users, aes(x=video_length, y=n_plays)) + 
  geom_point(aes(colour=n_followers)) + 
  scale_colour_gradient(high = "#EE1D52", low = "#69C9D0",breaks = waiver(), n.breaks = 5)  + 
  geom_vline(xintercept = mean(abv_avg_likes$video_length)) +
  geom_hline(yintercept = mean(abv_avg_likes$n_likes)) +
  xlab("Video Length (s)") + ylab("Number of Plays") + 
  ggtitle("Number of Plays vs Video Length") +
  labs(color = "Follower Count") + xlim(c(0, 60))




# people with more followers seem to post shorter vids, so shorter the sweeter?


ggplot(top_users, aes(x=video_length, y=n_likes)) + 
  geom_point(aes(colour=n_followers)) + 
  geom_vline(xintercept = mean(top_users$video_length)) + 
  geom_hline(yintercept = mean(top_users$n_likes)) +
  xlab("Video Length (s)") + ylab("Number of likes") + 
  ggtitle("Number of Likes vs Video Length") +
  labs(color = "Follower Count") + xlim(c(0, 60)) +
  scale_colour_gradient(high = "#EE1D52", low = "#69C9D0",breaks = waiver(), n.breaks = 5)
  


# add n_hashtags
top_users$n_hash <- numeric(nrow(top_users))
for(i in 1:(nrow(top_users)-1)){
  top_users$n_hash[i+1] <- sum(strsplit(top_users$hashtags[i], "")[[1]] == "'")/2
}

## Likes vs Number of hashtags
ggplot(top_users, aes(x=n_hash, y=n_plays)) +
  geom_point(aes(colour=n_followers)) + 
  ggtitle("Number of Plays vs Number of Hashtags Used") +
  labs(color="Follower Count") + xlab("Number of Hashtags") + ylab("Number of Plays") +
  geom_hline(yintercept = mean(top_users$n_plays)) + 
  geom_vline(xintercept = mean(top_users$n_hash, na.rm = T)) + 
  scale_colour_gradient(high = "#EE1D52", low = "#69C9D0",breaks = waiver(), n.breaks = 5) 

ggplot(avg_minus_users, aes(x=n_hash)) + geom_density()

avg_plus_users <- top_users[top_users$n_likes > mean(top_users$n_likes),]
avg_minus_users <- top_users[top_users$n_likes < mean(top_users$n_likes),]

### Sample Song data
par(mfrow=c(2,2))

ggplot(sd0, aes(x=create_time, y=log(n_followers))) + 
  geom_point(aes(colour=n_followers)) + 
  ggtitle("Song: WAP feat. Megan Thee Stallion") + 
  xlab("Create Time") + ylab("Number of Followers (log scale)") + 
  labs(subtitle = "Followers vs Time of Creation", color = "Follower Count") + 
  scale_color_viridis(option = "C") + 
  theme(axis.text.x = element_blank(), axis.ticks.x = element_blank()) + 
  geom_hline(yintercept = log(summary_stats$avg_likes[1])) + 
  geom_smooth(method="lm")

ggplot(song_10, aes(x=create_time, y=log(n_likes))) + geom_point(aes(colour=n_followers)) + 
  ggtitle("Song: WAP feat. Megan Thee Stallion") + 
  xlab("Time") + ylab("Number of Likes (log scale)") + 
  labs(subtitle = "Likes vs Time", color = "Follower Count") + 
  scale_color_viridis(option = "C") + 
  theme(axis.text.x = element_blank(), axis.ticks.x = element_blank()) + 
  geom_hline(yintercept = log(summary_stats$avg_likes[1])) + 
  geom_smooth(method="lm")

### best looking graph
myPalette <- colorRampPalette(rev(brewer.pal(11, "Spectral")))

ggplot(sd0, aes(x=create_time, y=log(n_shares), linetype="Trendline")) + 
  geom_point(aes(colour=n_followers)) + 
  ggtitle("Song: Cardi B - WAP feat. Megan Thee Stallion") + xlab("Create Time") + 
  ylab("Number of Shares (log scale)") + 
  labs(subtitle = "Number of Shares vs Time of Creation", color = "Follower Count") + 
  theme(axis.text.x = element_blank(), axis.ticks.x = element_blank()) +
  geom_smooth(method="lm", se=F, aes(group=1), color="#EE1D52") + 
  scale_linetype_discrete(name = "") + 
  scale_colour_gradient(high = "#EE1D52", low = "#69C9D0",breaks = waiver(), n.breaks = 5)
  
  #scale_color_viridis(option = "C")


print(2)


ggplot(song_3, aes(x=create_time, y=log10(n_plays))) + 
  geom_point(aes(colour=n_followers)) + 
  ggtitle("Song: WAP feat. Megan Thee Stallion") + xlab("Time") + 
  ylab("Number of Plays (log scale)") + 
  labs(subtitle = "Plays vs Time", color = "Follower Count") + 
  scale_color_viridis(option = "C") + 
  theme(axis.text.x = element_blank(), axis.ticks.x = element_blank()) 



### Length of videos
ggplot(top_users, aes(x=video_length)) + 
  geom_histogram(fill="#EE1D52", aes(color = "#101010"), binwidth = 1) + 
  theme(legend.position = "none") + 
  xlab("Video Length (s)") + ylab("Count") + ggtitle("Video Length Distribution") +
  scale_x_continuous(breaks = seq(0,60,5), limits = c(0,60))

ggplot(all_sug_users, aes(x=video_length)) + 
  geom_histogram(fill="#EE1D52", aes(color = "#101010"), binwidth = 1) + 
  theme(legend.position = "none") + 
  xlab("Video Length (s)") + ylab("Count") + ggtitle("Video Length Distribution") +
  scale_x_continuous(breaks = seq(0,60,5), limits = c(0,60))



#### Second song:
ggplot(sd3, aes(x=create_time, y=log(n_shares), linetype="Trendline")) + 
  geom_point(aes(colour=n_followers)) + 
  ggtitle("Song: Miley Cyrus x Arctic Monkeys - 
Why’d You Only Call Me When You’re High") + xlab("Create Time") + 
  ylab("Number of Shares (log scale)") + 
  labs(subtitle = "Number of Shares vs Time of Creation", color = "Follower Count") + 
  theme(axis.text.x = element_blank(), axis.ticks.x = element_blank()) +
  geom_smooth(method="lm", se=F, aes(group=1), color="#EE1D52") + scale_linetype_discrete(name = "") +
  scale_colour_gradient(high = "#EE1D52", low = "#69C9D0",breaks = waiver(), n.breaks = 5)
