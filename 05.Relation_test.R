#승리와 득점, OPS, OBP, SLG, avg의 상관분석
cor.test(AL50_Teams_idx$W, AL50_Teams_idx$R)
cor.test(AL50_Teams_idx$W, AL50_Teams_idx$OPS)
#cor.test(AL50_Teams_idx$W, AL50_Teams_idx$OBP)
#cor.test(AL50_Teams_idx$W, AL50_Teams_idx$SLG)
cor.test(AL50_Teams_idx$W, AL50_Teams_idx$AVG)

#득점과 OPS, avg, HR, BB의 상관분석
#cor.test(AL50_Teams_idx$R, AL50_Teams_idx$OPS)
#cor.test(AL50_Teams_idx$R, AL50_Teams_idx$SLG)
cor.test(AL50_Teams_idx$R, AL50_Teams_idx$OBP)
cor.test(AL50_Teams_idx$R, AL50_Teams_idx$AVG)
cor.test(AL50_Teams_idx$R, AL50_Teams_idx$ISO)
#cor.test(AL50_Teams_idx$R, AL50_Teams_idx$H)
cor.test(AL50_Teams_idx$R, AL50_Teams_idx$HR)
cor.test(AL50_Teams_idx$R, AL50_Teams_idx$BB)
cor.test(AL50_Teams_idx$R, AL50_Teams_idx$ISO)

cor.test(AL50_Teams_idx$R, AL50_Teams_idx$OPS)
