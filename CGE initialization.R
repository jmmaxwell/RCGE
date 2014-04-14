## size of CGE
HH=4 # households
GG=2 # goods
FF=2 # factors

## Production Parameters
Phi = c(1.5, 2)
Del = c(0.6, 0.7)
SigP = c(2, 0.5)

## Demand Parameters
A = matrix(c(.5,.5,.3,.7,.6,.4,.2,.8),2,4)
SigC = c(1.5, 0.75, 0.9, 1.2)

## Endowments
WK = c(25, 0, 10, 15)
WL = c(0, 60, 30, 40)

## Definition of base price
PL = 1

## Variable initialization
PG = c()
QH = matrix(NA,2,2)
YH = c()
V = c()
PK = c()
QQ = c()
LD = c()
KD = c()
X = matrix(0,2,4)
LogSSE=c()
profit1=c()

source("CGE function.R")


## Solution
#Benchmark
Minimization = optim(c(.0001,66,1), CGE)
R = Minimization$par

source("CGE results.R")
#obtain post calculations for benchmark
B = results(R)

#increase scale parameter on production function 1
Phi = c(1.9, 2)

Minimization = optim(c(.0001,66,1), CGE)
Rp = Minimization$par

#obtain post calculations for new scenario
C = results(Rp)

#print useful metrics
source("CGE output.R")

print(paste("% change in Gini index:", change.GINI))
print(paste("Impact in market 1:", impact[1]))
print(paste("Impact in market 2:", impact[2]))
print(mytab)
