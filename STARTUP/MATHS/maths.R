#===========================================================================================
#
#autor : NastyZ98 / version 0.1 / november 2014
#
#===========================================================================================

#Calcul des anomalies mensuelles réduites
#pluie <- read.csv(file="../STAGE_IRD/Données/pluies_mensuelles_1961-2014.csv", header=TRUE, sep=";", dec=",")
data <- read.csv(file="index", header=TRUE, sep=";", dec=",")

#Calcul d'un indice mensuel selon les stations et les précipitations 
#============================Code original : =========================================
#| MEAN=ave(values$VALEUR,factor(values$NOM),factor(values$MOIS),FUN=mean,na.rm=TRUE)|
#| STD=ave(values$VALEUR,factor(values$NOM),factor(values$MOIS),FUN=sd,na.rm=TRUE)   |
#| ANOMALIE=(tx$VALEUR-MEAN)/STD                                                     |
#| tx=cbind(tx,ANOMALIE)                                                             |
#| rm(ANOMALIE,MEAN,STD)                                                             |
#=====================================================================================

#Création des fonctions mean_na et sd_na
mean_na=function(x) {mean(x, na.rm=TRUE)}
sd_na=function(x) {sd(x,na.rm=TRUE)}

#Calcul dans le cadre des précipitations mensuels (données météo fr ©)
MEAN=ave(SELECT_STATION$RRE,factor(SELECT_STATION$NOM),factor(SELECT_STATION$MOIS),FUN=mean_na,na.rm=TRUE)
STD=ave(SELECT_STATION$RRE,factor(SELECT_STATION$NOM),factor(SELECT_STATION$MOIS),FUN=sd_na,na.rm=TRUE)
ANOMALIE=(SELECT_STATION$RRE-MEAN)/STD
PLUIE_ANOMALIE=cbind(SELECT_STATION,ANOMALIE)
rm(ANOMALIE,MEAN,STD)

#Création du plot
#plot(PLUIE_RSLT$JMA_FINAL[which(PLUIE_RSLT$NOM=="NOUMEA")], PLUIE_RSLT$ANOMALIE[which(PLUIE_RSLT$NOM=="NOUMEA")], type="l", xlab="YEARS", ylab="ANOMALIE")
plot(data$valeur[which(data$valeur=="valeur")], data$valeur[which(data$valeur=="valeur")], type="l", xlab="x title", ylab="y title")

#Calcul du quantile
#quantile(PLUIE_RSLT$ANOMALIE, na.rm=TRUE)
quantile(data$valeur, na.rm=TRUE)

#tapply
f_nom = factor(data)
tapply(data$valeur, f_nom, function, na.rm=TRUE/FALSE)
