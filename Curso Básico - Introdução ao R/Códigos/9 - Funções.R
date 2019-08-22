
############################ Introdução ao R ##################################

# Autora: Ana Carolina Fernandes Dias
# Linkedin: https://www.linkedin.com/in/ana-carolinadias/

##########################################################################################

##########################################################################################
# Funções R
##########################################################################################

# Na programação, você usa funções para incorporar conjuntos de instruções que deseja usar repetidamente ou que, 
# devido à sua complexidade, são guardadas em um subprograma e são chamadas quando necessário. 

# Uma função é um pedaço de código escrito para executar uma tarefa especificada; 
# que aceita argumentos e retorna um ou mais valores.


# Já utilizamos algumas funções nesse curso.

notas <- c(90,85,72,96)
notas

mean(notas)
min(notas)
max(notas)
length(notas)
length

##########################################################################################
# Criando as funções 
##########################################################################################

# Certifique-se de que o nome escolhido para a função não seja uma palavra reservada por R. 
# Isso significa que você, por exemplo, não quer escolher o nome de uma função existente 

# function.name <- function(arguments) 
# {
#   computations on the arguments
#   return()
# }

# A função tem um nome, alguns argumentos usados como entrada para a função dentro do ()
# seguido da palavra-chave 'function'; um corpo, que é o código dentro das chaves {}, onde você realiza o cálculo; 
# e pode ter um ou mais valores de retorno (a saída). 

#---------------------------------------------------------------------------------------------
#Vamos criar uma função como a função mean(), que calcula a média de um vetor. 

média = function(x){
    media = sum(x)/ length(x)
    return(media)
}

x

notas <- c(90,85,72,96)

média(notas)
mean(notas)

#---------------------------------------------------------------------------------------------

# Crie uma função calcular o valor fornecido/10 + 500 

calculo <- function(numero_final) {
    conta <- (numero_final/10) +500
    return(conta)  

}

calculo(6)

#---------------------------------------------------------------------------------------------

# Vamos ver como criar funções começando por uma função simples, que apenas simula a jogada de
#moedas (cara ou coroa). 

#Neste caso a função terá dois argumentos (x e n). 
# x será a "moeda" c("cara","coroa") e n será o número de vezes que deseja jogar a moeda.

# Vamos dar o nome a esta função de jogar.moeda

jogar.moeda<-function(x,n){ ## Não digite tudo na mesma linha
  
  return(sample(x,n, replace=T))

} # Fim da função


# A primeira chave "{" indica o início do algoritmo da função e a outra indica o fim "}".
# O comando sample(x,n) indica que desejamos amostrar x, n vezes (jogar a moeda n vezes).
# Agora vamos usar nossa função, mas primeiro vamos criar a "moeda".

moeda<-c("Cara","Coroa")

jogar.moeda(moeda,2)
jogar.moeda(moeda,10)
jogar.moeda(moeda,1000)

# Veja que jogando 1000 moedas ficou difícil saber quantas caras e quantas coroas saíram. Com a
# função table(), podemos descobrir isso facilmente.

table(jogar.moeda(moeda,1000))

# Veja que também podemos usar a função jogar.moedas para jogar dados:

dado <-1:6

jogar.moeda(dado,2)

table(jogar.moeda(dado,200))

#---------------------------------------------------------------------------------------------

##########################################################################################
# Criando uma função com multiplos argumentos 
##########################################################################################

outra_funcao <- function(a,b,c) {
  result <- a * b + c
  print(result)
}

# chamando a função pela posição dos argumentos .
outra_funcao(5,3,11)

#Chamando a função pelo nome dos argumentos 
outra_funcao(a = 5,b = 3, c = 11)
outra_funcao(c = 5,a = 3, b = 11)

#---------------------------------------------------------------------------------------------

##########################################################################################
# Criando uma função com argumento padrão 
##########################################################################################

# Podemos definir o valor padrão dos argumentos na definição da função e chamar a
# função sem fornecer nenhum argumento para obter o resultado padrão.
# Mas também podemos chamar essas funções fornecendo novos valores do argumento e obtendo um resultado não padrão.

# Create a function with arguments.

nova_funcao <- function(a = 3, b = 6) {
  result <- a * b
  return(result)
}

# Chamando a função sem passar nenhum argumento 
nova_funcao()

# Chamando a função passando novos argumentos
nova_funcao(9,5)

# Perceba que a função sem argumentos só funciona, pq definimos argumentos padrões. 

nova_funcao2 <- function(a , b ) {
  result <- a * b
  return(result)
}

