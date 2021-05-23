library(openxlsx)
library(scales)
library(readxl)
library(WriteXLS)
library(ggthemes)
library(RColorBrewer)
library(lubridate)
library(caret)
library(tidyverse)
library(here)
library(googlesheets4)
library(DescTools)
library(obAnalytics)
library(collapse)
library(tictoc)
library(directlabels)
library(zoo)
library(kableExtra)
library(vroom)
library(janitor)
library(msrpack)

Sys.setenv(TZ="America/Recife")
options(tz="America/Recife")
Sys.getenv("TZ")
options(scipen = 999999)
Sys.setlocale("LC_TIME", "pt_BR")


# Capitulos ---------------------------------------------------------------

# carregamento
cid_capitulos <- read_delim(file = "data-raw/CID-10-CAPITULOS.CSV", delim = ";",
                        locale = locale(encoding = "Windows-1252")) %>%
  clean_names() %>%
  select(-x6) %>%
  mutate(
    abrev = str_remove(descricao, "(^(.)* - )")
  )



# carregamento
cid_categorias <- read_delim(file = "data-raw/CID-10-CATEGORIAS.CSV", delim = ";",
                            locale = locale(encoding = "Windows-1252")) %>%
  clean_names() %>%
  select(-x7)




## code to prepare `DATASET` dataset goes here

usethis::use_data(cid_capitulos, overwrite = TRUE)
usethis::use_data(cid_categorias, overwrite = TRUE)

