library(geckor)
library(tidyverse)
library(ggplot2)
library(magrittr)

pantos_history <- coin_history(coin_id="pantos", 
                               vs_currency="usd", 
                               days = 'max', 
                               interval=NULL)

pantos_history<- pantos_history %>% mutate(market_cap= case_when(coin_id =="pantos" ~price* 486161689,TRUE ~ market_cap)) %>%
  mutate(net_ret = (price-lag(price))/lag(price) *100) %>%
  mutate(change_tv = (total_volume-lag(total_volume))/lag(total_volume) *100) %>%
  mutate(change_mc = (market_cap-lag(market_cap))/lag(market_cap) *100)

polkadot_history <- coin_history(coin_id = "polkadot", 
                                 vs_currency = "usd", 
                                 days = "max",
                                 interval = NULL)

polkadot_history<- polkadot_history %>% mutate(net_ret = (price-lag(price))/lag(price) *100) %>%
  mutate(change_tv = (total_volume-lag(total_volume))/lag(total_volume) *100) %>%
  mutate(change_mc = (market_cap-lag(market_cap))/lag(market_cap) *100)

cosmos_history <- coin_history(coin_id = "cosmos", 
                               vs_currency = "usd", 
                               days= 'max',
                               interval = NULL)

cosmos_history<- cosmos_history %>% mutate(net_ret = (price-lag(price))/lag(price) *100) %>%
  mutate(change_tv = (total_volume-lag(total_volume))/lag(total_volume) *100) %>%
  mutate(change_mc = (market_cap-lag(market_cap))/lag(market_cap) *100)

harmony_history <- coin_history(coin_id = "harmony", 
                                vs_currency = "usd", 
                                days= 'max',
                                interval = NULL)

harmony_history<- harmony_history %>% mutate(net_ret = (price-lag(price))/lag(price) *100) %>%
  mutate(change_tv = (total_volume-lag(total_volume))/lag(total_volume) *100) %>%
  mutate(change_mc = (market_cap-lag(market_cap))/lag(market_cap) *100)

best_history <- coin_history(coin_id = "bitpanda-ecosystem-token", 
                             vs_currency = "usd", 
                             days= 'max',
                             interval = NULL)

best_history<- best_history %>% mutate(net_ret = (price-lag(price))/lag(price) *100) %>%
  mutate(change_tv = (total_volume-lag(total_volume))/lag(total_volume) *100) %>%
  mutate(change_mc = (market_cap-lag(market_cap))/lag(market_cap) *100)

bnb_history <- coin_history(coin_id = "binancecoin", 
                            vs_currency = "usd", 
                            days= 'max',
                            interval = NULL)

bnb_history<- bnb_history %>% mutate(net_ret = (price-lag(price))/lag(price) *100) %>%
  mutate(change_tv = (total_volume-lag(total_volume))/lag(total_volume) *100) %>%
  mutate(change_mc = (market_cap-lag(market_cap))/lag(market_cap) *100)

tcap_history <- coin_history(coin_id = "total-crypto-market-cap-token", 
                             vs_currency = "usd", 
                             days= 'max',
                             interval = NULL)

tcap_history<- tcap_history %>% mutate(net_ret = (price-lag(price))/lag(price) *100) %>%
  mutate(change_tv = (total_volume-lag(total_volume))/lag(total_volume) *100) %>%
  mutate(change_mc = (market_cap-lag(market_cap))/lag(market_cap) *100)

history<- rbind(pantos_history, polkadot_history, cosmos_history, harmony_history,
                best_history, bnb_history, tcap_history)
history[sapply(history, is.infinite)] <- NaN
write.csv(history,file="history.csv")
#code below only needs to be run once, it will guide you to connect to google account
library(googlesheets4)
library(googledrive)
options(gargle_oauth_cache = ".secrets")
drive_auth(cache = ".secrets", email = "hanyuwangofficial@gmail.com")# email="" change to your own Google account
gs4_auth(token = drive_token())
history_gs<- gs4_create(
  "history", # file name
  sheets =history #data source
)








