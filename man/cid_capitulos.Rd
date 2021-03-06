% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cid10_document.R
\docType{data}
\name{cid_capitulos}
\alias{cid_capitulos}
\title{Tabela com os Capítulos do CID 10}
\description{
Trata-se de um dataset de 22 linhas  e 6 colinas, com os capítulos do cid, com o número do
capítulo, a categoria inicial (letra e 2 dígitos) e a categoria final (letra e 2 dígitos) do
CDI, a descrição completa do capítulo, a descrição abreviada e por fim a descrição simples do
capítulo.
}
\details{
\itemize{
      \item capitulo: Número arábico do capítulo.
      \item cat_ini: Categoria (CID) inicial do capítulo
      \item cat_fim: Categoria (CID) final do capítulo
      \item descricao. Descrição do capítulo com o título do capítulo
      \item descreabrev . Número do capíutlo em romanos e descrição do capítulo.
      \item abrev. Descrição do capítulo em formato texto

}
}
\examples{
cid_capitulos
> cid_capitulos
# A tibble: 22 x 6
   capitulo cat_ini cat_fim descricao                         descrabrev            abrev
      <dbl> <chr>   <chr>   <chr>                             <chr>                 <chr>
 1        1 A00     B99     Capítulo I - Algumas doenças inf… I.  Algumas doenças … Algumas doenças infecci…
 2        2 C00     D48     Capítulo II - Neoplasias [tumore… II.  Neoplasias (tum… Neoplasias [tumores]
 3        3 D50     D89     Capítulo III  - Doenças do sangu… III. Doenças sangue … Doenças do sangue e dos…
 4        4 E00     E90     Capítulo IV - Doenças endócrinas… IV.  Doenças endócri… Doenças endócrinas, nut…
 5        5 F00     F99     Capítulo V - Transtornos mentais… V.   Transtornos men… Transtornos mentais e c…
 6        6 G00     G99     Capítulo VI - Doenças do sistema… VI.  Doenças do sist… Doenças do sistema nerv…
 7        7 H00     H59     Capítulo VII - Doenças do olho e… VII. Doenças do olho… Doenças do olho e anexos
 8        8 H60     H95     Capítulo VIII - Doenças do ouvid… VIII.Doenças do ouvi… Doenças do ouvido e da …
 9        9 I00     I99     Capítulo IX - Doenças do aparelh… IX.  Doenças do apar… Doenças do aparelho cir…
10       10 J00     J99     Capítulo X - Doenças do aparelho… X.Doenças do aparelh… Doenças do aparelho res…
# … with 12 more rows
}
\references{
\url{https://github.com/msrodrigues}
}
\author{
Marcio Rodrigues \email{msrodrigues@gmail.com}
}
\keyword{cid10}
\keyword{data,}
