library(dplyr)

#기대 승률 도출 함수
EWA = function(R, RA){
    EWA = R^2/(R^2 + RA^2)
    return(EWA)
}
