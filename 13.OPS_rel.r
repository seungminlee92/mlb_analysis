library(neuralnet)

# df 생성
OPS_rel = subset(AL_Teams,
                 yearID >= 1969 &
                     yearID <= 2018 &
                     yearID != 1981 &
                     yearID != 1994)
OPS_rel = data.frame(OPS_rel$yearID, OPS_rel$OPS,
                     OPS_rel$H, OPS_rel$BB,
                     OPS_rel$HBP, OPS_rel$SF,
                     OPS_rel$X2B, OPS_rel$X3B,
                     OPS_rel$HR, OPS_rel$AB)
colnames(OPS_rel) = c('yearID', 'OPS', 'H', 'BB',
                      'HBP', 'SF', 'X2B', 'X3B', 'HR', 
                      'AB')
OPS_rel = na.omit(OPS_rel)

View(OPS_rel)

#인공 신경망 생성
OPS_neuralnet = neuralnet(OPS ~ 
                              H + BB + HBP + SF +
                              X2B + X3B + HR + AB,
                          OPS_rel,
                          hidden = 3)
OPS_neuralnet$result.matrix

#시각화
plot(OPS_neuralnet)
