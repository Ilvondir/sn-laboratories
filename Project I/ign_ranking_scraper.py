import requests
from bs4 import BeautifulSoup
import pandas as pd
import re


url = 'https://www.ign.com/articles/the-best-100-video-games-of-all-time'
headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)'
    }
response = requests.get(url, headers=headers)


if response.status_code == 200:

    soup = BeautifulSoup(response.content, 'html.parser')
    data_elements = soup.find_all('strong')

    tab = pd.DataFrame(columns=["position", "name"])

    for element in data_elements:
        data = element.text.strip()
        data = data.split(" ", 1)
        data[0] = data[0][:-1]
        data[1] = re.sub(r"'", r"\'", data[1])
        tab.loc[len(tab)] = data

    tab.to_csv("scraped_data/ign_ranking.csv", index=False)

    print(f"Scraping {url} finished successfully!")

else: print('Connection error!')

