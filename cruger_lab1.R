library (dplyr)

#creates data frame with values for title, author, number in stock, and publication year
title <- c("k","r","c","l","z","t","n","h","l","p")
authors <- c("Mark","Mary","Raul","Julia","Emily","Charles","James","Isaac","Aria","Kevin")
stock <- c(100,29,73,34,58,68,47,88,59,31)
price <- c(6,13,8,8,4,5,10,6,7,4)
year <- c(2005,2016,1992,1998,2002,2002,2000,2008,1956,2008)
bookstore <- data.frame(title,authors,stock,price,year)

#sorts dataframe by year published (descending) and author name (ascending) if years are equal, saves new dataframe
bookstore_sorted <- bookstore %>%
  arrange(authors) %>%
  arrange(desc(year)) 

#applies discounts depending on stock level and publication year to calculate the new sale price
bookstore_sale <- bookstore %>%
  mutate(newprice=ifelse(year<2000 & stock>60,price*.5,ifelse(year<2000,price*.75,ifelse(stock>60,price*.6,price))))

#subsets sale dataframe so that it only includes books actually on sale and only displays title, author, and new price
bookstore_subset <- bookstore_sale %>%
  filter(newprice!=price) %>%
  select(authors,title,newprice)
