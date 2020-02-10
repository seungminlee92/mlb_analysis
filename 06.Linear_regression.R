library(dplyr)
library(ggplot2)
#선형회귀
boxplot(AL50_Teams_idx$OPS)$stats
View(AL50_Teams_idx$OPS)
m_R_OPS = lm(R ~ OPS,
             data = AL50_Teams_idx)
summary(m_R_OPS)
m_OPS_R = lm(OPS ~ R,
             data = AL50_Teams_idx)
summary(m_OPS_R)

#회귀계수
coef(m_R_OPS)   #R = 1973.43 * OPS - 715.80 + e
coef(m_OPS_R)   #OPS = 0.000454903 * R + 0.400997068 + e

#예측값
#OAK
predict(m_OPS_R,
        data.frame(R = 834),
        level = 0.95,
        interval = 'predict')
#MIN
predict(m_OPS_R,
        data.frame(R = 959),
        level = 0.95,
        interval = 'predict')
#NYY
predict(m_OPS_R,
        data.frame(R = 827),
        level = 0.95,
        interval = 'predict')


#회귀계수의 신뢰구간
confint(m_R_OPS)
confint(m_OPS_R)

#시각화
ggplot(AL50_Teams_idx,
       aes(x = OPS, y = R)) +
    geom_point() +
    geom_smooth(method = 'lm') +
    theme_minimal()

ggplot(AL50_Teams_idx,
       aes(x = R, y = OPS)) +
    geom_point() +
    geom_smooth(method = 'lm') +
    theme_minimal()
