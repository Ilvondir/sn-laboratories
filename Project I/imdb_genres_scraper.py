import requests
from bs4 import BeautifulSoup
import pandas as pd

url = "https://www.imdb.com/list/ls097840768?page="
genres = []

for i in range(1, 3 + 1):
    response = requests.get(url + str(i))

    if response.status_code == 200:
        soup = BeautifulSoup(response.content, "html.parser")
        elems = soup.find_all("span", class_="genre")
        
        for e in elems:
            data = e.text.strip().split(", ")
            genres += [g for g in data if g not in genres]
            
    else: print("Connection error!")

df = pd.DataFrame({
    "genre": genres
})
df.to_csv("scraped_data/genres.csv", index=False)

print(f"Scraping genres finished successfully!")

