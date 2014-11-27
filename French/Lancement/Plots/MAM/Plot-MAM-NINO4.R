#plot NINO4 M/A/M
#Convertion

PLUIE_MAM = INDICE_PLUIE[INDICE_PLUIE$month=="03" | INDICE_PLUIE$month=="04" | INDICE_PLUIE$month=="05",]
f_years = factor(PLUIE_MAM$years)
class(f_years)
tapply(PLUIE_MAM$INDICE, f_years, mean, na.rm=TRUE)
INDICE_ANNUEL_MAM <- tapply(PLUIE_MAM$INDICE, f_years, mean, na.rm=TRUE)

DATE_MAM <- as.Date(PLUIE_MAM$years, "%Y")
DATE_MAM <- as.Date(paste("15", "04",PLUIE_MAM$years, sep="/"), "%d/%m/%Y")

#plot
uni=unique(DATE_MAM)
plot(unique(DATE_MAM), INDICE_ANNUEL_MAM, type="o", main="MAR-AVR-MAI", xlab="ANNEES", ylab="INDICE ANNUEL_MAM")

#Points colorés < %25 MAM (Mars-Avril-Mai)
points(uni[INDICE_ANNUEL_MAM < -0.29], INDICE_ANNUEL_MAM[INDICE_ANNUEL_MAM < -0.29],col="blue",pch=19)

#Filtre
fil3=rep(1/5,5)

#Création d'une nouvelle variable pour filtre (1/5.5) NINO4
nino4_fil=filter(INDICE_NINO$NINO4INDEX/-2,fil3)

#Trace par dessus le plot nino4
lines(DATE_NINO, nino4_fil, type="l", col="red")

#Quantile de MAR-AVR-MAI = -0.2928165
abline(h=-0.2928165, col="green", lwd="3", lty="dotted")
