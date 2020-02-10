library(dplyr)
library(ggplot2)

#최근 50년 1위의 평균 OPS
AL50_Teams_idx %>% 
    filter(Rank == 1) %>% 
    summarise(mean_OPS = mean(OPS))
#최근 50년 2위의 평균 OPS
AL50_Teams_idx %>% 
    filter(Rank == 2) %>% 
    summarise(mean_OPS = mean(OPS))

#지구 1위와 OPS
AL50_Teams$D_win = ifelse(AL50_Teams$DivWin == 'Y',
                          1, 0)
glm_AL50_Teams = glm(D_win ~ OPS,
                      data = AL50_Teams,
                      family = binomial(link = 'logit'))

summary(glm_AL50_Teams)

#로그가 취해진 오즈비
log_D_Win = function(OPS){
    D_Win = -17.8 + 21.8 * OPS
    return(D_Win)
}
log_D_Win(0.723)
log_D_Win(0.842)
log_D_Win(0.780)
log_D_Win(0.829)

exp(log_D_Win(0.723))
exp(log_D_Win(0.842))
exp(log_D_Win(0.780))
exp(log_D_Win(0.829))

exp(log_D_Win(0.842)) / exp(log_D_Win(0.723))
exp(log_D_Win(0.829)) / exp(log_D_Win(0.780))

#OPS에 따른 실제 우승확률
prob_of_Win = function(OPS){
    p = 1 / (1 + exp(-log_D_Win(OPS)))
    return(p)
}
prob_of_Win(0.767)
prob_of_Win(0.768)

prob_of_Win(0.723)
prob_of_Win(0.842)
prob_of_Win(0.780)
prob_of_Win(0.829)
#데이터 시각화
glm_df = data.frame(success = AL50_Teams$D_win, OPS = AL50_Teams$OPS,
                    fit = predict(glm_AL50_Teams, AL50_Teams))
View(glm_df)
glm_df$prob = 1 / (1 + exp(-glm_df$fit))

ggplot(glm_df, aes(x = glm_df$OPS, y = glm_df$success)) +
    geom_point() + geom_line(aes(x = glm_df$OPS, y = glm_df$prob)) +
    scale_x_continuous(breaks = seq(0, 1, 0.01)) +
    scale_y_continuous(breaks = seq(0, 1, 0.1))
