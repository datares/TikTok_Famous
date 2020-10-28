# outputs tiktok dictionaty of trending videos
# input: number of videos
# output: tiktok dictionary
def get_trending_data(n = 10):
    from TikTokApi import TikTokApi
    api = TikTokApi()
    from TikTokApi.browser import set_async
    set_async()
    trending_vids = api.trending(count=n)
    return trending_vids

# extracts hashtags from video description and outputs a list of hashtags
# input: string
# output: list
def hashtag_cleaner(x):
    hashtags = []
    spec_char = ["[", "]", "{", "}", "%",
                 "^", "*", "+", "=", "\\",
                 "|", "~", "<", ">", "€",
                 "£", "¥", "•", ".", ",",
                 "!", "'", '"', "-", "/",
                 ":", ";", "(", ")", "$",
                 "&", "#", " "]
    for i, val in enumerate(x):
        ht = ""
        if val == "#":
            while (i+1 != len(x)) and (x[i+1] not in spec_char):
                ht += x[i+1]
                i += 1
            hashtags.append(ht)
    return hashtags

# compiles data to a pandas dataframe
# input: tiktok dictionary
# output: cleaned dataframe
def data_cleaner(data):
    import pandas as pd
    vids = []
    for tiktok in data:
        vid = {}
        vid['user_name'] = tiktok['author']['uniqueId']
        vid['hashtags'] = hashtag_cleaner(tiktok['desc'])
        vid['video_length'] = tiktok['video']['duration']
        vid['n_likes'] = tiktok['stats']['diggCount']
        vid['n_shares'] = tiktok['stats']['shareCount']
        vid['n_comments'] = tiktok['stats']['commentCount']
        vid['n_plays'] = tiktok['stats']['playCount']
        vids.append(vid)
    vids_df = pd.DataFrame(vids)
    return vids_df

# saves dataframe to csv file
# input: datafran, name of file
def to_csv(df, name = "trending"):
    import pandas as pd
    file = name+".csv"
    df.to_csv(file, index=False)


def main():
    tiktok_dict = get_trending_data(n = 10)
    dataframe = data_cleaner(tiktok_dict)
    to_csv(dataframe)


if __name__ == "__main__":
    main()
