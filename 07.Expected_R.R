#기대 승률 60%이상을 가져 오기 위한 득점 수
162 * 0.60 # 기대 승수 98이상
##기대 승률과 실점을 이용한 필요 득점 도출 함수
ER_EWA = function(EWA, RA){
    ER = RA * sqrt(EWA / (1 - EWA))
    return(ER)
}

##기대 승수와 실점을 이용한 필요 득점 도출 함수
ER_EW = function(EW, RA){
    ER = RA * sqrt(EW / (162 - EW))
    return(ER)
}
ER_EW(98, Oak2018_idx$RA)               #834.0324

##필요득점을 이용하여 필요 OPS 도출 함수
Need_OPS = function(R){
    Need_OPS = 0.400997068 + 0.000454903 * R
    return(Need_OPS)
}

# W, OAK 2018
ER_EW(98, 674)
Need_OPS(ER_EW(98, Oak2018_idx$RA))     #0.7804009
Oak2018_idx$OPS                         #0.7644789
Oak2018_idx$OPS - Need_OPS(ER_EW(98, Oak2018_idx$RA))
# C, MIN 2018
ER_EW(98, 775)
Need_OPS(ER_EW(98, Min2018_idx$RA))     #0.8372552
Min2018_idx$OPS                         #0.7233679
Min2018_idx$OPS - Need_OPS(ER_EW(98, Min2018_idx$RA))
# E, NYY 2018
ER_EW(98, 669)
Need_OPS(ER_EW(98, Nyy2018_idx$RA))     #0.7775864
Nyy2018_idx$OPS                         #0.7806766
Nyy2018_idx$OPS - Need_OPS(ER_EW(98, Nyy2018_idx$RA))
