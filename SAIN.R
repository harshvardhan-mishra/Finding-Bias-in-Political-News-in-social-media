library(twitteR)
library(tidyverse)

consumer_key <- "pp6wJWqiUPjIcW9h2x8736umj"
consumer_secret <- "wFyKdQNNrbWWmXUpHGVD6GYYteW0tvI0tqjkPZvYIUJnxlJzmw"
access_token <- "1465260144346865665-LpmNVXfr8BgAC5RiQAIfiXSkSqYTvZ"
access_secret <- "PwYFH65JmXiF1Pg85mvUFJgIlEf1kQAiCvetik26gORqp"

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

fn_twitter <- searchTwitter("#Houston",n=1000,lang="en")

fn_twitter_df <- twListToDF(fn_twitter) # Convert to data frame


tweet_words <- fn_twitter_df %>% select(id, text) %>% unnest_tokens(word,text)

tweet_words %>% count(word,sort=T) %>% slice(1:20) %>% 
  ggplot(aes(x = reorder(word, 
                         n, function(n) -n), y = n)) + geom_bar(stat = "identity") + theme(axis.text.x = element_text(angle = 60, 
                                                                                                                      hjust = 1)) + xlab("")


