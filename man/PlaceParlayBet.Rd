% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PlaceParlayBet.R
\name{PlaceParlayBet}
\alias{PlaceParlayBet}
\title{PlaceParlayBet}
\usage{
PlaceParlayBet(riskAmount, legslist, roundRobinOptions = c("Parlay",
  "TwoLegRoundRobin", "ThreeLegRoundRobin", "FourLegRoundRobin",
  "FiveLegRoundRobin", "SixLegRoundRobin", "SevenLegRoundRobin",
  "EightLegRoundRobin")[1], oddsFormat = "AMERICAN",
  acceptBetterLine = TRUE)
}
\arguments{
\item{riskAmount}{numeric Wager amount in  currency}

\item{legslist}{A list of wagers, where each wager must be in named list format. Required named values are: legBetType, lineId, either team or side, and periodNumber. Optional named values are: altLineId, pitcher1MustStart, or pitcher2MustStart. See the API Manual for more info
\itemize{
\item{lineId}
\item{altLineId OPTIONAL}
\item{sportId}
\item{eventId}
\item{periodNumber}
\item{legBetType
\itemize{
\item{MONEYLINE}
\item{SPREAD}
\item{TOTAL}
\item{TEAMTOTAL}
}
}
\item{team/side using one will invalidate the other}
\item{pitcher1MustStart OPTIONAL}
\item{pitcher2MustStart OPTIONAL}
}}

\item{roundRobinOptions}{one of the round robin options, default is 'Parlay'
\itemize{
\item{Parlay}
\item{TwoLegRoundRobin}
\item{ThreeLegRoundRobin}
\item{FourLegRoundRobin}
\item{FiveLegRoundRobin}
\item{SixLegRoundRobin}
\item{SevenLegRoundRobin}
\item{EightLegRoundRobin}
}}

\item{oddsFormat}{default:'AMERICAN'
\itemize{
\item{AMERICAN}
\item{DECIMAL}
\item{HONGKONG}
\item{INDONESIAN}
\item{MALAY}
}}

\item{acceptBetterLine}{: Default TRUE ,boolean Whether or not to accept a bet when there is a line change in favor of the client}
}
\value{
list containing:
\itemize{
  \item{status}  If Status is PROCESSED_WITH_ERROR errorCode will be in the response
  \item{errorCode}
}
}
\description{
Place parlay or round robin parlay bet in the system
}
\examples{
\donttest{
SetCredentials("TESTAPI","APITEST")
AcceptTermsAndConditions(accepted=TRUE)
parlay1 <-  list(lineId = 222136736,
                 sportId=1,
                 eventId = 495418854,
                 periodNumber=0,
                 legBetType = "MONEYLINE",
                 team = 'TEAM1')
parlay2 <- list(lineId = 223187865,
                 sportId=1,
                 eventId = 496997901,
                 periodNumber=0,
                 legBetType = "TOTAL_POINTS",
                 side = 'OVER')
legslist <- list(parlay1,parlay2)


PlaceParlayBet(riskAmount=10, 
               legslist=legslist,
               roundRobinOptions="Parlay",
               oddsFormat="AMERICAN" ,
               acceptBetterLine=TRUE)
}


}
