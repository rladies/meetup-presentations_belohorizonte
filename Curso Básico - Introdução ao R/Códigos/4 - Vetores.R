
############################ Introdução ao R ##################################
# Autora: Ana Carolina Fernandes Dias
# Linkedin: https://www.linkedin.com/in/ana-carolinadias/

############################### Passos Introdutórios #####################################


##########################################################################################
#Trabalhando com vetores
##########################################################################################

# É uma estrutura de dados básica do R, que permite armazenar um conjunto de valores sob um mesmo nome.
# Esses valores podem ser acessados individualmente através de índices.

# A vantagem de criar vetores é que eles permitem que 
# você execute operações em todos os valores de uma só vez.

# Para criar um vetor utilizamos O comando c() que 
# significa concatenar, ou seja, juntar os valores.

#Vamos construir um objeto x e atribuir a ele um vetor de números:

notas <- c(90,85,72,96)
notas

Idades = c(25,24,26,22)
Idades

z <- c('a','b','c')

#Podemos verificar o tamanho do vetor com o comando length():

length(notas)
length(Idades)
length(z)

#Podemos verificar a classe do vetor com o comando class():

class(notas) 
class(Idades) 
class(z)

##########################################################################################
## Vetores são homogêneos - Classes
##########################################################################################

#Os elementos de um vetor são sempre da mesma classe. 
#Ou todos são numéricos, ou são todos character, ou todos são lógicos etc.
#Não dá para ter um número e um character no mesmo vetor, por exemplo.

#Se colocarmos duas ou mais classes diferentes dentro de um mesmo vetor, 
#o R vai forçar que todos os elementos passem a pertencer à mesma classe. 

x <- c(1.7, "a")  ## character
y <- c(TRUE, 2)   ## numeric
z <- c(TRUE, "a") ## character

class(x);class(y); class(z)

#A ordem de precedência é:
#DOMINANTE character  > integer > logical 

##########################################################################################
#Transformacao de vetores entre diferentes classes
##########################################################################################

# Podemos explicitamente alterar a classe de vetor com o uso de funcoes com 
# que se iniciam com as. : 

# - as.numeric()
# - as.logical()
# - as.character()
# - as.integer()
# - as.factor

x <- 0L:10L
x
class(x)

as.character(x)

y <- as.numeric(x)
y
class(y)

#Se o R não entender como coagir uma classe na outra,
#ele soltará um warning informado que colocou NA no lugar.

# Mas esse tipo de coercao nem sempre funciona:
x <- c("a","b","c")
as.numeric(x)
as.logical(x)

#Quando um vetor de números está como factor, ao tentar transformá-lo em numeric, 
#você receberá um vetor de inteiros que não tem nada a ver com os valores originais!

numeros <- factor(c("10", "55", "55", "12", "10", "-5", "-90"))
as.numeric(numeros)

#Para evitar isso, use as.character() antes de transformar para número.
as.numeric(as.character(numeros))


###########################################################################################################
#Operações matemáticas e lógicas com vetores
###########################################################################################################

notas <- c(90,85,72,96)

#Ao realizarmos qualquer operação entre um vetor numérico e um número, 
#a operação é realizada para cada um dos componentes do vetor, gerando um vetor resultado.


notas^2      #Elevando as notas ao quadrado 
notas + 1    #somando um ponto em todas as notas 
notas * 3    #multiplicando as notas por 3 
notas / 10   #divindo as notas por 10 

mean(notas)  #tirando a media das notas
min(notas)   #Encontrando a nota minima 
max(notas)   #Encontrando a nota maxima

notas > 80 
notas < 70 
notas != 100 

#Operações com dois vetores de mesmo tamanho

matematica = c(90,85,72,96)
matematica

ciencias = c(88, 93, 95, 70)
ciencias

matematica + ciencias #soma elemento-a-elemento
matematica - ciencias #substracao elemento-a-elemento
matematica * ciencias #multiplicacao elemento-a-elemento
matematica / ciencias #divisao elemento-a-elemento
sum(matematica,ciencias) #funcao sum() soma todos os elementos do vetor

###########################################################################################################

#Reciclagem de vetores 

matematica  = c(90,85,72,96)
ciencia     = c(88,93,95)

matematica + ciencias #soma elemento-a-elemento
matematica - ciencias #substracao elemento-a-elemento
matematica * ciencias #multiplicacao elemento-a-elemento


#O R alinhou os dois vetores e, como eles não possuíam o mesmo tamanho, 
#foi repetindo o vetor menor até completar o vetor maior. 
#Esse comportamento é chamado de reciclagem e é útil para fazer operações elemento por elemento 
#(vetorizadamente).

#----------------------------------------------------------------------------------------

#Inserindo novos valores em um vetor

#Caso voce tenha apenas esquecido de adicionar o ultimo valor ao vetor, voce pode simplemente completa-lo:

ciencia = c(88,93,95)

ciencia = (c(ciencia,65))
ciencia

