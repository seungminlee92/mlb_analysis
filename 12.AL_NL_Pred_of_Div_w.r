library(nnet)
library(ROCR)
#Training : AL, Test : NL
## df 생성
NL_df = subset(NL_Teams,
               yearID >= 1969 &
                   yearID <= 2018 &
                   yearID != 1981 &
                   yearID != 1994)
NL_df = data.frame(NL_df$yearID, NL_df$DivWin,
                   NL_df$OPS)
colnames(NL_df) = c('yearID', 'DivWin', 'OPS')
NL_df = na.omit(NL_df)
NL_df$Div_Win = ifelse(NL_df$DivWin == 'Y', 1, 0)

##샘플링
AL_train = AL_df
NL_test = AL_df

dim(AL_train)
dim(NL_test)

## 학습데이터
ALNL_model = glm(Div_Win ~ OPS,
                 data = AL_train,
                 family = 'binomial')

summary(ALNL_model)

## 로지스틱 회귀모델 예측치 생성
ALNL_pred = predict(ALNL_model,
                    newdata = NL_test, type = 'response')

ALNL_result = ifelse(ALNL_pred >= 0.5, 1, 0)

ALNL_result
table(ALNL_result)

##분류 정확도
ALNL_result_tb = table(ALNL_result, NL_test$Div_Win)
(ALNL_result_tb[1, 1] + ALNL_result_tb[2, 2]) / 
    sum(ALNL_result_tb)

##ROC Curve를 이용한 모델 평가
ALNL_pr = prediction(ALNL_pred, NL_test$Div_Win)
ALNL_prf = performance(ALNL_pr, measure = 'tpr',
                         x.measure = 'fpr')
plot(AL7030_prf)
