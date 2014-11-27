#plot NINO3P4 J/F/M
#Convertion

PLUIE_JFM = INDICE_PLUIE[INDICE_PLUIE$month=="01" | INDICE_PLUIE$month=="02" | INDICE_PLUIE$month=="03",]
f_years = factor(PLUIE_JFM$years)
class(f_years)
tapply(PLUIE_JFM$INDICE, f_years, mean, na.rm=TRUE)
INDICE_ANNUEL_JFM <- tapply(PLUIE_JFM$INDICE, f_years, mean, na.rm=TRUE)

DATE_JFM <- as.Date(PLUIE_MAM$years, "%Y")
DATE_JFM <- as.Date(paste("15", "02",PLUIE_JFM$years, sep="/"), "%d/%m/%Y")

#plots
#Plot JFM (Janvier-Fevrier-Mars)
uni=unique(DATE_JFM)
plot(unique(DATE_JFM), INDICE_ANNUEL, type="o", main="JAN-FEV-MAR", xlab="ANNEES", ylab="INDICE ANNUEL")

#Points colorés < %25 JFM (Janvier-Fevrier-Mars)
points(uni[INDICE_ANNUEL < -0.4], INDICE_ANNUEL[INDICE_ANNUEL < -0.4],col="blue",pch=19)

#Filtre
fil3=rep(1/5,5)

#Création d'une nouvelle variable pour filtre (1/5.5) NINO4
nino4_fil=filter(INDICE_NINO$NINO3P4/-2,fil3)

#Trace par dessus le plot nino3P4
lines(DATE_NINO, nino3P4_fil, type="l", col="red")

#Trace une ligne horizontal 
#Quantile de JAN-FEV-MAR = -0.4019309
abline(h=-0.4019309, col="green", lwd="3", lty="dotted")

#TEMPLATE NINO4