nova_funcao2() # Não funciona pq nao temos nenhum valor definido para os argumentos. 


##########################################################################################
# Avaliação Preguiçosa da Função
##########################################################################################

# Argumentos para funções são avaliados preguiçosamente,
# o que significa que eles são avaliados apenas quando necessário pelo corpo da função.

nova_funcao3 <- function(a, b) {
  print(a^2)
  print(a)
  print(b)
}

# Avaliando a função sem fornecer o argumento b 
nova_funcao3(6)
nova_funcao3(a = 6)
nova_funcao3(b = 6)



# Argumento b com um padrão definido 
nova_funcao4 <- function(a, b = 2) {
  print(a^2)
  print(a)
  print(b)
}

# Avaliando a função sem fornecer o argumento b 
nova_funcao4(6)

nova_funcao4(b= 6)


#---------------------------------------------------------------------------------------------

# Porque criar funções? 

#Evitar repetições desnecessárias 

set.seed(4)
notas <- sample(60:90,4)
notas

notas2 <- sample(60:90,4)
notas2

notas3 <- sample(60:90,4)
notas3

sum(notas)/ length(notas)
sum(notas2)/ length(notas2)
sum(notas3)/ length(notas3)

mean(notas) ; mean(notas2); mean(notas3)

##########################################################################################
# Chamando funções salvas em outros arquivos. 
##########################################################################################

#Crie a função média novamente, mas salve em outro arquivo chamado funcao_media. 

rm(list=ls()) #Limpando a area de trabalho

source("funcao_media.R")

notas <- c(90,85,72,96)
media(notas)

##########################################################################################
# Diferença entre criar uma função e escrever um código 
##########################################################################################

# Existem milhares de formas de se trabalhar em R. Algumas pessoas preferem escrever pedaços de
#códigos e executá-lo quantas vezes seja necessário, enquanto outras preferem criar funções mais
#automatizadas, mas ambas produzindo o mesmo resultado. Em alguns casos vocês irão se deparar com
#códigos e em outros casos com funções. É preciso saber diferenciar os dois tipos, pois seu uso é levemente
#diferente e pode gerar confusões.

#Vamos gerar um código que escolhe números para a mega sena e depois vamos criar uma função
# que faz a mesma coisa.

njogos<-20 # quantos jogos queremos produzir

numeros<-matrix(NA,6,njogos) # arquivo que irá receber números dos jogos

for(i in 1:njogos) {
  numeros[,i]<-sample(1:60,6)
  35 }

numeros

# Agora, caso você queira mudar o número de jogos (njogos), é preciso mudar o valor e rodar o código
# todo novamente. 

# Crie agora 50 jogos.

# Vamos transformar nosso código em uma função e ver o que muda, apesar dos comandos serem
# quase os mesmos.

megasena<-function(njogos){ # cria a função com nome de megasena

  numeros<-matrix(NA,6,njogos) # cria o arquivo que recebe os jogos
      for(i in 1:njogos){
        numeros[,i]<-sample(1:60,6)
      }
   return(numeros)
}

megasena(50)
megasena(100)
megasena(20)

# O interessante em criar uma função, é que após ela estar funcionando você precisa mudar apenas um
# argumento, que nesse caso é o njogos.

# Em geral, muitas pessoas criam um código, conferem se ele está funcionando e depois transformam o
# código em uma função para facilitar o processo de repetição.

##########################################################################################
# Funções aninhadas 
##########################################################################################

# Podemos utilizar funções prontas para criar outras funções. 

#Vamos criar uma função que tira a raiz do valor médio de um vetor 


raiz_media = function(vetor = c(1,2,3,4)){
      media =  mean(vetor)
      raiz = sqrt(media)
      return(raiz)
  }

raiz_media()

raiz_media(c(5,6,8,9))
sqrt(mean(c(5,6,8,9))) #Conferindo o calculo da função


##########################################################################################
# Funções interativa 
##########################################################################################


função_interativa <- function(){ 
  
  numero <- readline(prompt="Digite um número: ")
  
  print(paste("Você digitou o número:", numero))  
}

função_interativa()


##########################################################################################
# Múltiplos retornos de Funções 
##########################################################################################

# A função return () pode retornar apenas um único objeto. 
# Se quisermos retornar vários valores em R, podemos usar uma lista (ou outros objetos) e retorná-lo.

multi_return <- function () {
  my_list <- list ("color" = "vermelho", "tamanho" = 20, "forma" = "redondo")
  return (my_list)
}

multi_return()



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
