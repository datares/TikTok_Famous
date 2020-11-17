#Trending Videos

setwd("~/Desktop/TikTok_famous/Datasets/Trending Videos Data Collection")
library(tidyverse)


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
ggplot(abv_avg_likes, aes(x=video_length, y=n_likes)) + 
  geom_point(aes(colour=n_followers)) + 
  scale_color_viridis_c() + geom_vline(xintercept = mean(abv_avg_likes$video_length)) +
  geom_hline(yintercept = mean(abv_avg_likes$n_likes)) +
  xlab("Video Length (s)") + ylab("Number of likes") + 
  ggtitle("Number of Likes vs Video Length") +
  labs(color = "Follower Count", subtitle = "Videos with Above Average Likes") + xlim(c(0, 60))
# people with more followers seem to post shorter vids, so shorter the sweeter?


ggplot(top_users, aes(x=video_length, y=n_likes)) + 
  geom_point(aes(colour=n_followers)) + 
  scale_color_viridis_c() + geom_vline(xintercept = mean(top_users$video_length)) + 
  geom_hline(yintercept = mean(top_users$n_likes)) +
  xlab("Video Length (s)") + ylab("Number of likes") + 
  ggtitle("Number of Likes vs Video Length") +
  labs(color = "Follower Count", subtitle = "All Videos") + xlim(c(0, 60))


# add n_hashtags
top_users$n_hash <- numeric(nrow(top_users))
for(i in 1:(nrow(top_users)-1)){
  top_users$n_hash[i+1] <- sum(strsplit(abv_avg_likes$hashtags[i], "")[[1]] == "'")/2
}

## Likes vs Number of hashtags
ggplot(top_users, aes(x=n_hash, y=n_likes)) + 
  geom_point(aes(colour=n_followers)) + 
  scale_color_viridis_c() + ggtitle("Number of Likes vs Number of Hashtags Used") +
  labs(color="Follower Count") + xlab("Number of Hashtags") + ylab("Number of Likes") +
  geom_hline(yintercept = mean(top_users$n_likes)) + 
  geom_vline(xintercept = mean(top_users$n_hash, na.rm = T))


### Sample Song data
par(mfrow=c(2,2))

ggplot(sd0, aes(x=create_time, y=log(n_followers))) + 
  geom_point(aes(colour=n_followers)) + 
  ggtitle("Song: WAP feat. Megan Thee Stallion") + 
  xlab("Time") + ylab("Number of Followers (log scale)") + 
  labs(subtitle = "Followers vs Time", color = "Follower Count") + 
  scale_color_viridis(option = "C") + 
  theme(axis.text.x = element_blank(), axis.ticks.x = element_blank()) + 
  geom_hline(yintercept = log(summary_stats$avg_likes[1]))

ggplot(sd0, aes(x=create_time, y=log(n_likes))) + geom_point(aes(colour=n_followers)) + 
  ggtitle("Song: WAP feat. Megan Thee Stallion") + 
  xlab("Time") + ylab("Number of Likes (log scale)") + 
  labs(subtitle = "Likes vs Time", color = "Follower Count") + 
  scale_color_viridis(option = "C") + 
  theme(axis.text.x = element_blank(), axis.ticks.x = element_blank()) + 
  geom_hline(yintercept = log(summary_stats$avg_likes[1]))

ggplot(sd0, aes(x=create_time, y=log(n_shares))) + 
  geom_point(aes(colour=n_followers)) + 
  ggtitle("Song: WAP feat. Megan Thee Stallion") + xlab("Time") + 
  ylab("Number of Shares (log scale)") + 
  labs(subtitle = "Shares vs Time", color = "Follower Count") + 
  scale_color_viridis(option = "C") + 
  theme(axis.text.x = element_blank(), axis.ticks.x = element_blank()) 

ggplot(sd0, aes(x=create_time, y=log(n_plays))) + 
  geom_point(aes(colour=n_followers)) + 
  ggtitle("Song: WAP feat. Megan Thee Stallion") + xlab("Time") + 
  ylab("Number of Plays (log scale)") + 
  labs(subtitle = "Plays vs Time", color = "Follower Count") + 
  scale_color_viridis(option = "C") + 
  theme(axis.text.x = element_blank(), axis.ticks.x = element_blank()) 