ciencia = (c(ciencia,88, 99, 55, 66 ))
ciencia


##########################################################################################
##nOutras formas de criar vetores
##########################################################################################

# Ha diversas formas de criar vetores. Os comandos seq e : sao 
# bastante usados para criar sequencias de valores sucessivos. 

1:10
1:30
32:100
1.5:10  
20:1
10:-10

#A função seq() permite algumas opções mais elaboradas:
seq(from = 1, to = 30)
seq(from = 1, to = 30, by=.1)
seq(1, 30, .1)

seq(from=15, to=30, by= 0.5)
seq(from=15, to=30, length=10) #tamanho da sequência definida

#Podemos ainda criar repetições com a função rep():
  
rep(0, times = 40)
rep(1,10)

rep(1:3,10)
rep(c(1, 2, 4), times = 10)
rep(c(0, 1, 2), each = 10)
rep(c(TRUE,FALSE), each = 10)
rep(c("Joao","Maria"), times = 10)

Joao_Maria <- rep(c("Joao","Maria"), times = 10)

#Criando números aleatórios 

#Gerar 20 valores entre 0 e 1 com reposição
sample(1:5, 20, replace = TRUE)

sample(30:100, 20, replace = TRUE)
sample(30:100, 20, replace = FALSE)

#Gerar 5 valores decimais entre 0 e 10
runif(5, 0, 10)

#Podemos gerar também valores aleatórios de variáveis do tipo character. 
#Para isso, podemos utilizar a função sample() e definir um vetor de onde deverá ser
#selecionada a amostra. Como exemplo, podemos gerar 5 valores aleatórios entre as variáveis categóricas 
#“masculino” e “feminino”. 

sample(c("masculino", "feminino"), 5, replace = TRUE)


##########################################################################################
##Selecionando componentes dentro de vetores (subsetting)
##########################################################################################

# Como vimos, vetores sao objetos compostos, que armazemam mais de uma informacao
# ao mesmo tempo. Dizemos que vetores tem componentes ou elementos. Para selecionar
# um componente dentro de um vetor, utilizamos os colchetes [] e, dentro deles, 
# indicamos a posicao do objeto. O numero dentro do colchete, que indica a posicao
# do componente e chamado de **indice**.

alunas = c("Ana","Maria","Paula", "Beatriz")
alunas

alunas[1]
alunas[2] 
alunas[20] #nao existe valor na vigesima posicao de alunas
alunas[2:4]

alunas[c(1,3)]


#Atribuir nomes a elementos de um vetor pode facilitar a indexação.

names(alunas)

names(alunas) <- c("Aluna1","Aluna2","Aluna3","Aluna4")
alunas

nomes = c("Aluna1","Aluna2","Aluna3","Aluna4") 
names(alunas) = nomes 

alunas["Aluna1"]
alunas["Aluna4"]

##########################################################################################
# Outras operações com vetores - Fazendo perguntas à vetores
##########################################################################################

#um vetor numerico
vetor = 1:20

#quais valores de v1 são maiores ou iguais a 10
resultado = vetor >= 10 #vai retornar um vetor lógico
resultado

#soma dos verdadeiros responde "quantos valores de v1 são maiores ou iguais a 10, 
#pois apenas esses valores são verdadeiros ou seja são 1)

sum(vetor)
sum(resultado)

#experimente os demais operadores

w <- c(11, 12, 13, 14, 15)

# Ao realizar uma operação lógica com um vetor obtemos como resultado um vetor lógico.

# Esse vetor resultado é importante para filtrarmos elementos do nosso vetor. 
# Suponhamos que desejamos selecionar os elementos do vetor w que sejam maiores ou iguais a 13.

w[w >= 13]


# Se quisermos saber em quais posições do vetor se encontram 
# os elementos que satisfazem à condição, podemos utilizar a função  which().
which(w >= 13)


#----------------------------------------------------------------------------------------

v1 = 1:5
v2 = 1:5

resultado2 = v1==v2 #compara cada par dos vetores que são idênticos
resultado2 #é o vetor lógico resultando, todos os valores são verdadeiros

#portanto, as seguintes expressões também são verdadeiras
sum(v1==v2)==length(v1)
#----------------------------------------------------------------------------------------

#valores duplicados
vv = c(2,2,2,3,4,5) 

vv #apenas o dois é duplicado
duplicated(vv) #note que esta função retorna TRUE apenas para dois dos três valores 2 (o primeiro não é duplicado)

#----------------------------------------------------------------------------------------
#comparando vetores
v1 = c(1,2,3,4)
v2 = c(4,4,5,6)

v1 %in% v2 #quantos elementos de v1 existem em v2

sum(v1%in%v2) #apenas 1

v2%in%v1 #quais elementos de v2 estão em v1

sum(v2%in%v1) #os dois quatro

#----------------------------------------------------------------------------------------

