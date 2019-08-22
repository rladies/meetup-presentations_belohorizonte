
############################ Introdução ao R ##################################

# Autora: Ana Carolina Fernandes Dias
# Linkedin: https://www.linkedin.com/in/ana-carolinadias/

############################### Passos Introdutórios #####################################


##########################################################################################
#                             Classes de Objetos 
##########################################################################################

# Os objetos podem ser numéricos, inteiros, lógicos, ou character(texto)

# Character (Informacoes de tipo texto, "string")
"a"
"1"
"positivo"
"Error: objeto x não encontrado"

disciplina = "Matemática"
disciplina


# Numeric (numeros reais: aceitam decimais)
1
0.10
0.95
pi

numero = 10
numero

# Integer (numeros inteiros, nao aceitam decimais)

# A letra L apos um valor indica que ele e um numero inteiro, isto e, nao tem
# valores em casas decimais. 
1L
5L
10L

# Logical (guardam apenas as informacoes "VERDADEIRO"/"FALSO")
TRUE
FALSE
T
F

verdadeiro = TRUE
verdadeiro

#Fatores Variáveis qualitativas, ou seja, características dos indivíduos para as quais 
#não é possível atribuir um valor numérico

#Eles são úteis para representar uma variável categórica (nominal e ordinal). 

sexo <- c("Masculino", "Feminino")
sexo <- as.factor(sexo)    ## A ordem dos "niveis" dos valores e conferida alfabeticamente
sexo
as.numeric(sexo)
levels(sexo)
class(sexo)


#A ordem dos valores pode ser atribuida de forma personalizada, usando o argumento 

fator <- factor(c("Masculino", "Feminino"),
                levels=c("Feminino","Masculino"))
fator # agora o valor Femnino vem primeiro

#Para saber a classe de um objetivo, você pode usar a função class().

x <- 1
class(x)

y <- "a"
class(y)

z <- TRUE
class(z)

class(5 > 3)

class(sexo)


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
