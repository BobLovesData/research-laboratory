import pandas as pd
import requests
import shutil
import os

urls = pd.read_csv('raw_data_urls.csv')


def download_file(url):
    local_filename = url.split('/')[-1]
    r = requests.get(url, stream=True)
    with open(os.path.join('TaxiDriveData',local_filename), 'wb') as f:
        shutil.copyfileobj(r.raw,f)

    return local_filename


for index, row in urls.iterrows():
    download_file(row['url'])

