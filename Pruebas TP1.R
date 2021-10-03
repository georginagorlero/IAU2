
library(tidyverse)
library(janitor)
library(stringr)
library(vroom)
library(lubridate)


recorridos_2019 <- vroom("data/recorridos-realizados-2019.csv")
recorridos_2020 <- vroom("data/recorridos-realizados-2020.csv")

colnames(recorridos_2019)

recorridos_2019_fechas <- recorridos_2019 %>% 
                          mutate(mes=month(recorridos_2019$fecha_origen_recorrido), dia=day(recorridos_2019$fecha_origen_recorrido))

recorridos_2019_jun <- recorridos_2019_fechas %>%
                               filter(mes=="6", dia>14 & dia<=30) %>%
                               select(-mes, -dia, -periodo, -id_usuario, -genero_usuario)

write.csv(recorridos_2019_jun, "data/recorridos_2019_jun15_30.cvs")
  
class(recorridos_2019$fecha_origen_recorrido)

recorridos_2020_fechas <- recorridos_2020 %>% 
                          mutate(mes=month(recorridos_2020$fecha_origen_recorrido),dia=day(recorridos_2020$fecha_origen_recorrido))

recorridos_2020_jun <- recorridos_2020_fechas %>%
                       filter(mes=="6", dia>14 & dia<=30) %>%
                       select(-mes, -dia, -periodo, -id_usuario)
  

write.csv(recorridos_2020_jun, "data/recorridos_2020_jun15_30.cvs")

