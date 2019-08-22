
############################ Introdução ao R ##################################
# Autora: Ana Carolina Fernandes Dias
############################### Passos Introdutórios #####################################

##Comandos básicos

#Usando o R como calculadora 

1 + 1    # adição
4 - 2    # subtração
2 * 3    # multiplicação
5 / 3    # divisão
4 ^ 2    # potência
5 %% 3   # resto da divisão de 5 por 3
5 %/% 3  # parte inteira da divisão de 5 por 3

#Tente jogar no console 2 * 2 - (4 + 4) / 2. 

#OBS : As operações e suas precedências são mantidas como na matemática, ou seja, 
#divisão e multiplicação são calculadas antes da adição e subtração. 

#Se você digitar um comando incompleto, como 5 +, 
#e apertar Enter, o R mostrará um +, 
#o que não tem nada a ver com somar alguma coisa. 
#Isso significa que o R está esperando que você complete o seu comando. 
#Termine o seu comando ou aperte Esc para recomeçar.


#Se você digitar um comando que o R não reconhece, ele retornará uma mensagem de erro.

5 % 5

##########################################################################################
#A maioria dos comandos no R tem esse formato: função()
##########################################################################################

#Raiz quadrada e outras raizes
sqrt(100)
sum(1,5)
prod(2,2)
mean(2,2)
100^(1/2)
100^.5   #raiz quadrada
27^(1/3) #raiz cubica
8^(1/3)  #raiz cubica

# Exponencial (e^x)
exp(1) 
exp(2) 

# log natural(base e)
log(90)
log(5)

##########################################################################################
#Linguagem de programação orientada a objetos
##########################################################################################

#Podemos atribuir números, textos e resultados a um objeto criado. 
#Vamos construir um objeto chamado x com o valor 5 e um objeto y com o valor 7:

x <- 5
y = 7
x 
y 
x;y 

x+y
x*y
z = 2*x + y^2
z

#Obs Se eu atribuir outro vetor ao objeto x, ele será sobrescrito.
#Atribuiam sempre nomes diferentes ao objetos que precisem usar 

##########################################################################################
#Comandos úteis:
##########################################################################################

ls() #este comando lista os objetos no ambiente

rm(x,y) #este comando remove objetos
ls()

rm(list=ls(all=T)) # para limpar tudo no ambiente 


##########################################################################################
#Classes de Objetos 
##########################################################################################
#Os objetos podem ser numéricos, inteiros, lógicos, ou character(texto)

# Character (Informacoes de tipo texto, "string")
"a"
"1"
"positivo"
"Error: objeto x não encontrado"

# Numeric (numeros reais: aceitam decimais)
1
0.10
0.95
pi

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
#Para saber a classe de um objetivo, você pode usar a função class().

x <- 1
class(x)

y <- "a"
class(y)

z <- TRUE
class(z)

class(5 > 3)

##########################################################################################
#Trabalhando com vetores
##########################################################################################

#É uma estrutura de dados básica do R, que permite armazenar um conjunto de valores numéricos 
#ou de caractere sob um mesmo nome. Esses valores podem ser acessados individualmente através de índices.

#O comando c() significa concatenar, ou seja, 
#juntar os valores.

#Vamos construir um objeto x e atribuir a ele um vetor de números:

x <- c(1,3,2)
x

y = c(1,4,3)
y

z <- c('a','b','c','d')

#Podemos verificar o tamanho do vetor com o comando length():

length(x)
length(y)
length(z)

#Podemos verificar a classe do vetor com o comando class():

class(x) 
class(y) 
class(z)

#Operações com vetores

x+y #soma elemento-a-elemento
x-y #substracao elemento-a-elemento
x*y #multiplicacao elemento-a-elemento
x/y #divisao elemento-a-elemento
sum(x,y) #funcao sum() soma todos os elementos do vetor

x^2
x/2

x <- c(1,3,2,4)
y = c(1,4,3)

#Neste caso, o R irá alinhar os dois vetores e multiplicar elemento por elemento. 

x*y

#O R alinhou os dois vetores e, como eles não possuíam o mesmo tamanho, 
#foi repetindo o vetor menor até completar o vetor maior. 
#Esse comportamento é chamado de reciclagem e é útil para fazer operações elemento por elemento 
#(vetorizadamente), mas às vezes pode ser confuso. Com o tempo, você aprenderá a se aproveitar dele.

##########################################################################################
##Outras formas de criar vetores
##########################################################################################

