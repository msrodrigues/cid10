#' Função cid_busca
#'
#'
#'Busca por uma string de texto na descrição dos cids
#'
#' @export



cid_busca <- function(texto, tabela = TRUE) {
  texto <- toupper(texto)
  df <- cid_subcat %>%
    filter(grepl(texto, toupper(descricao)))

  if(tabela) {
    return(df)
  } else {
    df$subcat
  }

}