notas.das.alunas = c(6.0, 5.1, 6.8, 2.8, 6.1, 9.0, 4.3, 10.4,6.0, 7.9, 8.9, 6.8, 9.8, 4.6, 11.3, 8.0, 6.7, 4.5)

## Qual a média geral das alunas ? 
mean(notas.das.alunas)

## Qual a menor nota? 
min(notas.das.alunas)

## Qual a maior nota? 
max(notas.das.alunas)

range(notas.das.alunas) #min e maximo ao mesmo tempo

##Quantas alunas foram aprovadas?
sum(notas.das.alunas>=5)

#Qual a proporção de aprovadas?
prop = sum(notas.das.alunas>=5)/length(notas.das.alunas)
prop
prop * 100
round(prop * 100,2)
#ou em texto

paste(round(prop*100),"%",sep="")

#----------------------------------------------------------------------------------------

#E VETORES DE TEXTO?
v1 = rep(c("banana","pera","laranja","limão"),10)

v1 #um vetor de palavras

#quantos elementos são iguais a banana
v1=="banana"

sum(v1=="banana")

#também poderia perguntar: quantos elementos de v1 contém banana
sum(v1%in%"banana")

v1%in%"banana"

#no caso acima == e %in% funcionam igual, mas o operador %in% é util quando quisermos 
#comparar dois vetores de character

v2 = c("banana","pera","abacate")

v1%in%v2 #quais elementos de v1 correspondem a elementos de v2

sum(v1%in%v2) #quantos são? 10 laranjas e 10 peras 

v2%in%v1 #quais elementos de v2 estão em v1

sum(v2%in%v1) #quantos são (apenas laranja e pera, abacate não está)

#----------------------------------------------------------------------------------------

#& - essa condição E essa outra
#|| - essa condição OU essa outra
#! - inverte os valores da pergunta

#um vetor
v1 = 1:20
v1

p1 = v1>5 & v1<=15 #quais elementos de v1 são maiores que 5 E menores ou iguais a 15
sum(p1) #quantos são?

p1 = v1>5 | v1<=15 #quais elementos de v1 são maiores que 5 OU menores ou iguais a 15
sum(p1) #quantos são

#!exclamação NEGA ou INVERTE verdadeiros e falsos
v1 = 1:20
sum(v1==5) #quantos v1 são iguais a 5?
sum(!v1==5) #quantos v1 são diferentes de 5?

sum(v1>5) #quantos v1 são maiores que 5?
sum(!v1>5) #quantos v1 são menores que 5?

#texto

v1 = rep(c("banana","pera","laranja","limão"),10)
v1 #um vetor de palavras

vl = v1=="banana" & v1=="pera" #quantos elementos de v1 sao banana E sao pera
vl 
sum(vl)  #nenhum valor satisfaz as duas condicoes

vl = v1=="banana" | v1=="pera" #quantos elementos de v1 sao banana ou sao pera
vl 
sum(vl)  #tem 20 valores que satisfazem 1 das 

#isso é o mesmo que pergunta desse outro jeito:
sum(v1%in%c("banana","pera"))

#----------------------------------------------------------------------------------------

#A função grep() permite perguntar a um vetor de palavras por busca parcial.

?grep #veja o help dessa função e seus argumentos

#um vetor de palavras
v1 = rep(c("banana","pera","laranja","limão"),5)

grep("an",v1) #quais elementos tem a palavra 'an' no nome?

#note que é case.sensitive (depende se é maiusculo ou minúsculo)
grep("An",v1) #não encontra nada

grep("An",v1,ignore.case=T) #mas eu posso dizer para ele ignorar se é minusculo 
# ou maiúsculo e ele encontra novamente  quem sao esses elementos

vl = grep("An",v1,ignore.case=T) #pega os índices desses elementos
v1[vl]
unique(v1[vl]) #valores únicos desse vetor

#----------------------------------------------------------------------------------------

##########################################################################################
#Valores especiais - Missing Data
##########################################################################################

#Existem valores reservados para representar dados faltantes, infinitos, e indefinições matemáticas.

#NA (Not Available) significa dado faltante/indisponível.O NA tem uma classe, ou seja, podemos ter NA numeric, NA character etc.
#NaN (Not a Number) representa indefinições matemáticas, como 0/0 e log(-1). Um NaN é um NA, mas a recíproca não é verdadeira.
#Inf (Infinito) é um número muito grande ou o limite matemático


x <- c(1,2,NA,10,3.2) # Numerico!!!
class(x)
is.na(x)
mean(x)


# NaN - Significa "Not a number" 
0/0
is.na(0/0)
is.nan(0/0)

x <- c(1,2,NA,NaN,4)
x

#um valor infinito negativo
-5/0
#um valor infinito positivo
10/0


#### Removendo valores missing

# O comando is.na retorna valores logicos
x <- c(1, 2, NA, 4, NA, 5)

is.na(x)
missing = is.na(x)
x[!missing]

na.omit(x)

x[complete.cases(x)]

#--------------------------------------------------------------------------------------------------------------



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







