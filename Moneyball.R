batting<-data.table(fread('Batting.csv'))
head(batting$AB,6)
head(batting$X2B,6)
head(da)
da[,'2B',with=F]
batting$BA<-batting$H/batting$AB
tail(batting$BA,5)
batting$OBP<-(batting$H+batting$BB+batting$HBP)/(batting$AB+batting$BB+batting$HBP+batting$SF)
batting$X1B<-batting$H-batting$X2B-batting$X3B-batting$HR
batting$SLG<-((1*batting$X1B)+(2*(batting$X2B))+(3*(batting$X3B))+(4*(batting$HR)))/(batting$AB)
head(batting,5)
sal<-read.csv('Salaries.csv')
sal
head(sal)
str(sal)
head(batting)
min(batting$yearID)
#batting<-subset(batting,batting$yearID>=1985)
summary(batting)
combo<-merge(batting,sal,by=c('playerID','yearID'))
combo
summary(combo)
lost_players<-subset(combo,playerID %in% c('damonjo01','giambja01','saenzol01'))
lost_players
tail(lost_players)
req_2001<-subset(lost_players,yearID==2001)
req_2001[,c('playerID','H','2B','3B','HR','OBP','SLG','BA','AB')]
library(dplyr)
arrange(combo,salary,desc(AB),desc(mean(OBP)))

ggplot(combo,aes(x=OBP,y=salary))+geom_point(size=2)
combo<-subset(combo,salary<8000000 & OBP>0)
head(combo)
str(combo)
combo<-subset(combo,AB>=450)
options<-head(arrange(combo,desc(OBP)),10)
options[,c('playerID','AB','salary','OBP')]