# Ha diversas formas de criar vetores. Os comandos **seq** e **:** sao 
# bastante usados para criar sequencias de valores sucessivos. Usando **:**, 
# temos os seguintes exemplos:

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

##########################################################################################
##Vetores são homogêneos - Classes
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

##########################################################################################
#FATORES
##########################################################################################
#Fatores podem ser vistos como vetores de inteiros que possuem rótulos (levels).
#Eles são úteis para representar uma variável categórica (nominal e ordinal). 

sexo <- c("M", "H", "H", "H", "M", "M", "H")
fator <- as.factor(sexo)    ## A ordem dos "niveis" dos valores e conferida alfabeticamente
fator
as.numeric(fator)
levels(fator)
class(fator)


#A ordem das categorias de um fator pode importar. 
#Como exemplo, temos as caselas de referência de modelos estatísticos
#e a ordem das barras de um gráfico

#A ordem dos valores pode ser atribuida de forma personalizada, usando o argumento 
fator <- factor(c("M", "H", "H", "H", "M", "M", "H"),
            levels=c("M","H"))
fator # agora o valor M vem primeiro

numeros <- factor(c("10", "55", "55", "12", "10", "-5", "-90"))
as.numeric(numeros)

#Quando um vetor de números está como factor, ao tentar transformá-lo em numeric, 
#você receberá um vetor de inteiros que não tem nada a ver com os valores originais!

#Para evitar isso, use as.character() antes de transformar para número.

as.numeric(as.character(numeros))

##########################################################################################
#Valores especiais - Missing Data
##########################################################################################

#Existem valores reservados para representar dados faltantes, infinitos, e indefinições matemáticas.

#NA (Not Available) significa dado faltante/indisponível.O NA tem uma classe, ou seja, podemos ter NA numeric, NA character etc.
#NaN (Not a Number) representa indefinições matemáticas, como 0/0 e log(-1). Um NaN é um NA, mas a recíproca não é verdadeira.
#Inf (Infinito) é um número muito grande ou o limite matemático, por exemplo, 1/0 e 10^310. Aceita sinal negativo -Inf.
#NULL representa a ausência de informação. Conceitualmente, a diferença entre NA e NULL é sutil, mas, no R, 
#o NA está mais alinhado com os conceitos de estatística (ou como gostaríamos que os dados faltantes se comportassem em análise de dados) 
#e o NULL está em sintonia com comportamentos de lógica de programação.

#Use as funções is.na(), is.nan(), is.infinite() e is.null() para testar se um objeto é um desses valores.

x <- c(1,2,NA,10,3.2) # Numerico!!!
class(x)
is.na(x)
is.nan(x)
mean(x)

# NaN - Significa "Not a number" 
0/0
is.na(0/0)
is.nan(0/0)

x <- c(1,2,NA,NaN,4)
x
class(x)
is.na(x)
is.nan(x)

#### Removendo valores missing

# O comando is.na retorna valores logicos
x <- c(1, 2, NA, 4, NA, 5)

missing = is.na(x)
x[!missing]

!is.na(x)

x[complete.cases(x)]

##########################################################################################
##Selecionando componentes dentro de vetores (subsetting)
##########################################################################################

# Como vimos, vetores sao objetos compostos, que armazemam mais de uma informacao
# ao mesmo tempo. Dizemos que vetores tem componentes ou elementos. Para selecionar
# um componente dentro de um vetor, utilizamos os colchetes [] e, dentro deles, 
# indicamos a posicao do objeto. O numero dentro do colchete, que indica a posicao
# do componente e chamado de **indice**.

j = c("Pedro", "Antonio", "Fernando","Claudia")
j
names(j) <- c("Aluno1","Aluno2","Aluno3","Aluno4")
j


j[1]
j[2] 
j[20] #nao existe valor na vigesima posicao de j
j[2:4]

j[c(1,3)]

j["Aluno1"]
j["Aluno4"]

##########################################################################################
#Matrizes
##########################################################################################

# Matrizes sao outra classe de objetos do R.
#Matrizes são vetores com duas dimensões (e por isso só possuem elementos de uma mesma classe).
#sao vetores cujos valores foram ordenados em linhas e colunas. 
#Matrizes sao criadas atraves do comando **matrix()**. 
#Devemos especificar, como argumentos, os dados que farao 
# parte da matriz, o numero de linhas e o numero de colunas:

m <- matrix(1:6, nrow = 2, ncol = 3)
m

