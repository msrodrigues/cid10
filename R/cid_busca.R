#' # Função cid_busca
#'
#'
#' Função que irá buscar por um código do CID (completo ou incompleto), ou qualquer palavra na descrição
#' do CID (pode ser digitada com acententuação ou sem acentuação, também é indiferente se os caracters
#' estão em letra maiúscula ou minúscula)
#'
#' @param texto Um texto a ser encontrado no nome ou um CID
#' @param tabela TRUE ou FALSE. Campo opcional (setado padrão como TRUE) que vai definir se o retorno da função é uma tabela ou somente os CIDs relacionados a busca
#' @return Retorna uma tabela com código CID, classif, restrsexo, cauxaobito, descricao, descabrev, etc...
#' ou um somente um vetor com os cids relacionados a busca. O padrão é o retorno da tabela completa
#' @examples
#' cid_busca("Tub")
#'
#' A tibble: 108 x 10
#'   cid      classif restrsexo causaobito descricao            descrabrev     refer excluidos subcat_ord indice
#'   <chr>    <chr>   <chr>     <chr>      <chr>                <chr>          <chr> <chr>     <ord>       <int>
#'   1 A150   NA      NA        NA         Tuberculose pulmona… A15.0 Tuberc … NA    NA        A150           60
#'   2 A151   NA      NA        NA         Tuberculose pulmona… A15.1 Tuberc … NA    NA        A151           61
#'   3 A152   NA      NA        NA         Tuberculose pulmona… A15.2 Tuberc … NA    NA        A152           62
#'   4 A153   NA      NA        NA         Tuberculose pulmona… A15.3 Tuberc … NA    NA        A153           63
#'   5 A154   NA      NA        NA         Tuberculose dos gân… A15.4 Tuberc … NA    NA        A154           64
#'   6 A155   NA      NA        NA         Tuberculose da lari… A15.5 Tuberc … NA    NA        A155           65
#'   7 A156   NA      NA        NA         Pleuris tuberculoso… A15.6 Pleuris… NA    NA        A156           66
#'   8 A157   NA      NA        NA         Tuberculose primári… A15.7 Tuberc … NA    NA        A157           67
#'   9 A158   NA      NA        NA         Outras formas de tu… A15.8 Outr fo… NA    NA        A158           68
#'  10 A159   NA      NA        NA         Tuberculose não esp… A15.9 Tuberc … NA    NA        A159           69
#' … with 98 more rows
#'
#' cid_busca("Tub", tabela = FALSE)
#'
#'   [1] "A150" "A151" "A152" "A153" "A154" "A155" "A156" "A157" "A158" "A159" "A160" "A161" "A162" "A163"
#'  [15] "A164" "A165" "A167" "A168" "A169" "A170" "A171" "A178" "A179" "A180" "A181" "A182" "A183" "A184"
#'  [29] "A185" "A186" "A187" "A188" "A190" "A191" "A192" "A198" "A199" "A301" "A302" "B900" "B901" "B902"
#'  [43] "B908" "B909" "H661" "J65"  "K230" "K673" "K930" "M011" "M490" "M900" "N10"  "N118" "N119" "N12"
#'  [57] "N158" "N159" "N160" "N161" "N162" "N163" "N164" "N165" "N168" "N170" "N258" "N259" "N330" "N740"
#'  [71] "N741" "N971" "O001" "O296" "O747" "O896" "O980" "P370" "Q851" "R761" "R933" "T884" "W370" "W371"
#'  [85] "W372" "W373" "W374" "W375" "W376" "W377" "W378" "W379" "X160" "X161" "X162" "X163" "X164" "X165"
#'  [99] "X166" "X167" "X168" "X169" "Z030" "Z111" "Z201" "Z232" "Z310" "Z434"
#'
#'
#' @export

cid_busca <- function(texto, tabela = TRUE) {
  texto <- toupper(texto)
  df <- cid_subcat %>%
    filter(grepl(texto, toupper(descricao)) | grepl(texto, toupper(cid)) | grepl(texto, toupper(descrabrev)))

  if(tabela) {
    return(df)
  } else {
    df$cid
  }
}



