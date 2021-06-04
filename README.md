# cid10

A CID-10 segue uma hierarquia de Capítulos, que contém Grupos, que contém Categorias, que por sua vez contém Subcategorias que representam o nível de maior detalhamento. Este pacotem contem as tabelas e funções para manipulação das tabelas.

Package com as tabelas do CID (Classificação Internacional das Doenças) 10 para R em Português e com funções auxiliares para manipulação das tabelas, extração de códigos do CID. As buscas podem ser feitas por código, por qualquer fração do texto presente na descrição do CID ou pelo código do CID 10. A busca é inteligente, tratando problemas comuns de busca textual, podem ser usadas indiscriminadamente maiúsculas ou minúsculas, códigos incompletos do CID. Toda a busca será inclusiva, resgatando todas as alternativas que sejam um _match_ da _string_ procurada.

### Tabelas

Contém as seguintes tabelas:
 - cid_capitulos: Nível mais alto, tabela com todos os **capítulos** do CID 10
 - cid_grupos: Tabela com os **grupos** do CID 10, com a categoria inicial e categoria final
 - cid_categorias: tabela com as **categorias** do CID 10
 - cid_subcat: tabela com todas as **categorias** e **subcategorias** do CID 10, é a tabela completa.
 - cid_aps: Tabela dos códigos CID de condições

 ### Funções
 
 Acompanha o pacote 2 funções que auxiliam a manipulação das tabelas do CID 10. 
 
 `cid_busca` e `cid_range`
 

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



