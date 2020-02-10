library(dplyr)
library(Lahman)

NL_Teams = subset(Teams,
                  lgID == 'NL')
dim(NL_Teams)
View(NL_Teams)
#승률 추가
NL_Teams$WinAVG = NL_Teams$W / NL_Teams$G
#기대 승률 추가
NL_Teams$EWA = EWA(NL_Teams$R, NL_Teams$RA)
#타율 추가
NL_Teams$AVG = NL_Teams$H / NL_Teams$AB
#출루율 추가
NL_Teams$OBP = (NL_Teams$H + NL_Teams$BB + NL_Teams$HBP) /
    (NL_Teams$AB + NL_Teams$BB + NL_Teams$HBP + NL_Teams$SF)
#장타율 추가
NL_Teams$SLG = (NL_Teams$H + NL_Teams$X2B + 
                    2 * NL_Teams$X3B + 
                    3 * NL_Teams$HR) / NL_Teams$AB
#단일 공격 지표 추가
NL_Teams$OPS = NL_Teams$OBP + NL_Teams$SLG
#GPA 추가
NL_Teams$GPA = (1.8 * NL_Teams$OBP + NL_Teams$SLG) / 4
#순장타율 추가
NL_Teams$ISO = NL_Teams$SLG - NL_Teams$AVG
#순출루율 추가
NL_Teams$EOBP = NL_Teams$OBP - NL_Teams$AVG
View(NL_Teams)
colnames(NL_Teams)

#NL팀의 성적 수치
NL_Teams_idx = NL_Teams %>% 
    select(-c(lgID, teamID, franchID, divID, DivWin, WCWin,
              LgWin, WSWin, name, park, teamIDBR,
              teamIDlahman45, teamIDretro))
dim(NL_Teams_idx)
View(NL_Teams_idx)

#최근 50년(1969~2018, 81, 94제외) NL팀의 성적 수치 + 결측치 제거
NL50_Teams_idx = subset(NL_Teams_idx,
                        yearID >= 1969 &
                            yearID <= 2018 &
                            yearID != 1981 &
                            yearID != 1994)
NL50_Teams_idx = na.omit(NL50_Teams_idx)

dim(NL50_Teams_idx)
View(NL50_Teams_idx)
