## calculating changes

Un = B[1:4]
YHn = B[7:10]
revn = B[5:6]

Up = C[1:4]
YHp = C[7:10]
revp = C[5:6]

EV=c()
for (h in 1:HH){
  EV[h] = ((Up[h]-Un[h])/Un[h])*YHn[h]
}
CV=c()
for (h in 1:HH){
  CV[h] = ((Up[h]-Un[h])/Up[h])*YHp[h]
}

GINIn = ((2 * sum(c(1:HH)*YHn)) / (HH*sum(YHn))) -((HH+1)/HH)

GINIp = ((2 * sum(c(1:HH)*YHp)) / (HH*sum(YHp))) -((HH+1)/HH)

change.GINI = ((GINIp-GINIn)/GINIn)*100

impact = c()
impact = c(revp-revn)

## setting up plots

library(vcd)

HouseholdEV = c("Household 1", "Household 2", "Household 3", "Household 4")

mytab = xtabs(EV~HouseholdEV)
