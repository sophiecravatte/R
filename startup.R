#===========================================================================================
#
#autor : NastyZ98 / version 0.1 / november 2014
#
#===========================================================================================
#Create a new WorkSpace (where .Rhistory files will be save).
setwd("index")

#If a WorkSpace is already configured, you can see where.
getwd()

#Import a new .xls (Excel) or .csv (Excel too) file.
#IMPORTANT : Declare a new variable (used like a data in Environment Tab) 
#(Variables = data ; Arguments = for exemple row name in a data frame ; Function = A function LOL)
#read.table for .xls .dat .txt etc.. files
#read.csv for .csv files
#header=TRUE/FALSE
#sep = separator in the table (ex: 1,3; sep=";")
data <- read.table("index", header=TRUE, sep=";")

#A new variable is available for exemple here it's "data" and "data" contains the table
#You can see the content of the table with this command (just type your variable name)
data

#You can also see the table like a GUI interface with this command
View(data)

#Set a language for the date (FR_fr to EN_en)
Sys.setlocale(category = "LC_TIME", locale="C")

#Set the date format of a table (with a new variable, here "DATE")
#variable <- as.Date(variable$argument, "fonction")
#TIPS : "%d" as day | "%b" or %m" as month | "%Y" as year
#Separator (17-10-98 = "%d-%b-%Y") - (17/10/98 = "%d/%b/%Y") 
DATE <- as.Date(data$DATE, "%d-%b-%Y") 