#Para investigar as dimensões de uma matriz, usamos o comando 
#dim(). nrow() e ncol() retornam o número de linhas e o número de colunas.

class(m)

length(m) # numero de elementos
dim(m) # dimensoes da matriz, isto e, o numero de linhas e columas

dim(m)[2]

nrow(m) # numero de linhas
ncol(m) # numero de colunas

A = matrix(c(1,2,3,4,5,6,7,8),nrow=2,ncol=4 , byrow = F) #default
A

A = matrix(c(1,2,3,4,5,6,7,8),nrow=2,ncol=4 , byrow = T)
A

B = matrix(1:200,nrow=20,ncol=10)
B

m <- matrix(NA , nrow=2, ncol=3)
m

m <- matrix(nrow=2, ncol=3)
m

# Para selecionar um elemento especifico de uma matriz, tambem utilizamos 
# os colchetes []. 

A[5] # quinto elemento da matriz
class(A[5])

#Para selecionar por linhas e colunas use a fórmula [linha , coluna].
A[1,4] # elemento localizado na primeira linha, quarta coluna
class(A[1,4])

A[,2] # Segunda coluna inteira
class(A[,2])

A[1,] # primeira linha inteira
A[,1] # primeira coluna inteira

sqrt(A)
A^2

# No R e sempre importante saber com que tipo de objeto estamos trabalhando. 
# Cada tipo de objeto (ou classe) tem propriedades especificas e sao acessadas 
# e analisadas com o uso de fucoes e metodos especificos. Os comandos **nrow** 
# e **ncol** nao funcionam, por exemplo com os vetores comuns. Para descobrir o 
# tipo de objeto com o qual estamos lidando, sempre devemos usar a funcao **class**. 


#Soma de matrizes 

M6 = matrix(c(2, 3, 5, 6), nrow = 2)
M7 = matrix(c(5, 3, 8, 2), nrow = 2)
M8 = matrix(c(2, 4, 6, 2, 0,1), nrow = 2, ncol = 3)

M7 + M6

#Subtração
M7 - M6

#Multiplicação por escalar
5*M6

#Multiplicação elemento a elemento
M6 * M7

# Multiplicação de matrizes (linhas por colunas)
M6 %*% M7
M6 %*% M8

#Tranposta de uma matriz
M6
t(M6)

##########################################################################################
#Dataframes
##########################################################################################

#Os data frames são os objetos do tipo banco de dados do R. 
#Eles também são organizados em linhas e colunas mas, diferente das matrizes,
#os data frames podem conter colunas de diferentes classes. Uma coluna pode ser numeric, 
#outra character e outra integer, por exemplo. 
#Os data frames são, portanto, estruturas semelhantes aos bancos de dados convencionais 
#usados em outros softwares onde as colunas são as variáveis e as linhas, os casos.

#Usualmente, seus dados serão importados para um objeto data.frame. 

#Os data.frame’s são listas especiais em que todos os elementos possuem o mesmo comprimento.
#Cada elemento dessa lista pode ser pensado como uma coluna da tabela. 
#Seu comprimento representa o número de linhas.

#Já que são listas, essas colunas podem ser de classes diferentes.
#Essa é a grande diferença entre data.frame’s e matrizes. Algumas funções úteis:

#head() - Mostra as primeiras 6 linhas.
#tail() - Mostra as últimas 6 linhas.
#dim() - Número de linhas e de colunas.
#names() - Os nomes das colunas (variáveis).
#str() - Estrutura do data.frame. Mostra, entre outras coisas, as classes de cada coluna.
#cbind() - Acopla duas tabelas lado a lado.
#rbind() - Empilha duas tabelas.

# Para criar um dataframe, usamos a funcao **data.frame()**. Devemos tambem especificar
# o nome das colunas/variaveis:

dados <- data.frame(Nomes=c("Antonio","Gilberto","Mauricio","Isabela"),
                    Profissoes=c("Video Maker","Comerciante","Bancario","Estudante"),
                    Cidades=c("Belo Horizonte","Sao Paulo","Belo Horizonte","Sao Paulo"),
                    Idades=c(65,50,67,19),
                    stringsAsFactors=F)
dados

#Podemos selecionar itens específicos de cada data frame de várias maneiras.

class(dados)
head(dados)
str(dados)

# E facil reconhecer visualmente um dataframe. Mas uma avaliacao precisa pode ser
# feita:  **data.frame** e um tipo especifico de objeto (classe) do R:
class(dados)
class(dados[4])
class(dados[[4]])

