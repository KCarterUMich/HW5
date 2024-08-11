# Load necessary libraries
library(ggplot2)

# Load the data
load("/Users/kristenpechin/Library/CloudStorage/GoogleDrive-carterkj@umich.edu/.shortcut-targets-by-id/1ehWwunuAo7CE1Vk2JYkUnQMmxh5pph3C/DATA/house_prices.rda")

# Convert 'date' to 'year'
house_prices$year <- as.numeric(format(house_prices$date, "%Y"))

# Plotting house price index trends by state
ggplot(house_prices, aes(x = year, y = house_price_index, group = state)) +
  geom_line() +
  facet_wrap(~ state, scales = "free_y") +
  scale_x_continuous(breaks = c(1980, 2000, 2020), labels = c("'80", "'00", "'20")) +
  theme_minimal() +
  labs(title = "House Price Index Trends by State",
       x = "Year",
       y = "House Price Index")

# Reshape data to long format for both house_price_index and unemploy_perc
house_reshaped <- house_prices %>%
  gather(key = "measure", value = "value", house_price_index, unemploy_perc, -date, -state, -year)

# Plotting the reshaped data with two lines for house_price_index and unemploy_perc
ggplot(house_reshaped, aes(x = year, y = value, color = measure)) +
  geom_line() +
  facet_wrap(~ state, scales = "free_y") +
  scale_x_continuous(breaks = c(1980, 2000, 2020), labels = c("'80", "'00", "'20")) +
  theme_minimal() +
  labs(title = "House Price Index and Unemployment Percentage Trends by State",
       x = "Year",
       y = "Value",
       color = "Measure")

#I think the end graph is a good graph to determine the correllation between housing prices and unemployment percentages. It shows that the house price index grows continually state by state. 
