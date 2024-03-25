import requests
import re
from bs4 import BeautifulSoup
import pandas as pd

url = "https://www.gamesradar.com/best-games-2023"
response = requests.get(url)
df = pd.DataFrame(columns=["position", "name"])

if response.status_code == 200:
    soup = BeautifulSoup(response.content, "html.parser").find("div", id="article-body")
    headers = soup.find_all("h2")

    for h2 in headers:
        data = h2.text.strip()
        if data != "Sign up to the GamesRadar+ Newsletter":
            data = data.split(" ", 1)
            data[0] = data[0][:-1]
            data[1] = re.sub(r"'", r"\'", data[1])
            df.loc[len(df)] = data
    
    df.to_csv("scraped_data/gamesradar_ranking.csv", index=False)
    print(f"Scraping {url} finished successfully!")

else:
    print("Connection error!")

    