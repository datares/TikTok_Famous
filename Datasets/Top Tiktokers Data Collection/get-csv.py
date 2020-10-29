from urllib.request import urlopen
from bs4 import BeautifulSoup as soup

my_url = 'https://www.influencegrid.com/tiktok-influencers'

#opening up connection, grabbing the page
uClient = urlopen(my_url)
page_html = uClient.read()
uClient.close()

#csv file we are writing
filename = 'top-260-tiktokers.csv'
f = open(filename, 'w')
headers = "Rank,Username,Country,Followers,Views,Likes,Engagement\n"
f.write(headers)

ranking = 1

#html parsing PAGE 0
page_soup = soup(page_html, "html.parser")
ranks = page_soup.find_all("tr")


for i in range(1,21):
    name = ranks[i].find_all("p")[0].text
    country = ranks[i].find_all("div")[3].text
    followers = ranks[i].find_all("td")[2].text
    views = ranks[i].find_all("td")[3].text
    likes = ranks[i].find_all("td")[4].text
    engagement = ranks[i].find_all("td")[5].text
    f.write(str(ranking) + "," + name + "," + country + "," + followers.replace(",","") + "," + views.replace(",","") + "," + likes + "," + engagement + "\n")
    ranking += 1

#html parsing PAGE 1
fo = open("page1.html", "r")
pg_html = fo.read()
page_soup = soup(pg_html, "html.parser")
ranks = page_soup.find_all("tr")

for i in range(1,21):
    name = ranks[i].find_all("p")[0].text
    country = ranks[i].find_all("div")[3].text
    followers = ranks[i].find_all("td")[2].text
    views = ranks[i].find_all("td")[3].text
    likes = ranks[i].find_all("td")[4].text
    engagement = ranks[i].find_all("td")[5].text
    f.write(str(ranking) + "," + name + "," + country + "," + followers.replace(",","") + "," + views.replace(",","") + "," + likes + "," + engagement + "\n")
    ranking += 1

#html parsing PAGE 2
fo = open("page2.html", "r")
pg_html = fo.read()
page_soup = soup(pg_html, "html.parser")
ranks = page_soup.find_all("tr")

for i in range(1,21):
    name = ranks[i].find_all("p")[0].text
    country = ranks[i].find_all("div")[3].text
    followers = ranks[i].find_all("td")[2].text
    views = ranks[i].find_all("td")[3].text
    likes = ranks[i].find_all("td")[4].text
    engagement = ranks[i].find_all("td")[5].text
    f.write(str(ranking) + "," + name + "," + country + "," + followers.replace(",","") + "," + views.replace(",","") + "," + likes + "," + engagement + "\n")
    ranking += 1

#html parsing PAGE 3
fo = open("page3.html", "r")
pg_html = fo.read()
page_soup = soup(pg_html, "html.parser")
ranks = page_soup.find_all("tr")

for i in range(1,21):
    name = ranks[i].find_all("p")[0].text
    country = ranks[i].find_all("div")[3].text
    followers = ranks[i].find_all("td")[2].text
    views = ranks[i].find_all("td")[3].text
    likes = ranks[i].find_all("td")[4].text
    engagement = ranks[i].find_all("td")[5].text
    f.write(str(ranking) + "," + name + "," + country + "," + followers.replace(",","") + "," + views.replace(",","") + "," + likes + "," + engagement + "\n")
    ranking += 1

#html parsing PAGE 4
fo = open("page4.html", "r")
pg_html = fo.read()
page_soup = soup(pg_html, "html.parser")
ranks = page_soup.find_all("tr")

for i in range(1,21):
    name = ranks[i].find_all("p")[0].text
    country = ranks[i].find_all("div")[3].text
    followers = ranks[i].find_all("td")[2].text
    views = ranks[i].find_all("td")[3].text
    likes = ranks[i].find_all("td")[4].text
    engagement = ranks[i].find_all("td")[5].text
    f.write(str(ranking) + "," + name + "," + country + "," + followers.replace(",","") + "," + views.replace(",","") + "," + likes + "," + engagement + "\n")
    ranking += 1

#html parsing PAGE 5
fo = open("page5.html", "r")
pg_html = fo.read()
page_soup = soup(pg_html, "html.parser")
ranks = page_soup.find_all("tr")

for i in range(1,21):
    name = ranks[i].find_all("p")[0].text
    country = ranks[i].find_all("div")[3].text
    followers = ranks[i].find_all("td")[2].text
    views = ranks[i].find_all("td")[3].text
    likes = ranks[i].find_all("td")[4].text
    engagement = ranks[i].find_all("td")[5].text
    f.write(str(ranking) + "," + name + "," + country + "," + followers.replace(",","") + "," + views.replace(",","") + "," + likes + "," + engagement + "\n")
    ranking += 1

