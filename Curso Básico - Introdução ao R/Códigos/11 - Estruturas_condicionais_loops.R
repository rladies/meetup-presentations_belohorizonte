
############################ Introdução ao R ##################################

# Autora: Ana Carolina Fernandes Dias
# Linkedin: https://www.linkedin.com/in/ana-carolinadias/

##########################################################################################

##########################################################################################
                    # Estrutura de repetição For em R
##########################################################################################

# A estrutura de repetição for permite criar loops para casos onde
# sabemos de antemão o número de repetições que devem ser realizadas.

# Primeiro, vamos imprimir na tela os números de 1 a 5.
for(i in 1:5){ # para i assumindo cada um dos 5 valores em seq
  print(i)
}

#--------------------------------------------------------------------------------------------------------------

# Agora, vamos imprimir na tela as 5 primeiras letras do alfabeto 
# (o R já vem com um vetor com as letras do alfabeto: letters).

for(i in 1:5){
  print(letters[i])
}

#--------------------------------------------------------------------------------------------------------------
# No mesmo exemplo, acima, ao invés correr o loop no índice de inteiros 1:5, 
# vamos iterar diretamente sobre os primeiros 5 elementos do vetor letters:

for(letra in LETTERS[1:5]){
  print(letra)
}

LETTERS[1:5]

#--------------------------------------------------------------------------------------------------------------
#Agora vamos usar o for para elevar i valores ao quadrado:
  
resu<- NULL

for(i in 1:5){
   resu[i]<-i^2     

} # Fim do for (i)

resu ## Para ver os resultados

#--------------------------------------------------------

#SEQ_ALONG
# Uma função bastante útil ao fazer loops é a função seg_along(). 
# Ela cria um vetor de inteiros com índices para acompanhar o objeto.


x <- sample(1:100,10)
x

seq_along(x)

x = c(20,15,45,9,8,5)
seq_along(x)

x = c('a','b', 'c', 'd')
seq_along(x)


# Também é possível criar um vetor de inteiros do tamanho do objeto fazendo uma sequência de 1 até length(x):

1:length(x)  
  
# Entretanto, a vantagem de seq_along() é que quando o vetor é vazio, 
#ela retorna um vetor vazio e, deste modo, o loop não é executado (o que é o comportamento correto).

#Já a sequência 1:length(x) retorna a sequência 1:0, 
#isto é, uma sequência decrescente de 1 até 0, e loop é executado nestes valores.

# cria vetor vazio
x <- NULL

# note que o loop é executado (o que é errado)
for(i in 1:length(x)){
  print(i)
}

## [1] 1
## [1] 0

# seq_along
# note que o loop não é executado (o que é correto)

for(i in seq_along(x)) {
  print(i)
}

#--------------------------------------------------------

seq = 1:10

#para i assumindo cada um dos 10 valores em seq

for(i in seq) {
  #imprima na tela uma expressão
  print(paste("Este é o valor de i=",i))
}

#agora adicionamos uma condicional
for(i in seq) {
  #se o valor de i for o último de seq, imprima uma coisa, se for menor, imprima outra na tela
  
  if (i==seq[length(seq)]) {
    print(paste("Este é o ULTIMO valor de i, que é =",i))
  } 
  else {
    print(paste("Este é o valor de i=",i))
  }
}


#--------------------------------------------------------

# Como vimos, o R é vetorizado, ou seja , voce consegue aplicar funções e operações em um vetor 
# de forma direta. Muitas vezes, quando você pensar que precisa usar um loop, 
# ao pensar melhor, descobrirá que não precisa. 
# Em geral é possível resolver o problema de maneira vetorizada e usando funções nativas do R.

# Para quem está aprendendo a programar diretamente com o R, 

# Suponha que você queira dividir os valores de um vetor x por 10. 
# Se o R não fosse vetorizado, você teria que fazer algo como:

# criando vetor de exemplo
x <- 10:20

# divide cada elemento por 10
for(i in seq_along(x)) 
  x[i] <- x[i]/10

# resultado
x


# Mas o R é vetorizado e, portanto, este é o tipo de loop que não faz sentido na linguagem. 
# É muito mais rápido e fácil de enteder escrever simplesmente x/10.

# recriando vetor de exemplo
x <- 10:20

# divide cada elemento por 10
x <- x/10

#--------------------------------------------------------

# Em algumas situações loops são inevitáveis e podem inclusive ser mais fáceis de ler e de entender.
# O ponto aqui é apenas lembrá-lo de explorar a vetorização do R.


