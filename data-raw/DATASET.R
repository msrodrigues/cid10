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
  ) %>%
  rename(
    capitulo = numcap,
    cat_ini = catinic,
    cat_fim = catfim
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
  select(-x5) %>%
  rename(
    cat_ini = catinic,
    cat_fim = catfim
  )



# Subcategorias -----------------------------------------------------------


# carregamento
cid_subcat_raw <- read_delim(file = "data-raw/CID-10-SUBCATEGORIAS.CSV", delim = ";",
                         locale = locale(encoding = "Windows-1252")) %>%
  clean_names() %>%
  select(-x9) %>%
  mutate(
    subcat_ord = fct_inorder(subcat, ordered = TRUE),
    indice = 1:nrow(.)
  ) %>%
  rename(
    cid = subcat,
    cid_ord = subcat_ord
  )



cat_ini <- cid_capitulos %>%
  pull(cat_ini)

cat_fim <- cid_capitulos %>%
  pull(cat_fim)

lista_cids_cap <- map2(cat_ini, cat_fim, ~ cid_range(.x, .y, cid = TRUE))

names(lista_cids_cap) <- map_chr(seq(1:22), ~ glue::glue("{.x}"))


cid_cap <- stack(lista_cids_cap) %>%
  rename("cid" = values, "cap" = ind)


cid_subcat <- left_join(cid_subcat_raw, cid_cap, by = c("cid" )) %>%
  mutate(capitulo = as.numeric(as.character(cap)))


# Função cid_range --------------------------------------------------------

cid_range <- function(cat_inic, cat_final = NA, cid = FALSE)
{

  if(is.na(cat_final)) {
    cat_final = cat_inic
  }

  cat_sup = toupper(cat_inic)
  cat_inf = toupper(cat_final)


  if(cat_sup > cat_inf) {
    aux = cat_sup
    cat_sup = cat_inf
    cat_inf = aux
  }

  indice_sup <- cid_subcat %>%
    filter(grepl(cat_sup, cid)) %>%
    pull(indice) %>% min

  indice_inf <- cid_subcat %>%
    filter(grepl(cat_inf, cid)) %>%
    pull(indice) %>% max

  if(cid) {
    return(cid_subcat %>%
             slice(indice_sup:indice_inf) %>%
             pull(cid)
    )
  }

  cid_subcat %>%
    slice(indice_sup:indice_inf)

}



# Cids Atenção Primária ---------------------------------------------------

cid_aps <- c(cid_range("A37", cid = TRUE),
  cid_range("A36", cid = TRUE),
  cid_range(cat_inic = "A33", cat_final = "A35", cid = TRUE),
  cid_range("B26", cid = TRUE),
  cid_range("B06", cid = TRUE),
  cid_range("B05", cid = TRUE),
  cid_range("A95", cid = TRUE),
  cid_range("B16", cid = TRUE),
  cid_range("G000", cid = TRUE),
  cid_range("A170", cid = TRUE),
  cid_range("A19", cid = TRUE),
  cid_range("A150", "A153", cid = TRUE),
  cid_range("A160", "A162", cid = TRUE),
  cid_range("A154", "A159", cid = TRUE),
  cid_range("A163", "A169", cid = TRUE),
  cid_range("A171", "A179", cid = TRUE),
  cid_range("A18", cid = TRUE),
  cid_range("I00", "I02", cid = TRUE),
  cid_range("A51", "A53", cid = TRUE),
  cid_range("B50", "B54", cid = TRUE),
  cid_range("B77", cid = TRUE),
  cid_range("E86", cid = TRUE),
  cid_range("A00", "A09", cid = TRUE),
  cid_range("D50", cid = TRUE),
  cid_range("E40", "E46", cid = TRUE),
  cid_range("E50", "E64", cid = TRUE),
  cid_range("H66", cid = TRUE),
  cid_range("J00", cid = TRUE),
  cid_range("J01", cid = TRUE),
  cid_range("J02", cid = TRUE),
  cid_range("J03", cid = TRUE),
  cid_range("J06", cid = TRUE),
  cid_range("J31", cid = TRUE),
  cid_range("J13", cid = TRUE),
  cid_range("J14", cid = TRUE),
  cid_range("J153", "J154", cid = TRUE),
  cid_range("J158", "J159", cid = TRUE),
  cid_range("J181", cid = TRUE),
  cid_range("J45", "J46", cid = TRUE),
  cid_range("J20", "J21", cid = TRUE),
  cid_range("J40",  "J44" , cid = TRUE),
  cid_range("J47", cid = TRUE),
  cid_range("I10", "I11", cid = TRUE),
  cid_range("I20",  cid = TRUE),
  cid_range("I50", cid = TRUE),
  cid_range("J81", cid = TRUE),
  cid_range("I63", "I67", cid = TRUE),
  cid_range("I69", cid = TRUE),
  cid_range("g45", "g46", cid = TRUE),
  cid_range("e100", "e101", cid = TRUE),
  cid_range("e110", "e111", cid = TRUE),
  cid_range("e112", "e121", cid = TRUE),
  cid_range("e130", "e131", cid = TRUE),
  cid_range("e140", "e141", cid = TRUE),
  cid_range("e102", "e108", cid = TRUE),
  cid_range("e112", "e118", cid = TRUE),
  cid_range("e122", "e128", cid = TRUE),
  cid_range("e132", "e138", cid = TRUE),
  cid_range("e142", "e148", cid = TRUE),
  cid_range("e109",  cid = TRUE),
  cid_range("e119",  cid = TRUE),
  cid_range("e129",  cid = TRUE),
  cid_range("e139",  cid = TRUE),
  cid_range("e149",  cid = TRUE),
  cid_range("g40",  cid = TRUE),
  cid_range("g41",  cid = TRUE),
  cid_range("n10", "n12",  cid = TRUE),
  cid_range("n30",  cid = TRUE),
  cid_range("n34",  cid = TRUE),
  cid_range("n390",  cid = TRUE),
  cid_range("a46",  cid = TRUE),
  cid_range("l01", "l04",  cid = TRUE),
  cid_range("l08",  cid = TRUE),
  cid_range("n70", "n73",  cid = TRUE),
  cid_range("n75", "n76",  cid = TRUE),
  cid_range("k25", "k28",  cid = TRUE),
  cid_range("k920", "k922",  cid = TRUE),
  cid_range("o23",  cid = TRUE),
  cid_range("a50",  cid = TRUE),
  cid_range("p350",  cid = TRUE)
) %>% unique %>% sort

cid_tabela_aps <- cid_subcat %>%
  filter(cid %in% cid_aps)


## code to prepare `DATASET` dataset goes here

usethis::use_data(cid_capitulos, overwrite = TRUE)
usethis::use_data(cid_categorias, overwrite = TRUE)
usethis::use_data(cid_grupos, overwrite = TRUE)
usethis::use_data(cid_subcat, overwrite = TRUE)
usethis::use_data(cid_aps, overwrite = TRUE)
usethis::use_data(cid_tabela_aps, overwrite = TRUE)
usethis::use_data(cid_aps, overwrite = TRUE)

