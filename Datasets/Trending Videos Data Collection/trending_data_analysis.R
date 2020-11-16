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


## LIKES vs VIDEO LENGTH based on n_followers
ggplot(abv_avg_likes, aes(x=video_length, y=n_likes)) + 
  geom_point(aes(colour=n_followers)) + 
  scale_color_viridis_c() + geom_vline(xintercept = mean(abv_avg_likes$video_length))
# people with more followers seem to post shorter vids, so shorter the sweeter?


ggplot(top_users, aes(x=video_length, y=n_likes)) + 
  geom_point(aes(colour=n_followers)) + 
  scale_color_viridis_c() + geom_vline(xintercept = mean(top_users$video_length))


# add n_hashtags
top_users$n_hash <- numeric(nrow(top_users))
for(i in 1:(nrow(top_users)-1)){
  top_users$n_hash[i+1] <- sum(strsplit(abv_avg_likes$hashtags[i], "")[[1]] == "'")/2
}

## Likes vs Number of hashtags
ggplot(top_users, aes(x=n_followers, y=n_likes)) + 
  geom_point(aes(colour=n_total_likes)) + 
  scale_color_viridis_c()