a <- 1:10
b <- 1:10

res <- rep(0, length(a))

for (i in seq_along(a)) {
  res[i] <- a[i] + b[i]
}
res

res2 <- a + b
all.equal(res, res2)


#--------------------------------------------------------

# Antes de continuar, vamos fazer uma espécie de "filminho" mostrando o que o for faz:
#  Primeiro vamos fazer um gráfico com limites xlim =0:10 e ylim=0:10.

plot(0:10,0:10, type="n")

# Agora vamos usar o for para inserir textos no gráfico a cada passo do for:

for(i in 1:9){
 text(i,i, paste("Passo", i))
}

# O R fez tudo muito rápido, de forma que não conseguimos ver os passos que ele deu. Vamos fazer
# novamente, mas agora inserindo uma função que retarde o R em 1 segundo. Ou seja, cada passo irá
# demorar 1 segundo.

plot(0:10,0:10, type="n")

for(i in 1:9){
  text(i,i, paste("Passo", i))
 Sys.sleep(1) ## retarda os passos em 1 segundo
 }

# Entendeu o que está sendo feito? No primeiro passo do for, o i é igual a 1, portanto apareceu o texto
# "passo 1" na coordenada x=1, y=1 do gráfico. No segundo passo o i é igual a 2 e aparece o texto "passo 2"
# na coordenada x=2, y=2, e assim por diante.
# O for é um comando bastante utilizado em diversas funções e na simulação de dados. 


#--------------------------------------------------------

# A seqüência de Fibonacci é uma seqüência famosa na matemática (Braun & Murdoch 2007). Os dois
# primeiros números da seqüência são [1, 1]. Os números subseqüentes são compostos pela soma dos dois
# números anteriores. Assim, o terceiro número da seqüência de Fibonacci é 1+1=2, o quarto é 1+2=3, e  
# assim por diante. Vamos usar a função for para descobrir os 12 primeiros números da seqüência de
# Fibonacci.

Fibonacci<- NULL

Fibonacci[c(1,2)]<-1 # o 1° e 2° valores da seqüência devem ser = 1
Fibonacci

for (i in 3:12){ # 3 a 12 porque já temos os dois primeiros números [1,1]
  Fibonacci[i]<-Fibonacci[i-2]+Fibonacci[i-1]
}
#-----------------------------------------------------------------------------------------------------

# Usando o comando for mais de uma vez 

for(i in 1:5)
{
  for(j in 1:2) # Para cada i, ele roda todos os valores de j
  {
    print(i*j);
  }
}

#vamos colocar um loop dentro de outro loop
#uma pequena matriz

mm = matrix(1:9,nrow=3,ncol=3)
mm

for(i in 1:ncol(mm)) { #para cada coluna de mm
  for(j in 1:nrow(mm)) { #para cada linha de mm
    print(paste("O valor da célula da coluna ",i,"e da linha",j,"é = ",mm[i,j])) 
  }
}


##########################################################################################
# Estrutura de repetição WHILE  em R
##########################################################################################

# o que o While faz é repetir o código entre as chaves enquanto uma determinada condição é verdadeira.
# Ele testa a condição antes de executar o corpo do loop.

x <- 1

while(x < 5) {
  
  x <- x+1
  
  print(x)
  
}


i <- 1
while (i <=6) {
  print(i*i)
  i = i+1
}


começa <- 1

#Create the loop
while (começa <= 10){
  
  #See which we are  
  print('Este é o passo do loop',começa)
  
  #adicione o valor 1 ao valor da variavel a cada passo do loop
  começa <- começa+1
  print(começa)
}

# ---------------------------------------------------------------------------------------------------------

total = 0
number <- as.numeric(readline(prompt="Entre com um valor menor do que 10 :  "))

while (number <= 10)  {
  total = total + number
  number = number + 1
}

print(paste("O número total de iterações no codigo while, foi de:  ", total))


# Loop While infinito 

number <- 1

while (number < 10)  {
  print(paste("Number from the While Loop is:  ", number))  #o loop nao acaba nunca 
}

while (number < 10)  {
  print(paste("Number from the While Loop is:  ", number))  # jeito certo
  number = number + 1  #garantido que o loop vai acabar em algum momento
}

##########################################################################################

# O que utilizar? For ou While ? 

#sendo i um valor numerico ele pode ser um índice, numa construção um pouco diferente

LETTERS[1:10] #este vetor é o vetor de letras maiúsculas, uma constante do R

#vamos iterar por todas as letras

