import requests
from bs4 import BeautifulSoup
import pandas as pd
import re

BASE_URL = "https://steam250.com/tag/"
endpoints = ["comedy", "mystery", "sci-fi", "family_friendly", "horror", "fantasy", "romance", "drama", "war", "action", "historical", "adventure", "sports", "cartoony", "cartoon", "detective", "clicker", "survival", "zombies", "crafting", "education", "survival_horror", "magic", "dark"]

for i in range(len(endpoints)):
    response = requests.get(BASE_URL + endpoints[i])

    if response.status_code == 200:
        soup = BeautifulSoup(response.content, "html.parser")
        titles = soup.find_all("span", class_="title")
        dates = soup.find_all("div", class_="appline")

        p_tab = pd.DataFrame(columns=["position", "name"])
        dates_to_df = []

        for t in titles:
            if len(p_tab) < 150:
                data = t.text.strip()
                data = data.split(" ", 1)
                data[0] = data[0][:-1]
                data[1] = re.sub(r"™|®", "", data[1])
                data[1] = re.sub(r"'", r"\'", data[1])
                p_tab.loc[len(p_tab)] = data

        for j in range(len(dates)):
            d = dates[j].find("span", class_="date")
            if d == None:
                d = -1
            else: 
                d = d.text.strip()[-4:]
                if d == "days": d = "2024"
            dates_to_df.append(d)

        p_tab.insert(2, "year", dates_to_df)
    
        print(f"Scraping {BASE_URL + endpoints[i]} finished successfully!")

        p_tab.to_csv(f"scraped_data/steam_250_{endpoints[i]}.csv", index=False)


    else: print("Connection error!")

    