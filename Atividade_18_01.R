require(rpart)
require(rpart.plot)
require(party)
require(partykit)
require(tree)
library(caret)


#### Bank Marketing Data Set  ####
# Entrada Student Performance
marketingBank=read.table("bank-additional-full.csv",sep=";",header=TRUE)

colnames(marketingBank) <- c('age','job','marital','education','default','housing','loan','contact','month','day_of_week','duration','campaign','pdays','previous','poutcome','emp.var.rate','cons.price.idx','cons.conf.idx','euribor3m','nr.employed','y'
)

# Partição marketingBank
particaoBank = createDataPartition(1:nrow(marketingBank),p=.7)
treinoBank = marketingBank[particaoBank$Resample1,]
testeBank = marketingBank[- particaoBank$Resample1,]