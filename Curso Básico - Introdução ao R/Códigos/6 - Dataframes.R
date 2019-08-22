
############################ Introdução ao R ##################################

# Autora: Ana Carolina Fernandes Dias
# Linkedin: https://www.linkedin.com/in/ana-carolinadias/

##########################################################################################

##########################################################################################
#Trabalhando com dataframes 
##########################################################################################

#Os data frames são os objetos do tipo banco de dados do R. 
#Eles também são organizados em linhas e colunas mas, diferente das matrizes,
#os data frames podem conter colunas de diferentes classes. Uma coluna pode ser numeric, 
#outra character e outra integer, por exemplo. 
#Os data frames são, portanto, estruturas semelhantes aos bancos de dados convencionais 
#usados em outros softwares onde as colunas são as variáveis e as linhas, os casos.

#Usualmente, seus dados serão importados para um objeto data.frame. 

# ?data.frame  #veja o help das funções acima

# Para criar um dataframe, usamos a funcao **data.frame()**. Devemos tambem especificar
# o nome das colunas/variaveis:


# Criando um data frame a partir de uma matriz 
nome = c("João", "Pedro", "Amanda", "Fábio", "Fernanda", "Gustavo")
altura = c(1.80, 1.77, 1.71, 1.65, 1.66, 1.63)
idade = c(22, 21, 18, 20, 23, 19)
sexo = c("masculino", "masculino", "feminino", "masculino", "feminino", "masculino")
peso = c(78.3, 82.1, 66.5, 88.1, 58, 75.4)
fumante = c(TRUE, FALSE, FALSE, FALSE, TRUE, FALSE)
uf = c("PB", "AL", "PE", "PE", "SP", "CE")
renda = c(2, 5, 10, 20, 10, NA)

dados =  (cbind(nome,altura,idade,sexo,peso,fumante,uf,renda))  #Matriz 
class(dados)

dados = as.data.frame(dados)  #Dataframe
class(dados)

#---------------------------------------------------------------------------------------------

#Criando um data frame direto 

dados <- data.frame(
  nome = c("João", "Pedro", "Amanda", "Fábio", "Fernanda", "Gustavo"),
  altura = c(1.80, 1.77, 1.71, 1.65, 1.66, 1.63),
  idade = c(22, 21, 18, 20, 23, 19),
  sexo = c("masculino", "masculino", "feminino", "masculino", "feminino", "masculino"),
  peso = c(78.3, 82.1, 66.5, 88.1, 58, 75.4),
  fumante = c(TRUE, FALSE, FALSE, FALSE, TRUE, FALSE),
  uf = c("PB", "AL", "PE", "PE", "SP", "CE"),
  renda = c(2, 5, 10, 20, 10, NA)
)

# O primeiro ponto a ser observado é que nosso data frame foi criado através de vários vetores. 
# Cada um dos vetores possui um determinado tipo de dado. Vamos exibir o nosso data frame.

dados


# Algumas funções úteis:
  
  #head() - Mostra as primeiras 6 linhas.
  #tail() - Mostra as últimas 6 linhas.
  #dim() - Número de linhas e de colunas.
  #names() - Os nomes das colunas (variáveis).
  #str() - Estrutura do data.frame. Mostra, entre outras coisas, as classes de cada coluna.
  #cbind() - Acopla duas tabelas lado a lado.
  #rbind() - Empilha duas tabelas.
  
  
class(dados)
head(dados)
head(dados,2)

# Uma das funções básicas mais importantes para começarmos a trabalhar com data frames é a str(). 
# Essa função dá uma visão clara da estrutura do nosso objeto, bem como informa os tipos de dados existentes.

str(dados)


# Analisando o resultado da função, podemos verificar que nosso data frame possui 
# 6 observações e 8 variáveis. As observações e variáveis nada mais são do que nossas linhas e colunas, 
# respectivamente. Uma outra informação importante é saber o tipo de dado que cada variável (coluna) apresenta. 
# Podemos facilmente constatar que quatro das nossas variáveis são numéricas, três são fatores e uma lógica.


