############### Jermy's Simple Script for making correlation matrices ########################
### Written on 3/9/2020 



# ++++++++++++++++++++++++++++
# flattenCorrMatrix
# ++++++++++++++++++++++++++++
# cormat : matrix of the correlation coefficients
# pmat : matrix of the correlation p-values
flattenCorrMatrix <- function(cormat, pmat) {
     ut <- upper.tri(cormat)
     data.frame(
          row = rownames(cormat)[row(cormat)[ut]],
          column = rownames(cormat)[col(cormat)[ut]],
          cor  =(cormat)[ut],
          p = pmat[ut]
     )
}

# > detach("package:here", unload=TRUE)
# > library("here")
library(data.table)
library(Hmisc)
library(corrplot)
library(ggplot2)
library(tidyverse)


# setup start date and time

my_data <- read.csv("All.csv")
     
list_of_subjects <- unique(my_data$Subject)

my_data <- read.csv("All.csv")    


head(my_data, 6)

my_data <- my_data[, c( "Clo",
                        "General.Sensation", 
                        "HR", 
                        "MRT", 
                        "RH", 
                        "Temp.1", 
                        "V_a_110", 
                        "V_a_50")]
names(my_data)[names(my_data)=="General.Sensation"] <- "Thermal Sensation"
names(my_data)[names(my_data)=="Temp.1"] <- "Temperature"

# my_data %>% 
#         rename("Clo",
#         "General.Sensation" = "Thermal Sensation", 
#         "HR", 
#         "MRT", 
#         "RH", 
#         "T_db_110", 
#         "T_db_50", 
#         "V_a_110", 
#         "V_a_50"
#         )

head(my_data, 6)

res <- cor(my_data, use = "complete.obs")

round(res, 2)

res2 <- rcorr(as.matrix(my_data))

flattenCorrMatrix(res2$r, res2$P)

Picture_name = paste("Corr_", 
                     ".png", 
                     sep = "", 
                     collapse = NULL)

Title_name = paste("Variable correlations for person: ", 
                   person, 
                   sep = "", 
                   collapse = NULL)

png(filename=Picture_name, 
    width = 960, 
    height = 960,
    pointsize = 18, 
    bg = "white",)

corrplot(res2$r, 
         type="upper", 
         order="alphabet", 
         main=Title_name, 
         method = "number", 
         tl.col = "black", 
         tl.srt = 45, 
         p.mat = res2$P, 
         sig.level = 0.1, 
         insig = "pch")

dev.off()


for (person in list_of_subjects){

     my_data <- read.csv("All.csv")    
     
          
     my_data = my_data[my_data$Subject == person,]
     
     head(my_data, 6)
     
     my_data <- my_data[, c( "Clo",
                             "General.Sensation", 
                             "HR", 
                             "MRT", 
                             "RH", 
                             "Temp.1", 
                             "V_a_110", 
                             "V_a_50")]
     names(my_data)[names(my_data)=="General.Sensation"] <- "Thermal Sensation"
     names(my_data)[names(my_data)=="Temp.1"] <- "Temperature"
     
        # my_data %>% 
        #         rename("Clo",
        #         "General.Sensation" = "Thermal Sensation", 
        #         "HR", 
        #         "MRT", 
        #         "RH", 
        #         "T_db_110", 
        #         "T_db_50", 
        #         "V_a_110", 
        #         "V_a_50"
        #         )

     head(my_data, 6)
     
     res <- cor(my_data, use = "complete.obs")
     
     round(res, 2)
     
     res2 <- rcorr(as.matrix(my_data))
     
     flattenCorrMatrix(res2$r, res2$P)
     
     Picture_name = paste("Corr_", 
                          person ,
                          ".png", 
                          sep = "", 
                          collapse = NULL)
     
     Title_name = paste("Variable correlations for person: ", 
                        person, 
                        sep = "", 
                        collapse = NULL)
     
     png(filename=Picture_name, 
         width = 960, 
         height = 960,
         pointsize = 18, 
         bg = "white",)
     
     corrplot(res2$r, 
              type="upper", 
              order="alphabet", 
              main=Title_name, 
              method = "number", 
              tl.col = "black", 
              tl.srt = 45, 
              p.mat = res2$P, 
              sig.level = 0.1, 
              insig = "pch")
     
     dev.off()
     
     # scatter_name = paste("Scatter_", 
     #                      person ,
     #                      ".png", 
     #                      sep = "", 
     #                      collapse = NULL)
     # 
     # png(filename=scatter_name, 
     #     width = 960, 
     #     height = 960,
     #     pointsize = 18, 
     #     bg = "white",)
     # 
     # labelnames = colnames(res2$r)
     # 
     # 
     # correlations <- res2$r[,"General.Sensation"]
     # 
     # 
     # 
     # # plot(correlations,
     # #      xaxt="n",
     # #      ylim=c(-1,1),
     # #      pch=19) +
     # #      theme_ipsum()
     # 
     # axis(1, at = 1:9, labels = labelnames)
     # 
     # dev.off()

}