# Assim como nas matrizes, verificar o tamanho dos dataframes de diversas maneiras
# (mas o comando "length" nao funciona):
nrow(dados)  #numero de linhas/observcoes/casos
ncol(dados)  #numero de colunas/variaveis
dim(dados)   #dimensao do dataframe (linhas por colunas)

# Podemos acessar elementos de um dataframe de diversas maneiras. 
dados[1] #retorna a primeira coluna (com a class data.frame)
class(dados[1])

dados[[1]] #retorna a primeira coluna (com a class "character")
class(dados[[1]])

dados[4] #retorna a quarta coluna (com a class data.frame)
class(dados[4])

dados[[4]] #retorna a quarta coluna (com a class "numeric")
class(dados[[4]])

## **E interessante verificar essa diferenca entre colchetes simples e duplos**. 
# Os colchetes simples retornam um "sub-objeto" que possui a mesma classe que o 
# objeto original. Os colchetes duplos retornam um objeto que pode ter uma classe
# diferente -- possivelmente de tipo mais simples. **Essa diferenca sera muito 
# importante futuramente**.

# Elementos de dataframes tambem podem ser selecionados indicando coordenadas de
# linhas e colunas dentro de colchetes simples, tal como fizemos com as matrizes
dados[1,] #retorna a primeira coluna (com a class data.frame)
class(dados[1,])

dados[3,4] #retorna o conteudo da terceira linha, quarta coluna (com a class numeric)
class(dados[3,4])


# Por fim, podemos selecionar as variaveis/colunas de um data.frame usando seus 
# nomes. A funcao **names** exibe o nome das colunas do dataframe:
names(dados)

dados$Nomes #toda a coluna Nomes

# E agora podemos usar esses nomes de varias maneiras:
dados["Profissoes"]  # O resultado e um dataframe
class(dados["Profissoes"])  

dados[["Profissoes"]]  # O resultado e um vetor
class(dados[["Profissoes"]])  

dados$Profissoes # O resultado e um vetor
class(dados$Profissoes)

# Podemos combinar essas formas de selecao:
dados[["Idades"]][1]  #Primeiro elemento da variavel idade
dados[["Idades"]][2:4]  # Elementos 2,3 e 4 da variavel idade

# Vamos tentar agora um tipo mais avancado de selecao: **todas os individuos do 
# dataframe cuja idade e superior a 30 anos**. Informamos o criterio de selecao 
# das linhas dentro de colchetes simples, antes de uma virgula (lembrem-se: a 
# virgula e o criterio que separa linhas de colunas; o que esta a esquerda da 
# virgula diz respeito a linhas, o que esta a esquerda refere-se a colunas).
dados$Idades > 30
dados[dados$Idades>30,]

dados[dados$Idades > 30 & dados$Idades < 66 , ]

#Para acrescentar novas informações aos bancos de dados, usamos os comandos rbind()
#para acrescentar linhas e cbind() para acrescentar colunas.

# novas linhas, usamos o comando **rbind** (row bind):
rbind(dados, data.frame(Nomes="Fernando",Profissoes="Bancario", Cidades="Belo Horizonte",Idades=28))

# E com o comando **cbind** (column bind), acrescentamos novas colunas
cbind(dados, Time=c("Cruzeiro","Galo Doido","Cruzeiro","Galo Doido"))

#Podemos ainda criar uma matriz ou um data frame com os comandos rbind() e cbind() a partir de vetores. Por exemplo:

pessoas = c("Ana","Numiá","Layla","Larissa","Beatriz")
idades = c(23, 26, 21, 19, 27)
grupos_pesquisa = c("FAPEMIG","CAPES","FAPEMIG","CAPES","CNPQ")
colegas1 <- cbind(pessoas, idades, grupos_pesquisa)
colegas1

class(colegas1)
str(colegas1)

sapply(colegas1, class) # aplica a função class para cada elemento da matriz

colegas2 <- cbind.data.frame(pessoas, idades, grupos_pesquisa)
colegas2
class(colegas2)

sapply(colegas, class) # aplica a função class para cada elemento do data.frame (colunas)
str(colegas2)


##########################################################################################
#Listas 
##########################################################################################

#Listas são um tipo especial de vetor que aceita elementos de classes diferentes.


x <- list(1:5, "Z", TRUE, c("a", "b"))
x