# Frequentemente determinada variável não está com o tipo de dado que desejamos. 
# Às vezes é necessário converter uma variável do tipo texto em fator, ou uma variável numérica em texto, por exemplo. 
#Isso faz todo sentido quando queremos manter um padrão em diferentes data frames. 

dados$nome #variavel deveria ser texto ao inves de fator 
str(dados$nome)
dados$nome = as.character(dados$nome)

str(dados)

#Vimos que em nosso data frame dados todas as variáveis, que não são numéricas ou lógicas, 
#estão como fator. Isso se deve especificamente ao fato do argumento stringsAsFactors estar, 
# por padrão, com o valor TRUE. Logo, todo dado tipo texto será convertido 
#para fator já na criação do nosso objeto.

dados =  data.frame(
  nome = c("João", "Pedro", "Amanda", "Fábio", "Fernanda", "Gustavo"),
  altura = c(1.80, 1.77, 1.71, 1.65, 1.66, 1.63),
  idade = c(22, 21, 18, 20, 23, 19),
  sexo = c("masculino", "masculino", "feminino", "masculino", "feminino", "masculino"),
  peso = c(78.3, 82.1, 66.5, 88.1, 58, 75.4),
  fumante = c(TRUE, FALSE, FALSE, FALSE, TRUE, FALSE),
  uf = c("PB", "AL", "PE", "PE", "SP", "CE"),
  renda = c(2, 5, 10, 20, 10, NA),
  stringsAsFactors = FALSE
)

dados
str(dados)


# Assim como nas matrizes, verificar o tamanho dos dataframes de diversas maneiras
# (mas o comando "length" nao funciona):

nrow(dados)  #numero de linhas/observcoes/casos
ncol(dados)  #numero de colunas/variaveis
dim(dados)   #dimensao do dataframe (linhas por colunas)

summary(dados) 


##########################################################################################
# Manipulando data frames
##########################################################################################

#A manipulação de data frames é similar à manipulação de matrizes em muitos pontos.
# A seleção de elementos segue a mesma lógica. 

dados
dados[3, 2]     #seleciona a terceira linha da segunda coluna
dados[3:5, 2]   #seleciona da terceira a quinta linha da segunda coluna
dados[6, 2:4]   #Seleciona a sexta linha e as colunas de 2 a 4 

dados[1,]      #Seleciona a primeira linha 
dados[,1]     #seleciona a primeira coluna 


#Podemos fazer, similar à operação com matrizes, a seleção de algumas colunas  e linhas utilizando os nomes. 

dados[ ,c("nome", "sexo", "uf")]
dados[ ,c("peso")]

rownames(dados)

dados[c("1"),] 

# As funções colnames e rownames funcionam assim como nas matrizes 
rownames(dados) = c("Aluno1","Aluno2","Aluno3","Aluno4","Aluno5","Aluno6" )
dados

dados["Aluno1",]
dados["Aluno5",]

dados[c('Aluno1',"Aluno5"),]


# Por fim, podemos selecionar as variaveis/colunas de um data.frame usando seus 
# nomes. A funcao **names** exibe o nome das colunas do dataframe:

names(dados)

#Selecionar variáveis em um data frame é bastante simples usando a sintaxe: df$x. 
#Onde df é o data frame e x a variável que desejamos selecionar. 
#Para selecionar todos os dados contidos na variável altura, podemos fazer:
  
dados$altura

dados$nome 
dados$renda

# Já para selecionar um elemento dentro da seleção:

dados$altura
dados$altura[4] #Seleciona o quarto elemento da variável altura

dados$nome
dados$nome[1] #Selecionao priemiro elemento da variável nome

#-------------------------------------------------------------------------------------------------------------------------

