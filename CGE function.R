CGE = function(V){
  
  QQ[1] = V[1]
  QQ[2] = V[2]
 # PG[1] = V[1]
 # PG[2] = V[2]
  PK = V[3]
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
  
  ## Utility and EV/CV
  U = c()
  for (h in 1:HH){
    U[h] = ( (A[1,h]^(1/SigC[h]))*(X[1,h]^((SigC[h]-1)/SigC[h])) + 
          (A[2,h]^(1/SigC[h]))*(X[2,h]^((SigC[h]-1)/SigC[h])))^(SigC[h]/(SigC[h]-1))
      }
      

  
  #### Market Closure Conditions
  
    # Demands equals supply for factors
    
    XfacK = sum(WK[]) - sum(KD[])
    
    XfacL = sum(WL[]) - sum(LD[])
    
    # Demands equal supply for goods
    
    Xgood1 = QQ[1] - sum(X[1,])
    
    Xgood2 = QQ[2] - sum(X[2,])
    
    # Zero profit conditions
    
    profit1 = PG[1]*QQ[1] - (PK*KD[1] + PL*LD[1])
    
    LogSSE = log((sum(c(XfacK,XfacL,Xgood1,Xgood2,profit1)^2)), base = 10)

#  print(paste("KD", KD))
#  print(paste("LD", LD))
#  print(paste("YH", YH))
#  print(paste("QQ", QQ))
#  print(paste("X", X))
#  print(paste("Xgood1", Xgood1))
#  print(paste("Xgood2", Xgood2))
#  print(paste("profit1", profit1))
#  print(paste("Utility", U))

  return(LogSSE)
}