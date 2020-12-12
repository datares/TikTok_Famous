# How to Become TikTok Famous :notes:
This project is a part of the [Data Blog](https://datares.github.io/#/datablog) at [DataResolutions](https://datares.github.io/#/).  The article published on this project, along with other articles from Data Blog, can be found on [Medium](https://medium.com/@ucladatares).

## Project Motivation/Description :dizzy:
The purpose of this project is to explore various aspects of TikTok—specifically the demographics of TikTok's most followed users and the analytics of trending videos on TikTok. Questions we wanted to answer include: what are the most popular "genres" on TikTok, what can we say about the most common demographics of the top TikTokers (is there an even distribution of gender, ethnicity, etc.), are there specific genres that men perform better in than women (also the same for different ethnicities).

### Technologies Used :computer:
* R 
* tidyverse, ggplot2 
* Python
* NumPy, Pandas, Matplotlib, SeasBorn, Plotly, jupyter

## Getting Started :page_facing_up:

1. Clone this repository (for help see this [tutorial](https://help.github.com/articles/cloning-a-repository/)).
2. Raw Data is being kept [here](https://github.com/ivantran96/TikTok_famous/tree/main/Datasets) within this repo.  
3. Data processing/visualization scripts are being kept [here](https://github.com/ivantran96/TikTok_famous/tree/main/Analysis)

## Data Collection :open_file_folder:
For the data collection, we had a different method of collection for our tiktok videos dataset and our top tiktokers dataset.

### TikTok Videos
[TikTok data collection article](https://towardsdatascience.com/how-to-collect-data-from-tiktok-tutorial-ab848b40d191)

[TikTok API](https://github.com/davidteather/TikTok-Api)

For the collection of our TikTok video data, we used [David Teather's Unofficial TikTok Api](https://github.com/davidteather/TikTok-Api). Using the api's `getSuggestedUsersbyID` method, we used the usernames of the top 250 TikTokers and collect around 1,700 suggested users. We then collected data of 25 videos from each of 1,700 suggested users with `byUsername` method.

In addition to the TikTok video data, we created a [script](https://github.com/ivantran96/TikTok_famous/blob/main/Datasets/Trending%20Videos%20Data%20Collection/Trending%20Songs/trending_songs.ipynb) that used the `bySound` method of the api to collect data of videos that use some of the most famous songs on TikTok to get an idea of how the choice of music can impact the potential of a video to become a trending video.

### Top TikTokers
For the collection of the top TikTokers, we use the simple webscraping module on Python [BeautifulSoup](https://www.crummy.com/software/BeautifulSoup/bs4/doc/). The scripts and html pages used can be seen [here](https://github.com/ivantran96/TikTok_famous/tree/main/Datasets/Top%20Tiktokers%20Data%20Collection) in this repo. For the webscraping, we found information for the first 6 columns of our dataset from [InflueceGrid](https://www.influencegrid.com/tiktok-influencers). The remaining information was manually entered, citing sources such as [Famous Birthdays](https://www.famousbirthdays.com/) and [TikTok](https://www.tiktok.com/en/).

This dataset `top-250-tiktokers.csv` looks into the demographics of the top 250 TikTokers and is used to explore possible commanalities of the top influencers on the platform.

It consists of 14 columns:
* `Rank`
* `Username`
* `Country`
* `Followers`
* `Views` (median of 15 most recent videos collected on 10-24-2020)
* `Likes` (median of 15 most recent videos collected on 10-24-2020)
* `Engagement` (Views + Likes + Shares / 15 most recent videos, collected on 10-24-2020)
* `Brand Account` (1 for true, 0 for false)
* `Gender` (Based on what information is public about their identity)
* `Age`
* `Ethnicity`
* `Famous` (1 for if they were already famous before TikTok, 0 for not)
* `Genre` (categories that would define their main content)
* `LBGTQ` (1 if they are a member of the LGBTQ community, 0 if not. Based on what information is public about their identity)

#### get-csv Webscraping
Simply using the get-csv.py script will allow you to obtain the first 6 columns of `top-250-tiktokers.csv`

1. Get the necessary libraries to obtain and parse the html of the data
`pip install beautifulsoup4`
`pip install urllib3`
2. Using `urllib.request` and `BeautifulSoup` you can retrieve the html of any page and make it "parsable". (Note: some sites are secure and can deter you from reading their url)
```
#open a url (my_url should be a string of the url)
uClient = urlopen(my_url)
page_html = uClient.read()
uClient.close()
#save the page as "soup" that can be parsed
page_soup = soup(page_html, "html.parser")
```
3. Following commands from the [BeautifulSoup Documentation](https://www.crummy.com/software/BeautifulSoup/bs4/doc/), you can get the necessary information from the html page and write it into a file (using commas and newline to make it a CSV file).

#### Adding remaining information
We were not able to find a cohesive list of information on the demographics of the top TikTokers, so we manually entered in the remaining columns.

## Data Cleaning :shower:

### TikTok Videos
In our `tiktok_data_cleaner.py` script, we created two functions to help clean our video data: `hashtag_cleaner` and `data_cleaner`. `hashtag_cleaner` extracts the hashtags from the video's description and stores it in a list. `data_cleaner` takes in a TikTok dictionary from the api and compiles/organizes the relavent data into a pandas data frame. With these two functions, we cleaned the video data we collected from 1,700 suggested users.

For the datasets involving the popular songs on TikTok, we first obtained the dictionaries from the api's `bySound` method and then collected the useful metrics into a pandas dataframe to make manipulating the data easier. Then we created some summary statistics to find out which songs had usable data to create visualizations that would help us answer the questions we had raised.

### Top TikTokers
For the `top-250-tiktokers.csv` dataset, we first removed the unnecessary symbols from our numerical column entries (such as the % or 'm' to indicate a million) and converted those datatypes from object to float. For the remaining columns, the entries were entered in manually so we did not have to clean up any possible duplicate/nonsensical values/entries that appeared in the data.

## Data Analysis :bar_chart:
Our analysis can be found [here](https://github.com/ivantran96/TikTok_famous/tree/main/Analysis). Each member of the team contributed to delevoping visualizations for our article, half working on Trending TikTok videos and the other half on demographics of the Top 250 TikTokers. The technologies we used is mentioned at the beginning of the README.

### TikTok Videos
Based on what TikTok says it's algorithm uses to recommend videos to users, some of the most important factors to make a video go viral are how it appeals to a variety of users and how users interact with these videos. Based on TikTok's [article](https://newsroom.tiktok.com/en-us/how-tiktok-recommends-videos-for-you/) regarding the "For You" recommendation process and general ideas that are used on other social media sites, we identified some of the important metrics for a successful video to be the length of the video, the hashtags used and the songs/sounds used.
Once we identified these metrics and had our datasets ready, we proceeded to create visualizations that could explore the connections these metrics have with the performance of videos. This was done by comparing how these metrics impacted the number of likes, plays, shares and comments a video got. Another trend we looked at was how a more popular TikToker can impact the creations of smaller TikTokers, and how this impacts the chance of video going viral.

### Top TikTokers
First we wanted to get a general sense of what demographics the top 250 TikTokers fall under. We used various categorical plots such as barplots from `Seaborn`, pie charts from `Matplotlib`, and a treemap from `Plotly` to have different and interesting visuals of the age, country, gender, and ethnicity distrbution of the users. We also wanted to see the distribution of genders and ethnicites of users specifically in the U.S.A (the country with the most top followed TikTokers) who were not previously famous to see what the most probable demographics of a "breakout" TikTok star would be. For this, we used a sanky diagram from `Plotly` to see the proportions of newly famous TikTokers in the US based on gender, ethnicity, and the main genre of their content.
Next we wanted to compare the differences in engagement between the top male and female users. We used barplots from `Seaborn` to compare the likes/views per each of the top genres for males and females on the platform. We also used a catplot from `Seaborn` with some added vertical line plots from `Matplotlib` to visualize the percentage difference in likes per view that men and women received in each of the top genres.

## Contributing DataRes Members :muscle:

|Name     | Position | GitHub Handle   | 
|---------|----------|----------------|
|Ivan Tran | Team Lead | [@ivantran96](https://github.com/ivantran96) |
|Kaushik Naresh | Member | [@kaushiknaresh47](https://github.com/kaushiknaresh47) |
|Isha Shah | Member | [@ishashah146](https://github.com/ishashah146) |
|Madison Kohls | Member | [@madisonkohls](https://github.com/madisonkohls) |
