
############################ Introdução ao R ##################################

# Autora: Ana Carolina Fernandes Dias
# Linkedin: https://www.linkedin.com/in/ana-carolinadias/

##########################################################################################


##########################################################################################
#Trabalhando com matrizes
##########################################################################################


# Matrizes sao outra classe de objetos do R.
#Matrizes são vetores com duas dimensões (e por isso só possuem elementos de uma mesma classe).

#sao vetores cujos valores foram ordenados em linhas e colunas. 

#Devemos especificar, como argumentos, os dados que farao 
# parte da matriz, o numero de linhas e o numero de colunas:


#Para criar matrizes usamos a função matrix():
m <- matrix(1:100, nrow = 10, ncol = 5)
m

m1 <- matrix(1:100, ncol = 5)
m1

m2 <- matrix(1:100, nrow = 10)
m2

#Para investigar as dimensões de uma matriz, usamos o comando 
#dim(). nrow() e ncol() retornam o número de linhas e o número de colunas.

class(m)

length(m) # numero de elementos
dim(m) # dimensoes da matriz, isto e, o numero de linhas e colunas

dim(m)[1] # linhas
dim(m)[2] # colunas

nrow(m) # numero de linhas
ncol(m) # numero de colunas

# No R e sempre importante saber com que tipo de objeto estamos trabalhando. 
# Cada tipo de objeto (ou classe) tem propriedades especificas e sao acessadas 
# e analisadas com o uso de fucoes e metodos especificos. Os comandos **nrow** 
# e **ncol** nao funcionam, por exemplo com os vetores comuns. Para descobrir o 
# tipo de objeto com o qual estamos lidando, sempre devemos usar a funcao **class**. 

#---------------------------------------------------------------------------------

A = matrix(c(1,2,3,4,5,6,7,8),nrow=2,ncol=4 , byrow = F) #default
A

# Percebemos que o R, por default, preenche a matriz por colunas e não por linhas. 
# No entanto, podemos criar uma matriz preenchendo primeiro as linhas e depois as colunas. 
# Para isso, basta definirmos o argumento byrow = TRUE. 
# Vejamos o resultado do exemplo anterior com o preenchimento por linhas e depois por colunas.

A = matrix(c(1,2,3,4,5,6,7,8),nrow=2,ncol=4 , byrow = T)
A


B = matrix(1:200,nrow=20,ncol=10)
B

C <- matrix(NA , nrow=2, ncol=3)
C

D <- matrix(nrow=2, ncol=3)
D

#---------------------------------------------------------------------------------

##########################################################################################
#Reciclagem de Dados
##########################################################################################

# Outro ponto que merece atenção é a regra de reciclagem dos dados utilizados para a criação da matriz.
# Execute o código abaixo e observe o que ocorre.


m4 <- matrix(seq(1, 9), ncol = 3, nrow = 5, byrow = F)
m4  

#Vemos novamente que o R reciclou os numeros que faltavam para completar a matriz 


m4 <- matrix( seq(1, 9), ncol = 3, nrow = 5, byrow =  T)
m4  

#---------------------------------------------------------------------------------

# As matrizes no R também podem guardar dados em texto (character). 
# O exemplo a seguir mostra o armazenamento desse tipo de dado.

m5 <- matrix(sample(c("A", "B","C"), 10, replace = T), ncol = 10, nrow = 5) 
m5

m6 = matrix(c('matemática','quimica','redação', 'arte' ,'história','física', 'educação_física', 'geografia'), 
            nrow = 2, ncol = 4)
m6

m7 = matrix(data=0,nrow=3,ncol=3)
m7

#---------------------------------------------------------------------------------

##########################################################################################
#Atribuindo nomes as linhas e colunas de uma matriz 
##########################################################################################


matriz = matrix(data = 1:9 ,nrow= 3 ,ncol= 3)
matriz

colnames(matriz) = c("Coluna1", "Coluna2", "Coluna3")
matriz

rownames(matriz) = c("Linha1","Linha2", "Linha3")
matriz

#---------------------------------------------------------------------------------
#Utilizando a função paste para criar nomes 

col_names = paste("coluna",1:3,sep="")
col_names

row_names = paste("linha",1:3,sep="")
row_names

matriz = matrix(data = 1:9 ,nrow= 3 ,ncol= 3)
colnames(matriz) = col_names
rownames(matriz) = row_names
matriz

#---------------------------------------------------------------------------------
 
##########################################################################################
#Operações com matrizes 
##########################################################################################

matriz ^ 2 
matriz - 2 
matriz / 5
matriz * 3 


# Já funções como mean(), min(), max() funcionam também como ocorre com os vetores, 
# ou seja, levam em consideração todos os elementos da matriz.

min(matriz)
max(matriz)
mean(matriz)
sum(matriz)

