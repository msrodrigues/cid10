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



# Categorias --------------------------------------------------------------


# carregamento
cid_categorias <- read_delim(file = "data-raw/CID-10-CATEGORIAS.CSV", delim = ";",
                            locale = locale(encoding = "Windows-1252")) %>%
  clean_names() %>%
  select(-x7)



# Grupos ------------------------------------------------------------------

# carregamento
cid_grupos <- read_delim(file = "data-raw/CID-10-GRUPOS.CSV", delim = ";",
                             locale = locale(encoding = "Windows-1252")) %>%
  clean_names() %>%
  select(-x5)



# Subcategorias -----------------------------------------------------------


# carregamento
cid_subcat <- read_delim(file = "data-raw/CID-10-SUBCATEGORIAS.CSV", delim = ";",
                         locale = locale(encoding = "Windows-1252")) %>%
  clean_names() %>%
  select(-x9) %>%
  mutate(
    subcat_ord = fct_inorder(subcat, ordered = TRUE),
    indice = 1:nrow(.)
  )



# Função cid_range --------------------------------------------------------

cid_range <- function(cat_sup, cat_inf) {

  indice_sup <- cid_subcat %>%
    filter(grepl(cat_sup, subcat)) %>%
    pull(indice) %>% min

  indice_inf <- cid_subcat %>%
    filter(grepl(cat_inf, subcat)) %>%
    pull(indice) %>% max

  if(indice_sup > indice_inf) {
    return("Categoria superior é menor que a inferior")
  }
  cid_subcat %>%
    slice(indice_sup:indice_inf)

}


## code to prepare `DATASET` dataset goes here

usethis::use_data(cid_capitulos, overwrite = TRUE)
usethis::use_data(cid_categorias, overwrite = TRUE)
usethis::use_data(cid_grupos, overwrite = TRUE)
usethis::use_data(cid_subcat, overwrite = TRUE)

