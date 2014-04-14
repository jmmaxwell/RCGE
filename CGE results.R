
results = function(R){

QQ[1] = R[1]
QQ[2] = R[2]
# PG[1] = V[1]
# PG[2] = V[2]
PK = R[3]
PL = 1

#### Production block

for (g in 1:GG){
  LD[g] = (1/Phi[g])*QQ[g] * (Del[g] + (1-Del[g]) * ( ( (Del[g]*PK) / 
                    (( 1-Del[g] )*PL) ) ^ (1-SigP[g]))) ^ (SigP[g]/(1-SigP[g]))
}

for (g in 1:GG){
  KD[g] = (1/Phi[g])*QQ[g] * ((1-Del[g]) + Del[g] * ( ( ((1-Del[g])*PL) / 
                    (Del[g]*PK) ) ^ (1-SigP[g]))) ^ (SigP[g]/(1-SigP[g]))
}


### MCC to define prices

for (g in 1:GG){
  PG[g] = (PK*KD[g] + PL*LD[g])/QQ[g]
}


## Income

for (h in 1:HH){
  YH[h] = PL*WL[h]+PK*WK[h]
}

## Goods demand

for (g in 1:GG){
  for (h in 1:HH){
    X[g,h] = (A[g,h] * YH[h]) /
      ( (PG[g]^SigC[h]) * (A[1,h] * (PG[1] ^ (1 - SigC[h])) 
                           + A[2,h] * (PG[2] ^ (1-SigC[h]))) )
  }}

## Utility
U = c()
for (h in 1:HH){
  U[h] = ( (A[1,h]^(1/SigC[h]))*(X[1,h]^((SigC[h]-1)/SigC[h])) + 
             (A[2,h]^(1/SigC[h]))*(X[2,h]^((SigC[h]-1)/SigC[h])))^(SigC[h]/(SigC[h]-1))
}

## Revenue
rev=c()
  for (g in 1:GG){
    rev[g] = QQ[g]*PG[g]
  }

## Labor
labor = c(WL[h])


##########
return(c(U, rev, YH, labor))
}


