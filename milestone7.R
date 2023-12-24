# 95 % Confidence Interval for the data column "Age"#
age_data <- na.omit(Billionaires_Statistics_Dataset$age)
confidence_interval <- t.test(age_data, conf.level = .95)$conf.int
print(confidence_interval)

