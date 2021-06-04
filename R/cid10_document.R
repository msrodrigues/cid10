#' Tabela com os Capítulos do CID 10
#'
#' Trata-se de um dataset de 22 linhas  e 6 colinas, com os capítulos do cid, com o número do
#' capítulo, a categoria inicial (letra e 2 dígitos) e a categoria final (letra e 2 dígitos) do
#' CDI, a descrição completa do capítulo, a descrição abreviada e por fim a descrição simples do
#' capítulo.
#'
#' \itemize{
#'       \item capitulo: Número arábico do capítulo.
#'       \item cat_ini: Categoria (CID) inicial do capítulo
#'       \item cat_fim: Categoria (CID) final do capítulo
#'       \item descricao. Descrição do capítulo com o título do capítulo
#'       \item descreabrev . Número do capíutlo em romanos e descrição do capítulo.
#'       \item abrev. Descrição do capítulo em formato texto
#'
#' }
#'
#' @name cid_capitulos
#' @docType data
#' @author Marcio Rodrigues \email{msrodrigues@gmail.com}
#' @references \url{https://github.com/msrodrigues}
#' @keywords data, cid10
#' @examples cid_capitulos
#' > cid_capitulos
#' # A tibble: 22 x 6
#'    capitulo cat_ini cat_fim descricao                         descrabrev            abrev
#'       <dbl> <chr>   <chr>   <chr>                             <chr>                 <chr>
#'  1        1 A00     B99     Capítulo I - Algumas doenças inf… I.  Algumas doenças … Algumas doenças infecci…
#'  2        2 C00     D48     Capítulo II - Neoplasias [tumore… II.  Neoplasias (tum… Neoplasias [tumores]
#'  3        3 D50     D89     Capítulo III  - Doenças do sangu… III. Doenças sangue … Doenças do sangue e dos…
#'  4        4 E00     E90     Capítulo IV - Doenças endócrinas… IV.  Doenças endócri… Doenças endócrinas, nut…
#'  5        5 F00     F99     Capítulo V - Transtornos mentais… V.   Transtornos men… Transtornos mentais e c…
#'  6        6 G00     G99     Capítulo VI - Doenças do sistema… VI.  Doenças do sist… Doenças do sistema nerv…
#'  7        7 H00     H59     Capítulo VII - Doenças do olho e… VII. Doenças do olho… Doenças do olho e anexos
#'  8        8 H60     H95     Capítulo VIII - Doenças do ouvid… VIII.Doenças do ouvi… Doenças do ouvido e da …
#'  9        9 I00     I99     Capítulo IX - Doenças do aparelh… IX.  Doenças do apar… Doenças do aparelho cir…
#' 10       10 J00     J99     Capítulo X - Doenças do aparelho… X.Doenças do aparelh… Doenças do aparelho res…
#' # … with 12 more rows
NULL


#' Tabela com as subcategorias do CID 10
#'
#' Trata-se de um dataset de 10.416 linhas  e 11 colinas, é a tabela mais completa do CID 10, com as
#' subcategorias do cid, classificação mais pormenorizada a específica de todas.
#'
#' \itemize{
#'       \item cid: Código CID da subcategoria. String de 3 a 4 dígitos.
#'       \item classif: Classificação cruz ou asterisco.
#'       \item restrsexo:  indica se a categoria/subcategoria está restrita a homens (M), a mulheres (F) ou se não há restrição (ambos); o default é ambos.
#'       \item causaobito: Marcador se a doença pode causar óbito. Padrão é SIM
#'       \item descricao: Texto descrevendo a doença
#'       \item descricaoabrev: Texto descrevendo a doença, com o código CID de no máximo 51 caracteres
#'       \item refer:
#'       \item excluidos:
#'       \item cid_ord: replicação do campo subcat no formato ordered factor. Permite a comparação ordenada entre CIDs
#'       \item indice: indice numérico ordenado.
#'       \item capitulo: capitulo que o CID pertence (1 a 22)
#' }
#'
#' @name cid_subcat
#' @docType data
#' @author Marcio Rodrigues \email{msrodrigues@gmail.com}
#' @references \url{https://github.com/msrodrigues}
#' @keywords data, cid10
NULL


#' Tabela com os GRUPOS do CID 10
#'
#' Trata-se de um dataset de 275 linhas  e 4 colinas, com os agrupamentos de doenças.
#'
#' \itemize{
#'       \item cat_ini: Código CID do inicio do grupo
#'       \item cat_fim: Codigo CID do fim do grupo
#'       \item descricao: Texto descrevendo a doença
#'       \item descricaoabrev: Texto abreviado descrevendo a doença
#' }
#' @examples cid_grupos
#'
#'  A tibble: 275 x 4
#'  cat_ini cat_fim descricao                                    descrabrev
#'  <chr>   <chr>   <chr>                                        <chr>
#'  1 A00     A09     Doenças infecciosas intestinais              Doenças infecciosas intestinais
#'  2 A15     A19     Tuberculose                                  Tuberculose
#'  3 A20     A28     Algumas doenças bacterianas zoonóticas       Algumas doenças bacterianas zoonóticas
#'  4 A30     A49     Outras doenças bacterianas                   Outras doenças bacterianas
#'  5 A50     A64     Infecções de transmissão predominantemente … Infecções de transmissão predominantemente …
#'  6 A65     A69     Outras doenças por espiroquetas              Outras doenças por espiroquetas
#'  7 A70     A74     Outras doenças causadas por clamídias        Outras doenças causadas por clamídias
#'  8 A75     A79     Rickettsioses                                Rickettsioses
#'  9 A80     A89     Infecções virais do sistema nervoso central  Infecções virais do sistema nervoso central
#' 10 A90     A99     Febres por arbovírus e febres hemorrágicas … Febres por arbovírus e febres hemorrágicas …
#' … with 265 more rows
#'
#' @name cid_grupos
#' @docType data
#' @author Marcio Rodrigues \email{msrodrigues@gmail.com}
#' @references \url{https://github.com/msrodrigues}
#' @keywords data, cid10
NULL


#' Vetor com os códigos CID 10 de causas sensíveis a atenção primária
#'
#' Vetor com 560 Cids das condições sensíveis à atenção primária
#'
#' @name cid_aps
#' @docType data
#' @author Marcio Rodrigues \email{msrodrigues@gmail.com}
#' @references \url{https://github.com/msrodrigues}
#' @keywords data, cid10, aps
NULL

