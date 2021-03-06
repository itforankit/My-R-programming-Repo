setwd("C:\\Machine Learning\\datasciencecoursera")
library(swirl)
swirl()
mydf <- read.csv(path2csv, stringsAsFactors = FALSE)
dim(mydf)
head(mydf)
library(dplyr)
package_version("dplyr")
cran<-tbl_df(mydf)
rm("mydf")
install.packages("utf8")
select(cran,ip_id,package,country)
select (cran, r_arch:country)
select (cran, country:r_arch)
select(cran,-time)
select (cran,-(X:size))
filter(cran,package=="swirl")
filter(cran, r_version == "3.1.1", country == "US")
filter(cran, r_version <= "3.0.2", country == "IN")
filter(cran, country == "US" | country == "IN")
filter(cran, size > 100500 , r_os == "linux-gnu")
filter(cran, size > 100500 & r_os == "linux-gnu")
is.na(c(3, 5, NA, 10))
!is.na(c(3, 5, NA, 10))
filter(cran, !is.na(r_version))
cran2<-select(cran,size:ip_id)
arrange(cran2,ip_id)
arrange(cran2,desc(ip_id))
arrange(cran2, package, ip_id)
arrange(cran2, country, desc(r_version),ip_id)
cran3
mutate(cran3, size_mb = size / 2^20)
mutate(cran3, size_mb = size / 2^20,size_gb = size_mb / 2^10)
mutate(cran3, correct_size=size+1000)
summarize(cran, avg_bytes = mean(size))

by_package<-group_by(cran,package)
summarize(by_package,mean(size))


pack_sum <- summarize(by_package,
                      count = n(),
                      unique = n_distinct(ip_id),
                      countries = n_distinct(country),
                      avg_bytes = mean(size))

quantile(pack_sum$count,probs = 0.99)
top_counts<-filter(pack_sum, count>679)
View(top_counts)
top_counts_sorted<-arrange(top_counts,desc(count))
View(top_counts_sorted)
quantile(pack_sum$unique,probs = 0.99)
top_unique<-filter(pack_sum, unique>465)
View(top_unique)
top_unique_sorted<-arrange(top_unique,desc(unique))
View(top_unique_sorted)

by_package <- group_by(cran, package)
pack_sum <- summarize(by_package,
                      count = n(),
                      unique = n_distinct(ip_id),
                      countries = n_distinct(country),
                      avg_bytes = mean(size))

# Here's the new bit, but using the same approach we've
# been using this whole time.

top_countries <- filter(pack_sum, countries > 60)
result1 <- arrange(top_countries, desc(countries), avg_bytes)

# Print the results to the console.
print(result1)


result2 <-
  arrange(
    filter(
      summarize(
        group_by(cran,
                 package
        ),
        count = n(),
        unique = n_distinct(ip_id),
        countries = n_distinct(country),
        avg_bytes = mean(size)
      ),
      countries > 60
    ),
    desc(countries),
    avg_bytes
  )

print(result2)

#using chain opreator
result3 <-
  cran %>%
  group_by(package) %>%
  summarize(count = n(),
            unique = n_distinct(ip_id),
            countries = n_distinct(country),
            avg_bytes = mean(size)
  ) %>%
  filter(countries > 60) %>%
  arrange(desc(countries), avg_bytes)

# Print result to console
print(result3)



cran %>%
  select(ip_id, country, package, size) %>%
  mutate(size_mb = size / 2^20) %>%
  filter(size_mb <= 0.5) %>%
  # Your call to arrange() goes here
  arrange(desc(size_mb)) %>%
  print()







