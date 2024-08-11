library(lubridate)
library(ggplot2)

load("/Users/kristenpechin/Library/CloudStorage/GoogleDrive-carterkj@umich.edu/.shortcut-targets-by-id/1ehWwunuAo7CE1Vk2JYkUnQMmxh5pph3C/DATA/house_prices.rda")

head(house_prices)

house_prices$date <- as.Date(house_prices$date)

ggplot(house_prices, aes(x = date)) +
  geom_line(aes(y = unemploy_perc, color = "Unemployment Percentage")) +
  geom_line(aes(y = house_price_perc, color = "House Price Percentage")) +
  facet_wrap(~ state) +
  scale_x_date(breaks = ymd(c("1980-01-01", "2000-01-01", "2020-01-01")), 
               labels = c("80", "00", "20")) +
  labs(title = "Unemployment and House Price Percentages by State",
       x = "Year",
       y = "Percentage",
       color = "Measurement") +
  theme_minimal()

