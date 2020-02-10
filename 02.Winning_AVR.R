library(dplyr)
library(Lahman)     #MLB Data
View(Lahman::Teams)

#AL Teams
AL_Teams = subset(Teams,
                  lgID == 'AL')
View(AL_Teams)
#AL 최근 50년(1969 ~ 2018, 94제외) 지구 우승팀 평균 승률
AL50_Teams_1 = subset(AL_Teams,
                    yearID >= 1969 &
                        yearID <= 2018 &
                        yearID != 1981 &
                        yearID != 1994 &
                        Rank == 1)
mean(AL50_Teams_1$W)/mean(AL50_Teams_1$G)

mean(EWA(AL50_Teams_1$R, AL50_Teams_1$RA))
mean(AL50_Teams_1$R)
mean(AL50_Teams_1$RA)
#AL 최근 50년(1969 ~ 2018, 94제외) 각 지구 우승팀 평균 승률 - 큰 차이 없음
AL50_Teams_W_1 = subset(AL_Teams,
                        divID == 'W' &
                            yearID >= 1969 &
                            yearID <= 2018 &
                            yearID != 1981 &
                            yearID != 1994 &
                            Rank == 1)
AL50_Teams_C_1 = subset(AL_Teams,
                        divID == 'C' &
                            yearID >= 1969 &
                            yearID <= 2018 &
                            yearID != 1981 &
                            yearID != 1994 &
                            Rank == 1)
AL50_Teams_E_1 = subset(AL_Teams,
                        divID == 'E' &
                            yearID >= 1969 &
                            yearID <= 2018 &
                            yearID != 1981 &
                            yearID != 1994 &
                            Rank == 1)
mean(AL50_Teams_W_1$W)/mean(AL50_Teams_W_1$G)
mean(AL50_Teams_C_1$W)/mean(AL50_Teams_C_1$G)
mean(AL50_Teams_E_1$W)/mean(AL50_Teams_E_1$G)

mean(EWA(AL50_Teams_W_1$R, AL50_Teams_W_1$RA))
mean(EWA(AL50_Teams_C_1$R, AL50_Teams_C_1$RA))
mean(EWA(AL50_Teams_E_1$R, AL50_Teams_E_1$RA))

mean(AL50_Teams_W_1$R)
mean(AL50_Teams_W_1$RA)

mean(AL50_Teams_C_1$R)
mean(AL50_Teams_C_1$RA)

mean(AL50_Teams_E_1$R)
mean(AL50_Teams_E_1$RA)
#AL 18년도 2위팀
AL2018_W_2 = subset(AL_Teams,
                    yearID == 2018 &
                        divID == 'W' &
                        Rank == 2)
AL2018_C_2 = subset(AL_Teams,
                    yearID == 2018 &
                        divID == 'C' &
                        Rank == 2)
AL2018_E_2 = subset(AL_Teams,
                    yearID == 2018 &
                        divID == 'E' &
                        Rank == 2)

Oak2018 = AL2018_W_2
Min2018 = AL2018_C_2
Nyy2018 = AL2018_E_2

Oak2018$W / Oak2018$G           #실제 2018 승률
EWA(Oak2018$R, Oak2018$RA)      #예측 2018 승률
Min2018$W / Min2018$G           #실제 2018 승률
EWA(Min2018$R, Min2018$RA)      #예측 2018 승률
Nyy2018$W / Nyy2018$G           #실제 2018 승률
EWA(Nyy2018$R, Nyy2018$RA)      #예측 2018 승률