rowSums(matriz)  #Soma as linhas da Matriz
colSums(matriz)  #Soma as colunas da Matriz 
rowMeans(matriz) # Calcula a media das linhas
colMeans(matriz) # Calcula a media das coluunas

matriz
t(matriz) #Transpoe a matriz

#---------------------------------------------------------------------------------

# As operações matemáticas entre matrizes também são possíveis no R. 
# No entanto, temos que observar a dimensão das matrizes envolvidas na operação. 
# Considere as matrizes  abaixo.

A = matrix(c(1, 2, 3, 4), nrow = 2)
A

B = matrix(c(5, 6, 7, 8), nrow = 2)
B

#Soma
A + B

#Subtração
A - B

#Multiplicação por numero (Escalar)
5 * B

#Multiplicação elemento a elemento
A * B

# Se quisermos realizar a multiplicação matricial (linhas por colunas), devemos utilizar o operador %*%.
# Matematicamente o resultado será o seguinte:
A %*% B  
  
#As operações entre matrizes só funcionam com matrizes de mesma dimensão.
A = matrix(c(1, 2, 3, 4), nrow = 2)
A

B = matrix(c(5, 6, 7, 8), nrow = 3)
B

#Soma
A + B

##########################################################################################
# Manipulando matrizes
##########################################################################################

# Para selecionar um elemento especifico de uma matriz, tambem utilizamos 
# os colchetes [], assim podemos selecionar esse elemento utilizando o seguinte comando: 
# NomeMatriz[Linha, Coluna]

A = matrix(c(1,2,3,4,5,6,7,8),nrow=2,ncol=4 , byrow = F) #default
A

A[1,4] # elemento localizado na primeira linha, quarta coluna
A[2,2]

class(A)
class(A[1,4])

A[1,] # selecionando a primeira linha inteira
A[,1] # selecionando a primeira coluna inteira


#Para selecionar um intervalo de linhas, 
#lógica é semelhante a que utilizamos para intervalos de elementos em vetores. Segue exemplo:
  
B <- matrix(seq(1, 100),  ncol = 10,  nrow = 10,  byrow = TRUE)
B

B[1:3,] #Selecionando as linhas de 1 a 3 
B[,1:3] #Selecionando as colunas de 1 a 3 

B[c(1,5,8),] #Selecionando as linhas de 1,5 e 8 
B[,c(2,4,6)] #Selecionando as colunas de 2,4,6 

B[-3, ]

B[-3, -c(3:6)]

B[c(1,2),c(1,3)]

mean(B[8:10, 8])


notas = matrix(sample(50:100, 40, replace = T), ncol = 4, nrow = 10) 
notas

colnames(notas) <- c("bim-1", "bim-2", "bim-3", "bim-4")
rownames(notas) <- c("João", "Pedro", "Amanda", "Fábio", "Fernanda", "Gustavo",
                     "Severino", "Paulo", "Laura", "Túlio")

#Uma vez com nomes das linhas e colunas, podemos utilizar os mesmos para realizar filtros em nossa matriz. 
#Para exibir apenas as notas da aluna Fernanda, fazemos:

notas["Fernanda", ]
notas[, "bim-1"]

mean(notas[, "bim-1"])
mean(notas[, "bim-2"])

mean(notas[, "bim-1"]) > mean(notas[, "bim-2"]) 

##########################################################################################

#NOTA: Podemos observar que a lógica do R para matrizes é bem similar a de vetores.

##########################################################################################
# Unindo matrizes
##########################################################################################

# união de matrizes é bastante importante para formarmos um conjunto de dados maior a partir de dados menores. 
# Essa união pode ocorrer de duas formas: por linhas e por colunas. 

# Para unirmos duas matrizes através das colunas, utilizamos a função cbind(). 
# Já para fazer a união através das linhas, usamos a função rbind().


#Alunos transferidos 

notas_transf = matrix(c(6,8,8,9,NA,NA,NA,NA), nrow= 2, ncol = 4, byrow= F)

colnames(notas_transf) = c("bim-1", "bim-2", "bim-3", "bim-4")
rownames(notas_transf) = c("Alessandra", "Camila")

notas_transf

# Para consolidar os dados, precisamos unir as matrizes notas e notas_transf por linhas. 
# Para executar tal tarefa, vamos usar a função  rbind().

notas
notas_transf

rbind(notas, notas_transf)

# Para unirmos duas matrizes por colunas, o procedimento é similar. 
#Porém, temos que observar que para unir matrizes através das colunas, 
#devemos ter o mesmo número de linhas em todas as matrizes que desejamos unir. 
#A lógica se aplica também à união por linhas, ou seja, 
#as matrizes envolvidas devem ter o mesmo número de colunas.

notas_bim5 = matrix(c(36,72,67,55,38,60,66,48,59,56), nrow=10, ncol=  1)
notas_bim5
colnames(notas_bim5) = 'bim5'

cbind(notas,notas_bim5)

cbind(notas,notas_bim5,notas_bim5,notas_bim5)

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
