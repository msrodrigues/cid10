# cid10

Package com as tabelas do CID 10 para R em Português e com funções auxiliares para manipulação das tabelas, extração de códigos do CID. As buscas podem ser feitas por código, por qualquer fração do texto presente na descrição do CID ou pelo código do CID 10. A busca é inteligente, tratando problemas comuns de busca textual, podem ser usadas indiscriminadamente maiúsculas ou minúsculas, códigos incompletos do CID. Toda a busca será inclusiva, resgatando todas as alternativas que sejam um _match_ da _string_ procurada.

Contém as seguintes tabelas:
 - cid_subcat: tabela com todas as catgorias e subcategorias do CID 10, é a tabela completa.
 - cid_capitulos: tabela com todos os capítulos do CID 10
 - cid_grupos: tabela com os grupos do CID 10, com a categoria inicial e categoria final

# Instalação

Atualmente o pacote não se encontra no CRAN. Para instala-lo é necessário o pacote `devtools`. 
Para instalar o `devtools` usar o seguinte comando:

`install.packages("devtools")`

Após a instalação do pacote
