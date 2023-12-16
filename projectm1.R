#For the Gender Bar Graph#
install.packages("ggplot2")
library(ggplot2)

ggplot(Billionaires_Statistics_Dataset, aes(x = gender, fill = gender)) +
  +     geom_bar() +
  +     labs(title = "Distribution of Billionaires by Gender", x = "Gender", y = "Count") +
  +     scale_fill_manual(values = c("M" = "skyblue", "F" = "pink"))

#For the top 10 Countries Histogram#
library(ggplot2)
library(dplyr)

country_summary <- Billionaires_Statistics_Dataset %>%
  group_by(country) %>%
  summarize(count = n()) %>%
  arrange(desc(count)) %>%
  mutate(country_grouped = ifelse(row_number() <= 10, as.character(country), "Other"))

ggplot(country_summary, aes(x = fct_reorder(country_grouped, count), y = count, fill = country_grouped)) +
  geom_bar(stat = "identity") +
  labs(title = "Distribution of Billionaires by Country", x = "Country", y = "Count") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#For the top 12 industries
library(ggplot2)
library(dplyr)

industry_summary <- Billionaires_Statistics_Dataset %>%
  group_by(industries) %>%
  summarize(count = n()) %>%
  arrange(desc(count)) %>%
  mutate(
    industry_grouped = ifelse(row_number() <= 12, as.character(industries), "Other"),
    industry_grouped = factor(industry_grouped, levels = c(as.character(industries), "Other"))
  )

ggplot(industry_summary, aes(x = industry_grouped, y = count, fill = industry_grouped)) +
  geom_col() +
  labs(title = "Distribution of Billionaires by Industry", x = "Industry", y = "Count") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#for the ages of billionaires#

library(ggplot2)

ggplot(Billionaires_Statistics_Dataset, aes(x = age, fill = ..count..)) +
  geom_histogram(binwidth = 1, boundary = 0, color = "white") +
  labs(title = "Distribution of Billionaires by Age", x = "Age", y = "Count") +
  scale_x_continuous(breaks = seq(0, 100, by = 5)) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

