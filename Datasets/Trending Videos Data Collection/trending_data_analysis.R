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

ggplot(top_songs_abv_avg, aes(x=create_time, y=n_likes)) + geom_point(aes(colour = song))


x <- names(sort(table(abv_avg_likes$song), decreasing = T)[1:10])

top_songs_abv_avg <- abv_avg_likes[abv_avg_likes$song %in% x,]
