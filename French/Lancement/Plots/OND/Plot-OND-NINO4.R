#plot NINO4 O/N/D
#Convertion

PLUIE_OND = INDICE_PLUIE[INDICE_PLUIE$month=="10" | INDICE_PLUIE$month=="11" | INDICE_PLUIE$month=="12",]
f_years = factor(PLUIE_OND$years)
class(f_years)
tapply(PLUIE_OND$INDICE, f_years, mean, na.rm=TRUE)
INDICE_ANNUEL_OND <- tapply(PLUIE_OND$INDICE, f_years, mean, na.rm=TRUE)

DATE_OND <- as.Date(PLUIE_OND$years, "%Y")
DATE_OND <- as.Date(paste("15", "10",PLUIE_OND$years, sep="/"), "%d/%m/%Y")

#plot
uni=unique(DATE_OND)
plot(unique(DATE_OND), INDICE_ANNUEL_OND, type="o", main="OCT-NOV-DEC", xlab="ANNEES", ylab="INDICE ANNUEL_OND")

#Points colorés < %25 OND (Octobre-Novembre-Decembre)
points(uni[INDICE_ANNUEL_OND < -0.37607220], INDICE_ANNUEL_OND[INDICE_ANNUEL_OND < -0.37607220],col="blue",pch=19)

#Filtre
fil3=rep(1/5,5)

#Création d'une nouvelle variable pour filtre (1/5.5) NINO4
nino4_fil=filter(INDICE_NINO$NINO4INDEX/-2,fil3)

#Trace par dessus le plot nino4
lines(DATE_NINO, nino4_fil, type="l", col="red")


#Quantile de OCT-NOV-DEC = -0.37607220
abline(h=-0.37607220, col="green", lwd="3", lty="dotted")
