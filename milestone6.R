#Scatterplot with X-Number of Billionaires and Y the gdp of their country#
library(ggplot2)
library(dplyr)

Billionaires_Statistics_Dataset$gdp_country <- as.numeric(gsub("[$,]", "", Billionaires_Statistics_Dataset$gdp_country))

billionaires_count <- Billionaires_Statistics_Dataset %>%
  count(gdp_country, name = "Number_of_Billionaires")

ggplot(billionaires_count, aes(x = Number_of_Billionaires, y = gdp_country)) +
  geom_point() +
  labs(title = "Scatterplot of Number of Billionaires vs GDP",
       x = "Number of Billionaires",
       y = "GDP of the Country") +
  scale_y_continuous(labels = scales::comma_format(scale = 1, suffix = "T"))


#Now excluding US and China#
Billionaires_Statistics_Dataset <- Billionaires_Statistics_Dataset %>%
  +     filter(!country %in% c("United States", "China")) %>%
  +     mutate(gdp_country = as.numeric(gsub("[$,]", "", gdp_country)))

 billionaires_count <- Billionaires_Statistics_Dataset %>%
    +     count(gdp_country, name = "Number_of_Billionaires")
  
 ggplot(billionaires_count, aes(x = Number_of_Billionaires, y = gdp_country)) +
    +     geom_point() +
    +     labs(title = "Scatterplot of Number of Billionaires vs GDP",
               +          x = "Number of Billionaires",
               +          y = "GDP of the Country (Excluding US and China)") +
    +     scale_y_continuous(labels = scales::comma_format(scale = 1, suffix = "T"))