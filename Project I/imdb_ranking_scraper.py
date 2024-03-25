import requests
from bs4 import BeautifulSoup
import pandas as pd
import re

url = "https://www.imdb.com/list/ls097840768?page="

df = pd.DataFrame(columns=["position", "name", "year", "g1", "g2", "g3"])

for i in range(1, 3 + 1):

    response = requests.get(url + str(i))

    if response.status_code == 200:
        soup = BeautifulSoup(response.content, "html.parser")
        elems = soup.find_all("h3", class_="lister-item-header")
        genres = soup.find_all("span", class_="genre")
        
        if i == 3: genres.insert(47, genres[4])
        
        for j in range(len(elems)):
            data = elems[j].text.strip()
            data = data.split("\n")
            data[0] = data[0][:-1]
            data[1] = re.sub(r"'", r"\'", data[1])
            if data[0] == "197":
                data[2] = data[2][5:9]
            else:
                data[2] = data[2][1:5]
            
            data2 = genres[j].text.strip().split(", ")
            if len(data2) == 2: data2.append("none")
            if len(data2) == 1: data2 += ["none", "none"]
            if i == 3 and j == 47-1: data2 = ["Family", "History", "none"]
            if i == 3 and j == 46-1: data2 = ["Fantasy", "War", "none"]
            data += data2
            df.loc[len(df)] = data

    else: print("Connection error!")

df.to_csv("scraped_data/imdb_ranking.csv", index=False)

print(f"Scraping {url[:-6]} finished successfully!")