# Value in the NFL Draft

## Goal of the Study
Every year the 32 NFL teams draft to select the next generation of NFL players. With the order going from worst to best record in the previous season, it's where teams try to ensure future success. What I wanted to analyze was if current methods used to value draft picks was optimal, and to see how important drafting is for team success.
## Draft Pick Value
According to Bill Belichick, all NFL teams use about the same valuation for draft picks, ESPN lists what is the consensus for the value of each pick. Under this valuation each pick is worth increasingly less than the previous pick. The valuation is used to make trades of draft picks; if you offer picks of equal or greater value it should be accepted.
## Player Value
When trying to find out a measure of player value that allowed for comparison across position I found a metric from Pro Football Focus called Approximate Value. The formula was created for just this purpose and uses a variety of statistics to determine the final product. The creator of Approximate Value, Doug Drinen, explained:
"AV is not meant to be a be-all end-all metric. Football stat lines just do not come close to capturing all the contributions of a player the way they do in baseball and basketball. If one player is a 16 and another is a 14, we can't be very confident that the 16AV player actually had a better season than the 14AV player. But I am pretty confident that the collection of all players with 16AV played better, as an entire group, than the collection of all players with 14AV."
For this project I used Weighted Average Value, as it values players with high peaks over those with consistent numbers over long careers. This helps account for injuries that derail promising careers, as well as that one exceptional season is much more likely to help win a super bowl, the ultimate goal of all NFL teams.
## Dataset Being Used
For this project I decided to use players drafted fro 2000 until 2022. The reason I used 2000 is not simply because of the new milenium, but because 2000 is the earliest draft class that had an active player in the 2022 season, Tom Brady. I combined all of the data from each draft class listed on Pro Football Reference into one spreadsheet, starting with Courtney Brown and ending with Brock Purdy.
## Data Cleaning
In order to ensure the validity of the data I had to do a handful of tasks to ensure the data was accurate. The first was to add the year each player was drafted, allowing me to group each draft class. 
Next I had to make sure that the team each player was drafted by used the team’s current name. The Chargers, Rams, Raiders, and Commanders have all changed their official names, and other teams are listed under a different abbreviation, like the Packers being listed as GNB but are typically just called GB. 
Finally, I had to verify the accurate position of each player. Defensive players were not consistently listed for each position. Some players were not listed at Defensive End or Defensive Tackle, but rather just Defensive Line. Because very few were listed that way, I went and found the true position of every player listed at Defensive Line. 
For Linebackers, a small number were listed at Outside Linebacker or Inside Linebacker, but because the vast majority were just listed at Linebacker, I standardized all to just Linebacker.
It was the same for Defensive Backs, almost all were listed at that position, so players listed at Safety or Cornerback were switched.
Finally, Offensive Linemen without a specific position were also a very small number, so I found all of their true positions and switched them.
## Data Visualized
![Pick Value VS  Weighted Average Value](https://user-images.githubusercontent.com/126966561/225391753-52104b58-2a1b-4dbe-92b4-8d82698ef278.jpeg)

Because the space between picks is not constant, there is a large concentration of players with low value picks. However, the line drawn by R shows there is a increase in Weighted Approximate Value overall as Pick Value increases.
## Regressions
The first regression I created in R only used one variable, pick value, and it attempted to explain the Weighted Adjusted Value of players. The problem I encourted was the players drafted very recently were being compared against players who had played many more seasons and accumulated more Weighted Adjusted Value. Because I wanted an accurate representation of each player, I added year drafted as a second variable. The final regression I ended with was E[Weighted Approximate Value] =  9.50856+2.00706*(Pick Value^0.5)-8.71421*(2023-Year Drafted)^-0.3-1.97556*(Pick Value)^0.5*(2023-Year Drafted)^0.3.
## When to Draft Each Position

## Draft Performance by Team

## Effect of Draft Performance on Winning Percentage
