#' Função cid_range
#'
#' Captura um range de CIDs, retornando uma tabela (data frame)
#'
#' Argumentos:
#'
#' cat_inicial: subcategoria do cid, em formato texto. Aceita receber como somente 1 letra,
#' uma letra e um número, ou 2 ou 3 números.
#' Exemplo: "A1" irá capturar todos os CIDS que começem por A1 (A1 até A199, se existirem)
#'
#' cat_inf: a categoria que ira ser o final do range, no mesmo formato que a anterior.
#'
#' Essa função pressupõe uma ordem nos CIDs, de A a Z e ordenada conforme os números,
#' na mesma ordem da lista global de cids. A cat_inicial deve preceder a cat_final
#'
#' Exemplo:
#' cid_range("A104", "B19") retorna um range válido
#' cid_range("B19", "A104") retorna um erro pq a categoria inicial é posterior a categoria final.
#'
#' @export

cid_range <- function(cat_inic, cat_final = NA, cid = FALSE) {

  if(is.na(cat_final)) {
    cat_final = cat_inic
  }

  cat_sup <- toupper(cat_inic)
  cat_inf <- toupper(cat_final)

  indice_sup <- cid_subcat %>%
    filter(grepl(cat_sup, subcat)) %>%
    pull(indice) %>% min

  indice_inf <- cid_subcat %>%
    filter(grepl(cat_inf, subcat)) %>%
    pull(indice) %>% max

  if(indice_sup > indice_inf) {
    return("Categoria inicial é posterior a categoria final")
  }

  if(cid) {
    return(cid_subcat %>%
             slice(indice_sup:indice_inf) %>%
             pull(subcat)
    )
  }

  cid_subcat %>%
    slice(indice_sup:indice_inf)

}
