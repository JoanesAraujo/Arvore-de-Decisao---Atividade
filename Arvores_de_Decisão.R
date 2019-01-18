# Usa a base Car Evaluation # 

# carregar pacotes de Árvore de Decisão
require(rpart)
require(rpart.plot)
require(party)
require(partykit)
require(tree)
library(caret)

### Modelagem ###
# Árvores Estatísticas
Banktree <- ctree(y ~., treinoBank) # criar árvore 
plot(Banktree, type="simple", gp = gpar(fontsize = 6)) # plotar árvore

previsaoCtreeBank = predict(Banktree, testeBank) # realizar predições
previsaoCtreeBank = as.data.frame(previsaoCtreeBank) # transformar predições em data frame
confusionMatrix(previsaoCtreeBank$previsaoCtreeBank, testeBank$y) # matriz de confusão

# Árvores de Entropia
BankRpart <- rpart(y ~., treinoBank) # criar árvore
rpart.plot(BankRpart) # plotar árvore

plotcp(BankRpart) # plotar entropia da árvore

BankRpart <- prune(BankRpart, cp=0.059) # podar árvore
rpart.plot(BankRpart, extra = 104, branch.lty = 2,
           nn= T, tweak = 1.2) # plotar árvore podada

previsaoPartBank = predict(BankRpart, testeBank, type = "class") # realizar predição # parâmetro type = "class" é para retornar o resultado com mairo probabilidade de ocorrer
previsaoPartBank = as.data.frame(previsaoPartBank) # transformar predições em data frame
confusionMatrix(previsaoPartBank$previsaoPartBank, testeBank$y) # matriz de confusão
