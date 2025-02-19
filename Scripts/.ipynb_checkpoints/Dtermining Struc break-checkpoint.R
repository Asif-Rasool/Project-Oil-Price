
gc()

# Determining structural breaks in time-series
# AuthorL Asif Rasool
# Date: 9/5/2023
# Useful links:
#   - https://cran.r-project.org/web/packages/Microsoft365R/vignettes/od_sp.html 


# Install Packages
# install.packages("Microsoft365R")
# install.packages("strucchange")
# install.packages("tseries")

# Load required packages
suppressPackageStartupMessages(library(Microsoft365R))
suppressPackageStartupMessages(library(strucchange))
suppressPackageStartupMessages(library(tseries))



# Get files from one drive

odb <- get_business_onedrive()
data <- odb$load_dataframe("Documents/Project Oil Price/dat.csv")
attach(data)

## Creating time series: nm_oil_price

nm_oil_price.ts <- ts(nm_oil_price, start = 2001, end = 2020, frequency = 4)
wti_spot_price.ts <- ts(wti_spot_price, start = 2001, end = 2020, frequency = 4)
index_china_gdp.ts <- ts(index_china_gdp, start = 2001, end = 2020, frequency = 4)

plot.ts(nm_oil_price.ts)
plot(wti_spot_price.ts)
plot(index_china_gdp.ts)

## Calculate the breakpoints: 
nm_oil_price.bp <- breakpoints(nm_oil_price.ts ~ 1, h = 12)
wti_spot_price.bp <- breakpoints(wti_spot_price.ts~1, h = 12)
index_china_gdp.bp <- breakpoints(index_china_gdp.ts ~ 1, h =12)

summary(nm_oil_price.bp)
summary(wti_spot_price.bp)
summary(index_china_gdp.bp)

coef(nm_oil_price.bp)
