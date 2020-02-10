library(ggplot2)
#AL 최근 50년 팀
AL50_Teams = subset(AL_Teams,
                    yearID >= 1969 &
                        yearID <= 2018 &
                        yearID != 1981 &
                        yearID != 1994)

#OPS 범위
boxplot(AL50_Teams$OPS)$stat

##간격 0.1
OPS_01 = as.data.frame(table(cut(AL50_Teams$OPS,
                                 breaks = seq(0.5, 1, 0.1))))
nrow(OPS_01)
ggplot(data = OPS_01,
       aes(x = Var1,
           y = Freq)) + geom_col()

OPS_001 = as.data.frame(table(cut(AL50_Teams$OPS,
                                  breaks = seq(0.5, 1, 0.01))))
nrow(OPS_001)
table(ifelse(OPS_001$Freq == 0,
             'F',
             'T'))

ggplot(data = OPS_001,
       aes(x = Var1,
           y = Freq)) + geom_col()
##간격 0.001
OPS_0001 = as.data.frame(table(cut(AL50_Teams$OPS,
                                   breaks = seq(0.5, 1, 0.001))))
nrow(OPS_0001)
OPS_0001
ggplot(data = OPS_0001,
       aes(x = Var1,
           y = Freq)) + geom_col()

table(ifelse(OPS_0001$Freq == 0,
             'F',
             'T'))
