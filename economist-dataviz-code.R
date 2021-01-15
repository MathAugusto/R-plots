# PROJETO DE VISUALIZAÇÃO DE DADOS: CORRUPÇÃO NO MUNDO
# A CADA OBJETO DO GGPLOT PL("NUMERO"), É PORQUE ESTOU MELHORARANDO O GRÁFICO! :)
# 'fread' é do pacote data.table
dados <- fread("Economist_Assignment_Data.csv", drop=1)
print(head(dados))

#V1
pl1 <- ggplot(dados,aes(x= CPI, y= HDI, color=Region)) + geom_point(size=4,shape=1)
print(pl1)

#V2
pl2 <- pl1 + geom_smooth(aes(group=1), method = "lm", formula = y~log(x), se=F, color="red")
print(pl2)

#V3
# Subset para selecionar os países que quero que apareçam os nomes no gráfico
pontos_label <- c("Congo", "Brazil", "Iraq", "South Africa", "Sudan", "Greece", "Argentina",
                  "Germany", "China", "France", "Japan", "India", "United States", "Venezuela",
                  "New Zeland", "Singapore", "Rwanda", "Russia", "Bhutan", "Italy")
# Agora faço um filtro dos campos de dados e pontos_labvel em comum / check_overlap para nao ficar texto em cima do outro
pl3 <- pl2 + geom_text(aes(label=Country), color="gray20",
                       data=subset(dados, Country %in% pontos_label),check_overlap = TRUE)
print(pl3)

#V4
pl4 <- pl3 + scale_x_continuous(limits=c(.9, 10.5), breaks = 1:10)
# add tema da library ggtheme
print(pl4 + theme_economist_white())