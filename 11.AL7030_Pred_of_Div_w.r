library(nnet)
library(ROCR)
#Training : AL 70, Test : AL 30 / DivWin ~ OPS
## df 생성
AL_df = subset(AL_Teams,
               yearID >= 1969 &
                     yearID <= 2018 &
                     yearID != 1981 &
                     yearID != 1994)
AL_df = data.frame(AL_df$yearID, AL_df$DivWin,
                     AL_df$OPS)
colnames(AL_df) = c('yearID', 'DivWin', 'OPS')
AL_df = na.omit(AL_df)
AL_df$Div_Win = ifelse(AL_df$DivWin == 'Y', 1, 0)

dim(AL_df)

##샘플링
AL70_idx = sample(1:nrow(AL_df), nrow(AL_df) * 0.7)

AL70_train = AL_df[AL70_idx, ]
AL30_test = AL_df[-AL70_idx, ]

dim(AL70_train)
dim(AL30_test)
str(AL30_test)
## 학습데이터
AL7030_model = glm(Div_Win ~ OPS,
                   data = AL70_train,
                   family = 'binomial')

summary(AL7030_model)

## 로지스틱 회귀모델 예측치 생성
AL7030_pred = predict(AL7030_model,
                      newdata = AL30_test, type = 'response')

AL7030_result = ifelse(AL7030_pred >= 0.5, 1, 0)

AL7030_result
table(AL7030_result)

##분류 정확도
AL7030_result_tb = table(AL7030_result, AL30_test$Div_Win)
(AL7030_result_tb[1, 1] + AL7030_result_tb[2, 2]) / 
    sum(AL7030_result_tb)

##ROC Curve를 이용한 모델 평가
AL7030_pr = prediction(AL7030_result, AL30_test$Div_Win)
AL7030_prf = performance(AL7030_pr, measure = 'tpr',
                         x.measure = 'fpr')
plot(AL7030_prf)
