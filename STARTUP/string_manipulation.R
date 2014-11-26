#===========================================================================================
#
#autor : NastyZ98 / version 0.1 / november 2014
#
#===========================================================================================

#Convertion avec paste
variable <- paste("15", as.character(data$valeur), as.character(data$valeur), sep="/")

#Convertion type "character" vers "Date"
new_variable <- as.Date(variable, "%d/%m/%Y")

#Vérification du type
class(new_variable)