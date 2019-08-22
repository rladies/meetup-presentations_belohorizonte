
############################ Introdução ao R ##################################

# Autora: Ana Carolina Fernandes Dias
# Linkedin: https://www.linkedin.com/in/ana-carolinadias/

##########################################################################################

##########################################################################################
#Trabalhando com Listas 
##########################################################################################

#Uma lista no R pode ser entendida como um objeto capaz de armazenar elementos com diferentes tipos de dados.
# Logo, uma mesma lista pode armazenar um valor único, um  vetor, um data frame e uma matriz. 

#É um dos objetos mais importantes para armazenar dados 
#e vale a pena saber manuseá-los bem.
#Existem muitas funções que fazem das listas objetos incrivelmente úteis.

#Criamos uma lista com a função list(), que aceita um número arbitrário de elementos. 
#Listas aceitam QUALQUER tipo de objeto. 
#Podemos ter listas dentro de listas, por exemplo. 
#Como para quase todas as classes de objetos no R.

x <- list(1:5, "Z", TRUE, c("a", "b"))
x


#Utilizaremos algumas classes que criamos anteriormente para formar uma lista 

notas = c(90,85,72,96)

dados =  data.frame(
  nome = c("João", "Pedro", "Amanda", "Fábio", "Fernanda", "Gustavo"),
  altura = c(1.80, 1.77, 1.71, 1.65, 1.66, 1.63),
  idade = c(22, 21, 18, 20, 23, 19),
  sexo = c("masculino", "masculino", "feminino", "masculino", "feminino", "masculino"),
  peso = c(78.3, 82.1, 66.5, 88.1, 58, 75.4),
  fumante = c(TRUE, FALSE, FALSE, FALSE, TRUE, FALSE),
  uf = c("PB", "AL", "PE", "PE", "SP", "CE"),
  renda = c(2, 5, 10, 20, 10, NA),
  stringsAsFactors = FALSE)



matriz = matrix(1:100, nrow = 10, ncol = 5)


lista <- list(notas, dados, matriz)
lista


#Veja que a lista contém um data frame, uma matriz e um vetor.


#Para visualizar a estrutura do nosso novo objeto, podemos também utilizar a função str().

str(lista)

#Podemos ter uma visão resumida dos três objetos que compõem nossa lista. 
# Nesse ponto é importante lembrar que as listas no R não possuem dimensão e sim tamanho. 
#Logo, a função ser utilizada para saber o tamanho de uma lista é a length().

length(lista)

##########################################################################################
# Manipulando listas
##########################################################################################

# Para manipularmos listas no R, a sintaxe é similar a que utilizamos com vetores. 
# Para nos referirmos aos elementos da lista, utilizamos [ ]. Veja exemplo a seguir.

lista[1]
lista[2]
lista[3]


# No entanto, na maioria dos casos, desejamos acessar o objeto guardado em determinada posição da nossa lista. 
# Dessa forma, utilizamos [[ ]] para indexarmos. 
# Digamos que você queira acessar o terceiro elemento do vetor notas, armazenado na lista. 
# Sabendo que se trata de um vetor, basta fazer:

#Acessando o data frame dentro da lista 

lista[2]  # Acessando o objeto da lista - data frame
class(lista[2])

lista[[2]]   #Acessando diretamente o data frame
class(lista[[2]])

lista[[2]][1,] #Selecionando a primeira linha do data frame de dentro da lista 
lista[[2]][,2] #Selecionando a segunda coluna do data frame de dentro da lista 

lista[[2]][,1:3]


#Acessando a matriz dentro da lista 

lista[3] # Acessando o objeto da lista - matriz
class(lista[3])

lista[[3]]   #Acessando diretamente a matriz 
class(lista[[3]])

lista[[3]][1,] #Selecionando a primeira linha da matriz de dentro da lista 
lista[[3]][,2] #Selecionando a segunda coluna da matriz d de dentro da lista 

lista[[3]][,1:3]

#Acessando o vetor dentro da lista

lista[1]    # Acessando o objeto da lista - vetor
class(lista[1])

lista[[1]]     #Acessando diretamente o vetor
class(lista[[1]])

lista[[1]][1,]   #Não é possivel utilizar este comando, uma vez que vetores nao possuim duas dimensoes, o vetor contem apenas linhas ou colunas
lista[[1]][,2]

lista[[1]][1] #Acessando o primeiro elemento do vetor 
lista[[1]][2] #Acessando o segundo elemento do vetor


# Assim como nos outros objetos que conhecemos até agora, 
# podemos indexar uma lista através dos nomes de seus elementos. 
# Isso torna o trabalho mais rápido quando temos que lidar com listas maiores. 

#Para demonstrar o funcionamento, vamos criar uma lista2, com os mesmos elementos da lista,
#porém, nomeando os seus elementos. O data frame será chamado de data_frame1;
#a matriz será chamada de matriz1; o vetor será chamado de vetor1.

lista2 <- list(vetor1 = notas, data_frame1 = dados, matriz1 = matriz)
lista2

str(lista2)


# Para selecionar o terceiro elemento da nossa lista (a matriz), o processo é bem mais simples e intuitivo. 
#Basta digitarmos:
  
lista2$matriz1

lista2$matriz[3, ]
lista2$matriz[,1]


lista2$vetor1
lista2$vetor1[1]


lista2$data_frame1
lista2$data_frame1[1,3]
lista2$data_frame1[,3]
lista2$data_frame1[,"idade"]

lista2$data_frame1[1,3] <- 42
lista2$data_frame1


##########################################################################################
# Combinando e modificando listas
##########################################################################################

# Começaremos a aprender a modificar listas no R fazendo exclusões de seus elementos. 
# A forma mais simples de excluir elementos de uma lista é atribuindo NULL 
# ao elemento que desejamos excluir. Vamos excluir o terceiro elemento da lista02.

lista2[[3]] <- NULL
lista2

length(lista2)


# Veja que, após atribuir NULL ao elemento 3 da lista, a lista passou a ter tamanho 2. 
# Outra forma seria fazermos lista2[-3] e sobrescrever o objeto. 
# É importante lembrar que, ao atribuir NULL a um ou mais elementos da lista, 
# a lista é automaticamente modificada. 


# Para combinarmos listas, o processo é similar à combinação de vetores. 
# No exemplo seguinte, vamos criar duas listas e exibir a combinação das duas.


lista3 <- list(TRUE, "Tribunal", 20, pi)
lista3

lista4 <- list(FALSE, NULL, 45, "Contas")
lista4

c(lista3, lista4)


# Outra função bastante útil para trabalharmos com listas é a unlist(). 
# Essa função exibe os elementos da lista em forma de vetor. Vamos aplicá-la a lista04 e observar o resultado

unlist(lista4)


# Existem diversas funções no R que podemos utilizar para aplicações mais avançadas com listas. 
# Pacotes como o purrr trazem funções bastante úteis para manipular, sumarizar, modificar e combinar listas.
# No entanto, para o objetivo desse curso, as operações vistas até agora são suficientes.

########################################################################################################################
# Obs: Material produzido para o curso do R-Ladies Belo Horizonte por Ana Carolina Dias, 
# com o auxílio da Layla Comparin. 

# O material é fornecido gratuitamente e portanto, não pode ser copiado para venda. 

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
