
############################ Introdução ao R ##################################

# Autora: Ana Carolina Fernandes Dias
# Linkedin: https://www.linkedin.com/in/ana-carolinadias/

##########################################################################################

##########################################################################################
# CONHECENDO PACOTES DO R
##########################################################################################

# Até aqui utilizamos o que chamamos de Base R, ou seja, sintaxe e funções básicas do R usando 
# apenas os pacotes padrões e pré-carregados. Ao digitar ?sum() no console, por exemplo, 
# podemos ver que se trata de uma função do pacote {base}.

?sum()

getOption("defaultPackages") #pacotes carregados por padrão no R

library() # pacotes disponíveis em sua biblioteca

(.packages()) # Para visualizar os pacotes carregados


##########################################################################################
# Instalando PACOTES DO R
##########################################################################################

# É necessário instalar pacotes no computador, apenas uma vez. 

install.packages("plotly") # O pacote plotly serve para criar gráficos interativos. 

# Entre nesse link (https://plot.ly/r/) para ver alguns dos graficos que voce pode fazer

# Não basta apenas instalar um pacote. Para usá-lo é necessário "carregar" o pacote sempre que você abrir
# o R e for usá-lo. 

library(plotly) #Carregando o pacote 

# O carregamento de um pacote também pode ser feito através da função require()!

require(plotly) #Carregando o pacote  

(.packages()) # Utilize o comando para constatar que o pacote está carregado!
  
  
#Como citar o R, ou um pacote do R em publicações
#No R existe um comando que mostra como citar o R ou um de seus pacotes. Veja como fazer:

citation() # Mostra como citar o R

citation("plotly")


p <- plot_ly(midwest, x = ~percollege, color = ~state, type = "box")
p

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