#html parsing PAGE 6
fo = open("page6.html", "r")
pg_html = fo.read()
page_soup = soup(pg_html, "html.parser")
ranks = page_soup.find_all("tr")

for i in range(1,21):
    name = ranks[i].find_all("p")[0].text
    country = ranks[i].find_all("div")[3].text
    followers = ranks[i].find_all("td")[2].text
    views = ranks[i].find_all("td")[3].text
    likes = ranks[i].find_all("td")[4].text
    engagement = ranks[i].find_all("td")[5].text
    f.write(str(ranking) + "," + name + "," + country + "," + followers.replace(",","") + "," + views.replace(",","") + "," + likes + "," + engagement + "\n")
    ranking += 1

#html parsing PAGE 7
fo = open("page7.html", "r")
pg_html = fo.read()
page_soup = soup(pg_html, "html.parser")
ranks = page_soup.find_all("tr")

for i in range(1,21):
    name = ranks[i].find_all("p")[0].text
    country = ranks[i].find_all("div")[3].text
    followers = ranks[i].find_all("td")[2].text
    views = ranks[i].find_all("td")[3].text
    likes = ranks[i].find_all("td")[4].text
    engagement = ranks[i].find_all("td")[5].text
    f.write(str(ranking) + "," + name + "," + country + "," + followers.replace(",","") + "," + views.replace(",","") + "," + likes + "," + engagement + "\n")
    ranking += 1

#html parsing PAGE 8
fo = open("page8.html", "r")
pg_html = fo.read()
page_soup = soup(pg_html, "html.parser")
ranks = page_soup.find_all("tr")

for i in range(1,21):
    name = ranks[i].find_all("p")[0].text
    country = ranks[i].find_all("div")[3].text
    followers = ranks[i].find_all("td")[2].text
    views = ranks[i].find_all("td")[3].text
    likes = ranks[i].find_all("td")[4].text
    engagement = ranks[i].find_all("td")[5].text
    f.write(str(ranking) + "," + name + "," + country + "," + followers.replace(",","") + "," + views.replace(",","") + "," + likes + "," + engagement + "\n")
    ranking += 1

#html parsing PAGE 9
fo = open("page9.html", "r")
pg_html = fo.read()
page_soup = soup(pg_html, "html.parser")
ranks = page_soup.find_all("tr")

for i in range(1,21):
    name = ranks[i].find_all("p")[0].text
    country = ranks[i].find_all("div")[3].text
    followers = ranks[i].find_all("td")[2].text
    views = ranks[i].find_all("td")[3].text
    likes = ranks[i].find_all("td")[4].text
    engagement = ranks[i].find_all("td")[5].text
    f.write(str(ranking) + "," + name + "," + country + "," + followers.replace(",","") + "," + views.replace(",","") + "," + likes + "," + engagement + "\n")
    ranking += 1

#html parsing PAGE 10
fo = open("page10.html", "r")
pg_html = fo.read()
page_soup = soup(pg_html, "html.parser")
ranks = page_soup.find_all("tr")

for i in range(1,21):
    name = ranks[i].find_all("p")[0].text
    country = ranks[i].find_all("div")[3].text
    followers = ranks[i].find_all("td")[2].text
    views = ranks[i].find_all("td")[3].text
    likes = ranks[i].find_all("td")[4].text
    engagement = ranks[i].find_all("td")[5].text
    f.write(str(ranking) + "," + name + "," + country + "," + followers.replace(",","") + "," + views.replace(",","") + "," + likes + "," + engagement + "\n")
    ranking += 1

#html parsing PAGE 11
fo = open("page11.html", "r")
pg_html = fo.read()
page_soup = soup(pg_html, "html.parser")
ranks = page_soup.find_all("tr")

for i in range(1,21):
    name = ranks[i].find_all("p")[0].text
    country = ranks[i].find_all("div")[3].text
    followers = ranks[i].find_all("td")[2].text
    views = ranks[i].find_all("td")[3].text
    likes = ranks[i].find_all("td")[4].text
    engagement = ranks[i].find_all("td")[5].text
    f.write(str(ranking) + "," + name + "," + country + "," + followers.replace(",","") + "," + views.replace(",","") + "," + likes + "," + engagement + "\n")
    ranking += 1

#html parsing PAGE 12
fo = open("page12.html", "r")
pg_html = fo.read()
page_soup = soup(pg_html, "html.parser")
ranks = page_soup.find_all("tr")

for i in range(1,21):
    name = ranks[i].find_all("p")[0].text
    country = ranks[i].find_all("div")[3].text
    followers = ranks[i].find_all("td")[2].text
    views = ranks[i].find_all("td")[3].text
    likes = ranks[i].find_all("td")[4].text
    engagement = ranks[i].find_all("td")[5].text
    f.write(str(ranking) + "," + name + "," + country + "," + followers.replace(",","") + "," + views.replace(",","") + "," + likes + "," + engagement + "\n")
    ranking += 1

f.close()