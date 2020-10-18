# TikTok_famous

[TikTok data collection article](https://towardsdatascience.com/how-to-collect-data-from-tiktok-tutorial-ab848b40d191)

[TikTok API](https://github.com/davidteather/TikTok-Api)



## Make virtual env:
python3 -m venv venv

## Access virtual env:
source venv/bin/activate

## Download dependencies:
pip install -r requirements.txt

## Produce requirements.txt format:
pip freeze

## Make kernel for jupyter notebook:
ipython kernel install --name=TikTok


## Importing the TikTok API
```
from TikTokApi import TikTokApi
api = TikTokApi()
```

I ran into an error when trying to use the api. Run this if error appears.
```
from TikTokApi.browser import set_async
set_async()
```
