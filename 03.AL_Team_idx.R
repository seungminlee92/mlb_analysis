library(dplyr)
library(pwr)

#필요 표본수
pwr.f2.test(1, NULL, 0.01, 0.05, 0.95)
pwr.f2.test(1, NULL, 0.2, 0.05, 0.95)

(1302 + 66)/2

AL_Teams = subset(Teams,
                  lgID == 'AL')
dim(AL_Teams)
View(AL_Teams)
#승률 추가
AL_Teams$WinAVG = AL_Teams$W / AL_Teams$G
#기대 승률 추가
AL_Teams$EWA = EWA(AL_Teams$R, AL_Teams$RA)
#타율 추가
AL_Teams$AVG = AL_Teams$H / AL_Teams$AB
#출루율 추가
AL_Teams$OBP = (AL_Teams$H + AL_Teams$BB + AL_Teams$HBP) /
    (AL_Teams$AB + AL_Teams$BB + AL_Teams$HBP + AL_Teams$SF)
#장타율 추가
AL_Teams$SLG = (AL_Teams$H + AL_Teams$X2B + 
                    2 * AL_Teams$X3B + 
                      3 * AL_Teams$HR) / AL_Teams$AB
#단일 공격 지표 추가
AL_Teams$OPS = AL_Teams$OBP + AL_Teams$SLG
#GPA 추가
AL_Teams$GPA = (1.8 * AL_Teams$OBP + AL_Teams$SLG) / 4
#순장타율 추가
AL_Teams$ISO = AL_Teams$SLG - AL_Teams$AVG
#순출루율 추가
AL_Teams$EOBP = AL_Teams$OBP - AL_Teams$AVG
View(AL_Teams)
colnames(AL_Teams)

#팀별 기대승률 - 기대
boxplot(AL_Teams$EWA - AL_Teams$WinAVG)$stats
min(AL_Teams$EWA - AL_Teams$WinAVG)
max(AL_Teams$EWA - AL_Teams$WinAVG)

colnames(AL_Teams)
#AL팀의 성적 수치
AL_Teams_idx = AL_Teams %>% 
    select(-c(lgID, teamID, franchID, divID, DivWin, WCWin,
              LgWin, WSWin, name, park, teamIDBR,
              teamIDlahman45, teamIDretro))
dim(AL_Teams_idx)
View(AL_Teams_idx)
#최근 50년(1969~2018, 81, 94제외) AL팀의 성적 수치 + 결측치 제거
AL50_Teams_idx = subset(AL_Teams_idx,
                    yearID >= 1969 &
                        yearID <= 2018 &
                        yearID != 1981 &
                        yearID != 1994)
AL50_Teams_idx = na.omit(AL50_Teams_idx)

dim(AL50_Teams_idx)
View(AL50_Teams_idx)
#2018 Oak 성적 데이터
Oak2018_idx = subset(AL_Teams, yearID == 2018 &
                         franchID == 'OAK')
#2018 MIN 성적 데이터
Min2018_idx = subset(AL_Teams, yearID == 2018 &
                         franchID == 'MIN')
#2018 NYY 성적 데이터
Nyy2018_idx = subset(AL_Teams, yearID == 2018 &
                         franchID == 'NYY')

View(Oak2018_idx)
View(Min2018_idx)
View(Nyy2018_idx)

View(Teams)
