import re
import requests
from bs4 import BeautifulSoup
import pandas as pd

platforms = ["ps1", "ps2", "ps3", "ps4", "ps5", "pc", "xbox-series-x"]
max_page = [8, 59, 52, 89, 24, 200, 14]

for jj in range(len(platforms)):

    url = f"https://www.metacritic.com/browse/game/{platforms[jj]}?page="
    headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)'
        }
    to_export = pd.DataFrame(columns=["position", "name", "year", "metacritic_score", "description"])


    for i in range(1, max_page[jj]+1):

        response = requests.get(url + str(i), headers=headers)

        if response.status_code == 200:
            soup = BeautifulSoup(response.content, "html.parser")
            cards = soup.find_all("div", class_="c-finderProductCard-game")

            for c in cards:
                title = c.find("h3", class_="c-finderProductCard_titleHeading")
                description = c.find("div", class_="c-finderProductCard_description")

                data = title.text.strip()
                data = data.split(" ", 1)
                data[0] = data[0][:-1]
                data[0] = int(re.sub(",", "", data[0]))
                data[1] = data[1].replace(r"'", r"\'")
                
                date = c.find("span", class_="u-text-uppercase")
                date = date.text.strip()
                date = date[-4:]
                data.append(date)

                metacritic = c.find("div", class_="c-siteReviewScore")
                metacritic = metacritic.text.strip()
                data.append(metacritic)

                description = description.text.strip()
                description = description.replace(r"'", r"\'")
                data.append(description)
                
                to_export.loc[len(to_export)] = data

            print(f"{platforms[jj]}: Page {i} scraped.")

        else: print("Connection error!")

    to_export.to_csv(f"scraped_data/metacritic_{platforms[jj]}_ranking.csv", index=False)
    print(f"Scraping {url[:-6]} finished successfully!")

    