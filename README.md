# cid10

A CID-10 segue uma hierarquia de Capítulos, que contém Grupos, que contém Categorias, que por sua vez contém Subcategorias que representam o nível de maior detalhamento. Este pacotem contem as tabelas e funções para manipulação das tabelas.

Package com as tabelas do CID (Classificação Internacional das Doenças) 10 para R em Português e com funções auxiliares para manipulação das tabelas, extração de códigos do CID. As buscas podem ser feitas por código, por qualquer fração do texto presente na descrição do CID ou pelo código do CID 10. A busca é inteligente, tratando problemas comuns de busca textual, podem ser usadas indiscriminadamente maiúsculas ou minúsculas, códigos incompletos do CID. Toda a busca será inclusiva, resgatando todas as alternativas que sejam um _match_ da _string_ procurada.

### Tabelas

Contém as seguintes tabelas:
 - cid_capitulos: Nível mais alto, tabela com todos os **capítulos** do CID 10
 - cid_grupos: Tabela com os **grupos** do CID 10, com a categoria inicial e categoria final
 - cid_categorias: tabela com as **categorias** do CID 10
 - cid_subcat: tabela com todas as **categorias** e **subcategorias** do CID 10, é a tabela completa.
 - cid_tabela_aps: Tabela dos códigos CID de condições sensíveis a atenção primária

Também similar a `cid_tabela_aps` está disponível no pacote o vetor `cid_aps`, com todos os CIDs de 
condições sensíveis a atenção primária.

 ### Funções
 
 Acompanha o pacote 2 funções que auxiliam a manipulação das tabelas do CID 10. 
 
 `cid_busca()` e `cid_range()`
 
 A função `cid_busca` recebe como argumento uma string que pode ser o código do CID 10 ou qualquer substring de texto. A busca não é _case sensitive_, ou seja pode ser digitada qualquer combinação de maiúsculas e minúsculas. O algoritmo trata também a se o texto contem ou não contém caracteres acentuados.
 
 ```r
 # Exemplos:

# Busca pelo código do CID 10

> cid_busca("A18")
 
 # A tibble: 9 x 12
  cid   classif restrsexo causaobito descricao    descrabrev   refer excluidos cid_ord indice cap   capitulo
  <chr> <chr>   <chr>     <chr>      <chr>        <chr>        <chr> <chr>     <ord>    <int> <fct>    <dbl>
1 A180  +       NA        NA         Tuberculose… A18.0 Tuber… NA    NA        A180        83 1            1
2 A181  NA      NA        NA         Tuberculose… A18.1 Tuber… NA    NA        A181        84 1            1
3 A182  NA      NA        NA         Linfadenopa… A18.2 Linfa… NA    NA        A182        85 1            1
4 A183  NA      NA        NA         Tuberculose… A18.3 Tuber… NA    NA        A183        86 1            1
5 A184  NA      NA        NA         Tuberculose… A18.4 Tuber… NA    NA        A184        87 1            1
6 A185  NA      NA        NA         Tuberculose… A18.5 Tuber… NA    NA        A185        88 1            1
7 A186  NA      NA        NA         Tuberculose… A18.6 Tuber… NA    NA        A186        89 1            1
8 A187  +       NA        NA         Tuberculose… A18.7 Tuber… E35.… NA        A187        90 1            1
9 A188  NA      NA        NA         Tuberculose… A18.8 Tuber… NA    NA        A188        91 1            1

# Busca por uma string

> cid_busca("TuBerC")

# A tibble: 61 x 12
   cid   classif restrsexo causaobito descricao    descrabrev  refer excluidos cid_ord indice cap   capitulo
   <chr> <chr>   <chr>     <chr>      <chr>        <chr>       <chr> <chr>     <ord>    <int> <fct>    <dbl>
 1 A150  NA      NA        NA         Tuberculose… A15.0 Tube… NA    NA        A150        60 1            1
 2 A151  NA      NA        NA         Tuberculose… A15.1 Tube… NA    NA        A151        61 1            1
 3 A152  NA      NA        NA         Tuberculose… A15.2 Tube… NA    NA        A152        62 1            1
 4 A153  NA      NA        NA         Tuberculose… A15.3 Tube… NA    NA        A153        63 1            1
 5 A154  NA      NA        NA         Tuberculose… A15.4 Tube… NA    NA        A154        64 1            1
 6 A155  NA      NA        NA         Tuberculose… A15.5 Tube… NA    NA        A155        65 1            1
 7 A156  NA      NA        NA         Pleuris tub… A15.6 Pleu… NA    NA        A156        66 1            1
 8 A157  NA      NA        NA         Tuberculose… A15.7 Tube… NA    NA        A157        67 1            1
 9 A158  NA      NA        NA         Outras form… A15.8 Outr… NA    NA        A158        68 1            1
10 A159  NA      NA        NA         Tuberculose… A15.9 Tube… NA    NA        A159        69 1            1
# … with 51 more rows
 
 
# Busca com o argumento tabela = FALSE
> cid_busca("TuBerC", tabela = FALSE)
 [1] "A150" "A151" "A152" "A153" "A154" "A155" "A156" "A157" "A158" "A159" "A160" "A161" "A162" "A163"
[15] "A164" "A165" "A167" "A168" "A169" "A170" "A171" "A178" "A179" "A180" "A181" "A182" "A183" "A184"
[29] "A185" "A186" "A187" "A188" "A190" "A191" "A192" "A198" "A199" "A301" "A302" "B900" "B901" "B902"
[43] "B908" "B909" "J65"  "K230" "K673" "K930" "M011" "M490" "M900" "N330" "N740" "N741" "O980" "P370"
[57] "R761" "Z030" "Z111" "Z201" "Z232"

 
 ```
 

# Instalação

Atualmente o pacote não se encontra no CRAN. Para instala-lo é necessário o pacote `devtools`. 
Para instalar o `devtools` usar o seguinte comando:

```r
install.packages("devtools")
```

Após a instalação do pacote `devtools`, para instalar o pacote `cid10`, direto do _github_:

```r
devtools::install_git(url = "http://github.com/msrodrigues/cid10.git")
```

Após esta etapa o pacote estará pronto para ser utilizado, bastando que seja carregado:


```
library(cid10)
```