for(letra in 1:length(LETTERS)) {
  aletra = LETTERS[letra]
  print(paste("a letra",aletra,"tem posição",letra,"no vetor LETTERS"))
}

#a mesma coisa acima pode ser feita com while
var= 1 #valor inicial

while( var<= length(LETTERS)) { #enquanto var for menor ou igual ao comprimento do vetor LETTERS, faça alguma coisa
  aletra = LETTERS[var]
  print(paste("a letra",aletra,"tem posição",var,"no vetor LETTERS"))
  var = var+1 #faz o incremento manualmente
}



##########################################################################################
# Estrutura de repetição repeat  em R
##########################################################################################

# O comando repeat, repetirá o código sem condições. Com isso, 
# precisamos de mais uma função para mostrar ao programa quando deve parar de repetir o código. 
# A função que faz isso é break (). 

sum <- 0
repeat{
  sum = sum+1
  print(sum)
  if (sum == 6){
    print("repeat loop ends");
    break
  }
}


# Note que com o repeat, além de termos que ir aumentando o valor da variável manualmente,
# também precisamos especificar qual a condição para que o loop pare de ser realizado. 
# Assim como quando usamos while (), aqui também precisamos declarar a variável antes.


v <- c("Olá","Loop")
cnt <- 2

repeat {
  print(v)
  cnt <- cnt+1
  
  if(cnt > 5) {
    break
  }
}


# Loop repeat infinito 

total <- 0
number <- as.integer(readline(prompt="Please Enter any integer Value:  "))

repeat  {
  total = total + number
  number = number + 1
  print(number)
}


##########################################################################################

# While ou repeat ? 
i <- 0

repeat {
  if (i==2)
    break
  print(i)
  i<-i+1
}


i <- 0
while (i!=2) 
{
  print(i)
  i<-i+1
  }

##########################################################################################
# Estrutura de repetição repeat  em R
##########################################################################################

#Quebrando os loops com o Break 


# Quando o intérprete R encontrar uma quebra, ele passará o controle para a instrução 
# imediatamente após o término do loop (se houver). No caso de loops aninhados,
# o breakcomando permitirá sair apenas do loop mais interno.

#Neste exemplo, iteramos o vetor x, que tem números consecutivos de 1 a 5.
# Dentro do loop for, usamos uma condição if para quebrar (parar) se o valor atual for igual a 3.
# Como podemos ver na saída, o loop termina quando encontra a break na instrução.

x <- 1:5
for (val in x) {
  if (val == 3){
    break
  }
  print(val)
}


i <- 0

#------------------------
repeat {
  if (i==2)
    break
  print(i)
  i<-i+1
}

#------------------------

for (i in c(1,2,3,4)){
  for (j in c(7,8,9)){
    if (i==3){
      break
    }
    
    print(i)
    print(j)

  }
}

###################################################################################################################3 


# Pulando para o proximo ciclo com next


x <- 1:5
for (val in x) {
  if (val == 3){
    next
  }
  print(val)
}


# No exemplo acima, usamos a nextinstrução dentro de uma condição 
# para verificar se o valor é igual a 3.
# 
# Se o valor for igual a 3, a avaliação atual será interrompida (o valor não será impresso), 
# mas o loop continuará com a próxima iteração.

#----------------------------------------


v <- LETTERS[1:6]
for ( i in v) {
  
  if (i == "D") {
    next
  }
  print(i)
}

#----------------------------------------

m=20

for (k in 1:m){
  if (!k %% 2)
    next
  print(k)
}

# Este pedaço de código imprime todos os números ímpares dentro do intervalo 
# Em outras palavras, todos os inteiros, exceto aqueles com resto não zero quando divididos 
# por 2(assim, o uso do operando de módulo %%), conforme especificado pelo teste if, serão impressos.

#----------------------------------------


# Usando loop, if, else, next e break 
valor = c(109.49 , 109.90 , NA , NA , 109.11 , 109.95 , 118.03 , 112.12 , 113.95)


# Next se for NA. Break se  maior que 117.
for (value in valor) {
  if(is.na(value)) {
    print("Pulando o NA")
    next
  }
  
  if(value > 117) {
    print("Hora de vender sua ação!")
    print(paste('Valor igual a :',value))
    break
  } else { 
    print("Nada para fazer por aqui !")
  }
}


# Faça esse curso do DataCamp gratuito para entender mais sobre loops
# https://www.datacamp.com/community/tutorials/tutorial-on-loops-in-r

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
