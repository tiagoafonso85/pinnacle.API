# pinnacle.API
R Wrapper for the Pinnacle Sports API

The Pinnacle Sports ( www.pinnaclesports.com) manual can be found here :

http://www.pinnaclesports.com/en/api/manual

To use the Pinnacle Sports API you must have an account with Pinnacle Sports.
Please contact Pinnacle Sports directly at csd@pinnaclesports.com for all account questions.

Example Code
------------
``` r
library(pinnacle.API)
library(dplyr)
library(lubridate)
```
Please make sure that you understand the terms and conditions 
``` r
AcceptTermsAndConditions()
```
and then accept them. If AcceptTermsnAndConditions is not set to TRUE the functions will not run.
```r
AcceptTermsAndConditions(TRUE)
```
Your credentials are the username and password for logging into www.pinnaclesports.com
``` r
SetCredentials("MyUserName","MyPassWord")
```

Pull the Sport Data and filter out the leagues that have lines for Badminton availble

```r
Sport_data <- GetSports() 
Badminton_ID <- Sport_data$SportID[Sport_data$SportName=="Badminton"]
League_data <- GetLeagues("Badminton")
active_leagues <- League_data %>% 
  filter(LinesAvailable == 1)
Badminton_League_Ids <- active_leagues$LeagueID
```

Use the showOddsDF() function to aggregate all the data into a nicer data.frame
```r
badminton_data <- showOddsDF(sportname = "Badminton" , Badminton_League_Ids )
```

This DF has all the necessary IDs and information that you can then pass to the PlaceBet() function to place your wagers.