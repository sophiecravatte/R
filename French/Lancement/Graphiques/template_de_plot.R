#===========================================================================================
#
#autor : NastyZ98 / version 0.1 / november 2014
#Création de plot particulier sur l'étude d'El niño 
#
#===========================================================================================

#Création plot (NINO+LINES INDICE_PLUIE)
plot(DATE_NINO, INDICE_NINO$NINO4INDEX, type="l", main="INDICE PLUIE", xlab="ANNÉES", ylab="ANOMALIES")

#========================================================================

#Ploter par dessus le plot principal en rouge (col="red")
lines(INDICE_PLUIE$DATE, INDICE_PLUIE$INDICE, type="l", col="red")

#========================================================================

#Ploter uniquement une valeur du tableau
plot(unique(PLUIE_JFM$years), INDICE_ANNUEL, type="l")

#========================================================================

#Plot JFM (Janvier-Février-Mars)
plot(unique(DATE_JFM), INDICE_ANNUEL, type="o", main="JAN-FEV-MAR", xlab="ANNÉES", ylab="INDICE ANNUEL")

#========================================================================

#Plot MAM (Mars-Avril-Mai)
plot(unique(DATE_MAM), INDICE_ANNUEL_MAM, type="o", main="MAR-AVR-MAI", xlab="ANNÉES", ylab="INDICE ANNUEL_MAM")

#Plot OND(Octobre-Novembre-Decembre)
plot(unique(DATE_OND), INDICE_ANNUEL_OND, type="o", main="OCT-NOV-DEC", xlab="ANNÉES", ylab="INDICE ANNUEL_MAM")

#========================================================================
#
#========================================================================

#Points colorés < %25 JFM (Janvier-Février-Mars)
points(uni[INDICE_ANNUEL < -0.4], INDICE_ANNUEL[INDICE_ANNUEL < -0.4],col="blue",pch=19)

#========================================================================

#Points colorés < %25 MAM (Mars-Avril-Mai)
points(uni[INDICE_ANNUEL_MAM < -0.29], INDICE_ANNUEL_MAM[INDICE_ANNUEL_MAM < -0.29],col="blue",pch=19)

#========================================================================

#Points colorés < %25 OND (Octobre-Novembre-Decembre)
points(uni[INDICE_ANNUEL_OND < -0.37607220], INDICE_ANNUEL_OND[INDICE_ANNUEL_OND < -0.37607220],col="blue",pch=19)

#========================================================================
#
#========================================================================

#Filtre
fil3=rep(1/5,5)

#========================================================================

#Création d'une nouvelle variable pour filtre (1/5.5) NINO4
nino4_fil=filter(INDICE_NINO$NINO4INDEX/-2,fil3)

#========================================================================

#Création d'une nouvelle variable pour filtre (1/5.5) NINO3INDEX
nino3_fil=filter(INDICE_NINO$NINO3INDEX/-2,fil3)

#========================================================================

#Création d'une nouvelle variable pour filtre (1/5.5) NINO3P4
nino3P4_fil=filter(INDICE_NINO$NINO3P4/-2,fil3)

#========================================================================

#Trace par dessus le plot nino4
lines(DATE_NINO, nino4_fil, type="l", col="red")

#Trace par dessus le plot nino3index
lines(DATE_NINO, nino3_fil, type="l", col="red")

#Trace par dessus le plot nino3P4
lines(DATE_NINO, nino3P4_fil, type="l", col="red")

#Trace une ligne horizontal 
#Quantile de JAN-FEV-MAR = -0.4019309
abline(h=-0.4019309, col="green", lwd="3", lty="dotted")
#Quantile de MAR-AVR-MAI = -0.2928165
abline(h=-0.2928165, col="green", lwd="3", lty="dotted")
#Quantile de OCT-NOV-DEC = -0.37607220
abline(h=-0.37607220, col="green", lwd="3", lty="dotted")