# Uma função bastante importante para selecionarmos dados conforme vários critérios 
#e de forma mais intuitiva é a subset(). Ao trabalharmos com grandes data frames 
# uma seleção mais intuitiva facilita a vida não só de quem está escrevendo 
# o código como também a de quem irá ler o mesmo.

#Suponha que desejamos dados apenas dos alunos com mais de 1.65 metros de altura 
#e com mais de 20 anos de idade. A seleção pode ser feita facilmente da seguinte forma:

subset(dados, altura > 1.65 & idade > 20)

#selecionado alunos com renda > 2 
subset(dados, renda > 2) 

?subset

# Estudantes do sexo masculino e que sejam fumantes;
subset(dados, subset = sexo == 'masculino' & fumante  == TRUE) 

# Estudantes que possuam peso acima de 60Kg;
subset(dados, subset = peso > 60) 

# Estudantes com peso abaixo de 80Kg OU com altura acima de 1.70m;
subset(dados, subset= peso < 80 | altura > 1.7) 

# Selecione todas as observações das variáveis nome, altura, idade e peso (as demais colunas devem ser excluídas).

subset(dados,subset = , select = c(nome, altura, idade, peso))

# Estudantes que possuam altura acima 1.70m e abaixo de 1.80m.
subset(dados,  altura > 1.7  & altura < 1.8) 


#Outra função bastante útil para uma primeira análise dos dados é a função summary().
summary(subset(dados, select = c(peso, idade, sexo, renda)))

var_numericas = subset(dados, select = c(peso, idade, renda))
summary(var_numericas)
str(var_numericas)

# Funções do tipo rowSums, colSums, rowMeans e colMeans também funcionam. 
rowSums(var_numericas)
colSums(var_numericas)
rowMeans(var_numericas)


##########################################################################################
# Criando e modificando variáveis
##########################################################################################

# O processo para criar novas variáveis (colunas) em data frames é igualmente simples a outras operações. 

dados$serie <- '2º Ano do Ensino Médio' # Criando uma variavel 
dados

dados$altura = dados$altura^2           # Substituindo uma variavel
dados

#Para acrescentar novas informações aos bancos de dados, podemos usar  os comandos rbind()
#para acrescentar linhas e cbind() para acrescentar colunas

ativ_fisica = c("Sim","Sim",'Não', 'Sim', 'Não','Não')

dados = cbind(dados,ativ_fisica)
dados

Fabiana = c('Fabiana', 1.72, 25, 'feminino', 69, TRUE, 'MG', 5, 'Sim')

dados = rbind(dados,Fabiana)
dados

# Removendo variaveis 

# Também é possível remover colunas do nosso dataframe
# A forma mais segura e universal de remover qualquer elemento de um objeto do R 
# é selecionar tudo exceto aquilo que você não deseja. 
# Isto é, selecione todas colunas menos as que
# você não quer e atribua o resultado de volta ao seu data.frame

dados[,-1] #Removendo a primeira coluna nomes 
dados[-1,] # Removendo a primeira linha 
dados[, c(-4, -6)]  #Removendo as colunas 4 e 6 


########################################################################################################################
# Obs: Material produzido para o curso do R-Ladies Belo Horizonte por Ana Carolina Dias, 
# com o auxílio da Layla Comparin. 

# O material é fornecido gratuitamente e portanto não pode ser copiado para venda. 

# Confira nossa redes sociais:

# Site = http://rladiesbh.com.br/
# Meetup = https://www.meetup.com/pt-BR/rladiesbh/
# Github = https://github.com/rladies/meetup-presentations_belohorizonte
# Instagram = https://www.instagram.com/rladiesbh/
# Linkedin = https://www.linkedin.com/company/rladies-belo-horizonte/

#Acompanhe e fique por dentro dos nosso cursos e eventos: 
# https://www.sympla.com.br/rladiesbh

# Confira outros materiais e aulas sobre R, analise e ciencia de Dados em: 
# https://medium.com/rladiesbh

########################################################################################################################