#É um dos objetos mais importantes para armazenar dados 
#e vale a pena saber manuseá-los bem.
#Existem muitas funções que fazem das listas objetos incrivelmente úteis.

#Criamos uma lista com a função list(), que aceita um número arbitrário de elementos. 
#Listas aceitam QUALQUER tipo de objeto. 
#Podemos ter listas dentro de listas, por exemplo. 
#Como para quase todas as classes de objetos no R, 
#as funções is.list() e as.list() também existem.


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
  stringsAsFactors = FALSE
)


matriz = matrix(1:100, nrow = 10, ncol = 5)


lista <- list(notas, dados, matriz)
lista


#Veja que a lista contém um data frame, uma matriz e um vetor.


#Para visualizar a estrutura do nosso novo objeto, podemos também utilizar a função str().

str(lista)









#Na lista pedido abaixo, temos numeric, Date, character, vetor de character 
#e list contida em uma lista:

# Listas sao criadas com o comando **list()**. E devemos especificar os seus 
# componentes.
pedido <- list(pedido_id = 8001406,
               pedido_registro = as.Date("2017-05-25"),
               nome = "Athos", 
               sobrenome = "Petri Damiani", 
               cpf = "12345678900", 
               email = "athos.damiani@gmail.com", 
               qualidades = c("incrível", "impressionante"),
               itens = list(
                 list(descricao = "Ferrari", 
                      frete = 0, 
                      valor = 500000),
                 list(descricao = "Dolly", 
                      frete = 1.5, 
                      valor = 3.90)
               ), 
               endereco = list(entrega = list(logradouro = "Rua da Glória", 
                                              numero = "123",
                                              complemento = "apto 71"),
                               cobranca = list(logradouro = "Rua Jose de Oliveira Coutinho",
                                               numero = "151",
                                               complemento = "5o andar")
               )
)

pedido$cpf     # elemento chamado 'cpf'
pedido[1]      # nova lista com apenas o primeiro elemento
pedido[[2]]    # segundo elemento
pedido["nome"] # nova lista com apenas o elemento chamado 'nome'


#Certamente você se deparará com listas quando for fazer análise de dados com o R. 
#Nos tópicos mais aplicados, iremos aprofundar sobre o tema.
#O pacote purrr contribui com funcionalidades incríveis para listas.


exemplo_lista = list(
  vetor_numerico = c(1,2,3,1,2,3,4,5,3,4,5),
  vetor_textual  = c("Machado de Assis foi um grande escritor brasileiro"),
  banco_de_dados = data.frame(nomes = c("Karina","Joelma","Thiago","Juliano","Janaina"),
                              idades = c(32L,40L,23L,38L,NA),
                              salario = c(2350.99, NA,3700,2010,NA),
                              escolaridade=c("Superior","Medio","Superior","Medio","Medio")
  ),
  matriz = matrix(c(1,2,3,4,5,6),ncol=3,nrow=2)
)
exemplo_lista


# Justamente por essa versatilidade, pelo fato de comportarem simultanemente 
# objetos de diferentes tipo, listas sao muito uteis e frequentemente utilizadas nas mais diversas aplicacoes.
class(exemplo_lista)

# Os componentes de uma lista sao acessados da mesma forma que os componentes de
# um dataframe. 
exemplo_lista[1] # colchetes simples: retorna o "vetor_numerico", que e o primeiro componente da lista. Mas com a classe "list"
class(exemplo_lista[1])

exemplo_lista["vetor_numerico"] # identico ao anterior
class(exemplo_lista["vetor_numerico"])

exemplo_lista[[1]] # com os colchetes duplos, obtemos um objeto com a classe "numeric"
class(exemplo_lista[[1]])

exemplo_lista[["vetor_numerico"]] # identico ao anterior
class(exemplo_lista[["vetor_numerico"]])

exemplo_lista$vetor_numerico # Usando o $ obtemos os mesmos resultados dos colchetes duplos
exemplo_lista$vetor_textual

exemplo_lista$banco_de_dados[2] #podemos fazer selecoes mais precisas
exemplo_lista$banco_de_dados[[2]]
exemplo_lista$banco_de_dados[2,1]

exemplo_lista[[4]]
exemplo_lista[[4]][2,]
exemplo_lista[[4]][2,3]

exemplo_lista$matriz[2,]


#########################################################################################################################33

#Faça o curso básico do Datacamp 

https://campus.datacamp.com/courses/introducao-a-r/capitulo-1-introducao-ao-basico?ex=1



