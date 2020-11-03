# Demystifying TikTok :musical_note:
This project is a part of the [Data Blog](https://datares.github.io/#/datablog) at [DataResolutions](https://datares.github.io/#/).  The article published on this project, along with other articles from Data Blog, can be found on [Medium](https://medium.com/@ucladatares).

## Project Motivation/Description :dizzy:
The purpose of this project is to explore various aspects of TikTok—specifically the demographics of TikTok's most followed users and the analytics of trending videos on TikTok. Questions we wanted to answer include: **Add stuff here**

### Technologies Used :computer:
* R 
* Python
* NumPy, Pandas, Matplotlib, SeasBorn, jupyter

## Getting Started :page_facing_up:

1. Clone this repository (for help see this [tutorial](https://help.github.com/articles/cloning-a-repository/)).
2. Raw Data is being kept [here](https://github.com/ivantran96/TikTok_famous/tree/main/Datasets) within this repo.  
3. Data processing/visualization scripts are being kept [here](https://github.com/ivantran96/TikTok_famous/tree/main/Visualizations)

## Data Collection :open_file_folder:
For the data collection, we had a different method of collection for our trending videos dataset and our top tiktokers dataset.

### Trending Videos
[TikTok data collection article](https://towardsdatascience.com/how-to-collect-data-from-tiktok-tutorial-ab848b40d191)
[TikTok API](https://github.com/davidteather/TikTok-Api)

...ADD PROCESS OF COLLECTION W/ API HERE...

### Top TikTokers
For the collection of the top TikTokers, we use the simple webscraping module on Python [BeautifulSoup](https://www.crummy.com/software/BeautifulSoup/bs4/doc/). The scripts and html pages used can be seen [here](https://github.com/ivantran96/TikTok_famous/tree/main/Datasets/Top%20Tiktokers%20Data%20Collection) in this repo. For the webscraping, we found information for the first 6 columns of our dataset from [InflueceGrid](https://www.influencegrid.com/tiktok-influencers). The remaining information was manually entered, citing sources such as [Famous Birthdays](https://www.famousbirthdays.com/) and [TikTok](https://www.tiktok.com/en/).

This dataset `top-260-tiktokers.csv` looks into the demographics of the top 260 TikTokers and is used to explore possible commanalities of the top influencers on the platform.

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
Simply using the get-csv.py script will allow you to obtain the first 6 columns of `top-260-tiktokers.csv`

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

## Data Cleaning 
For the `top-260-tiktokers.csv` dataset, we first removed the unnecessary symbols from our numerical column entries (such as the % or 'm' to indicate a million) and converted those datatypes from object to float. For the remaining columns, the entries were entered in manually so we did not have to clean up any possible duplicate/nonsensical values/entries that appeared in the data.

## Data Analysis :bar_chart:
Insert info here :)

## Contributing DataRes Members :muscle:

**Team Lead : Ivan Tran (https://github.com/[github handle])(@slackHandle)**

#### Other Members:

|Name     |  Slack Handle   | 
|---------|-----------------|
|Madison Kohls  | [@madisonkohls](https://github.com/madisonkohls)   |
|Full Name | [@janeDoe](https://github.com/[github handle])    |
|Full Name | [@janeDoe](https://github.com/[github handle])    |
