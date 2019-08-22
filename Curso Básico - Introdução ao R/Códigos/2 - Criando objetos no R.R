
############################ Introdução ao R ##################################

# Autora: Ana Carolina Fernandes Dias
# Linkedin: https://www.linkedin.com/in/ana-carolinadias/


############################### Passos Introdutórios #####################################

# O R permite salvar dados dentro de um objeto. Para isso, utilizamos o operador <- OU O = 

# Podemos atribuir números, textos e resultados a um objeto criado. 
# Vamos construir um objeto chamado x com o valor 5 e um objeto y com o valor 7:

x <- 5 
X = 5 

y = 7
x 
y 
x;y 

# Dessa maneira podemos utilizar esses objetos para fazer calculos e manipulações 
x+y
x*y
z = 2*x + y^2
z

# Obs Se eu atribuir outro vetor ao objeto x, ele será sobrescrito.
# Atribuiam sempre nomes diferentes ao objetos que precisem usar 

Idade <- 25 
Idade = 25 

altura = 1.67 

# Variáveis no R podem ser nomeadas usando letras, números, ponto (.) e underline (_)

# Nomes de variáveis são válidos em R:
  
soma = 15 
valor1 = 90 
.resultado = "Aprovado"
primeira_nota = 25 
nota_2 = 64 

soma; valor1; .resultado; primeira_nota; nota_2


# Já os seguintes nomes não são válidos:

1nota = 10 
.2periodo = 3 
soma parcial = 80 
resultado-final = "Reprovado"
true = 1 
for = 6 

#É possível criar várias variáveis de uma vez em R usando a estrutura a seguir:
  
var1 <- var2 <- varN <- varn <-  10
var1 = var2 = varN =  varn =  10

var1 
var2
varN
varn

##########################################################################################
#Comandos úteis:
##########################################################################################


ls() #este comando lista os objetos no ambiente

rm(x,y) #este comando remove objetos
ls()

rm(list=ls(all=T)) # para limpar tudo no ambiente 
rm(list = ls())

  
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
