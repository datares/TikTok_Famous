from urllib.request import urlopen
from bs4 import BeautifulSoup as soup

my_url = 'https://tikrank.com/tiktok-influencer-rank/top-100-influencer-in-tiktok-sorted-by-fans-weekly'

#opening up connection, grabbing the page
uClient = urlopen(my_url)
page_html = uClient.read()
uClient.close()

#html parsing
page_soup = soup(page_html, "html.parser")
ranks = page_soup.find_all("tr")

filename = 'top-100-tiktokers.csv'
f = open(filename, 'w')

headers = "Rank,Name,Followers,Videos,Views,Engagement\n"

f.write(headers)

for i in range(1,101):
    name = ranks[i].find_all("a", {"class": "dashboard__user__name"})[0].text
    followers = ranks[i].find_all("td")[2].text
    videos = ranks[i].find_all("td")[3].text
    views = ranks[i].find_all("td")[4].text
    engagement = ranks[i].find_all("td")[6].text
    f.write(str(i) + "," + name + "," + followers.replace(",","") + "," + videos.replace(",","") + "," + views + "," + engagement + "\n")

f.close()