
############################ Introdução ao R ##################################

# Autora: Ana Carolina Fernandes Dias
# Linkedin: https://www.linkedin.com/in/ana-carolinadias/

##########################################################################################

##########################################################################################
# Estruturas de Repetição
##########################################################################################


#Há ocasiões em queremos ou precisamos executar parte do código apenas se alguma condição for atendida. 
# O R fornece três opções básicas para estruturar seu código dessa maneira: if(), if() else e ifelse(). 

##########################################################################################
# Utilizando o if 
##########################################################################################

# Vamos atribuir um valor à variável cond e testar se a mesma é maior do que 5. 
# Caso a variável seja maior do que 5, vamos imprimir no console o texto 
# “Maior do que 5”.

cond <- 6
if(cond > 5){
  print("Maior do que 5")
}


cond <- 3
if(cond > 5){
  print("Maior do que 5")
}

# É fácil perceber que obtivemos a saída no console apenas para o primeiro caso.
# É que no segundo caso o teste (cond > 5) retornou FALSE, 
# impedindo a execução do comando print("Maior do que 5").

#####################################################################################33
# Utilizando o if e o else 
#####################################################################################

#Agora vamos incrementar um pouco mais o nosso código. Caso cond seja menor ou igual a 5, 
# vamos imprimir “Menor ou igual a 5” no console. Para isso, adicionaremos um else da seguinte forma:
  
  
cond <- -2
if(cond > 5){
  print("Maior do que 5")
} else {
  print("Menor ou igual a 5")
}

# Veja que agora, caso o valor de cond não seja maior do que 5, 
# executamos uma outra tarefa, que é a exibição da mensagem “Menor ou igual a 5”.


# Como melhoria do nosso algoritmo, vamos exibir uma mensagem específica para cada uma das seguintes condições:
  
# número maior do que 5;
# número igual a 5;
# número menor do que 5.
# 
# Para acomodarmos essa nova situação, utilizamos else if para testar a condição cond == 5. A solução é a seguinte:


cond <- 5
if(cond > 5){
  print("Maior do que 5")
} else if (cond == 5){
  print("Igual a 5")
} else {
  print("Menor do que 5")
}

# ------------------------------------

numero <- 1

if (numero == 1) {
  print("o numero é igual a 1")
} else {
  print("o numero não é igual a 1")
}
## o numero é igual a 1

# ------------------------------------

numero <- 10

if (numero == 1) {
  print("o numero é igual a 1")
} else if (numero == 2) {
  print("o numero é igual a 2")
} else {
  print("o numero não é igual nem a 1 nem a 2")
}

# ------------------------------------

# Para fins de ilustração, vamos criar uma função que nos diga se um número é par ou ímpar. 
# Nela vamos utilizar tanto o if() sozinho quanto o if() else.

# Vale relembrar que um número (inteiro) é par se for divisível por 2 
# e que podemos verificar isso se o resto da divisão (operador %% no R) 
# deste número por 2 for igual a zero.

par_ou_impar <- function(x){
  
  # verifica se o número é um decimal comparando o tamanho da diferença de x e round(x)
  # se for decimal retorna NA (pois par e ímpar não fazem sentido para decimais)
  if (abs(x - round(x)) > 1e-7) {
    return(NA)
  }
  
  # se o número for divisível por 2 (resto da divisão zero) retorna "par"
  # caso contrário, retorna "ímpar"
  if (x %% 2 == 0) {
    return("par")
  } else {
    return("impar")
  }
  
}

par_ou_impar(4)
## [1] "par"

par_ou_impar(5)
## [1] "impar"

par_ou_impar(2.1)
## [1] NA

# ------------------------------------

# Parece que está funcionando bem… só tem um pequeno problema. 
# Se quisermos aplicar nossa função a um vetor de números, olhe o que ocorrerá:

x <- 1:5
par_ou_impar(x)

# A função ifelse()
# Os comandos if() e if() else não são vetorizados. 
# Uma alternativa para casos como esses é utilizar a função ifelse().

#####################################################################################33
# Utilizando a função ifelse()
#####################################################################################

salarios<-c(1000, 400, 1200, 3500, 380, 3000, 855, 700, 1500, 500) 

# Aplicamos o teste e pedimos para retornar "pouco" para quem ganha menos de 1000
# e "muito" para quem ganha mais de 1000.

ifelse(salarios<1000,"pouco","muito")# Se o salário é menor que 1000, imprima pouco, se for maior imprima muito.

# Vamos criar uma versão com ifelse da nossa função que nos diz se um número é par ou ímpar.


par_ou_impar_ifelse <- function(x){
  
  # se x for decimal, retorna NA, se não for, retorna ele mesmo (x)
  x <- ifelse(abs(x - round(x)) > 1e-7, NA, x)
  
  # se x for divisivel por 2, retorna 'par', se não for, retorna impar
  ifelse(x %% 2 == 0, "par", "impar")
}

par_ou_impar(4)
## [1] "par"

par_ou_impar(5)
## [1] "impar"

par_ou_impar(2.1)
## [1] NA

x <- 1:5
par_ou_impar(x)

par_ou_impar_ifelse(c(x, 1.1))


# -----------------------------------------------------------------------------------

# ifelse() com mais de duas condições 

x = 1
y = 2
ifelse(x == 1 & y == 2 , "x é igual a 1 e y é igual a 2", 
       ifelse(x > 1 & y == 2, "x é maior a 1 e y é igual a 2", "outro caso"))


x = 2
y = 2
ifelse(x == 1 & y == 2 , "x é igual a 1 e y é igual a 2", 
       ifelse(x > 1 & y == 2, "x é maior que 1 e y é igual a 2", "outro caso"))


# -----------------------------------------------------------------------------------

Nome = 'Ana'
Idade = 25

ifelse(Nome == 'Ana' & Idade == 25 , "Você é a professora do curso", 
       ifelse(Nome == 'Ana' | Idade == 25 , "Você não é a professora"))


Nome = 'Marcela'
Idade = 25

ifelse(Nome == 'Ana' & Idade == 25 , "Você é a professora do curso", 
       ifelse(Nome == 'Ana' | Idade == 25 , "Você não é a professora"))




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
