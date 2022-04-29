SELECT * FROM[Curso] --> selciona todas as colunas da tabela Curso. Obs: não recomendado pois pode travar o BD.

SELECT TOP 2 * FROM [Curso] --> seleciona somentes as duas primeiras linhas.

SELECT TOP 2 -- seleciona somentes as duas primeiras linhas.
    [Id] , [Nome] --> filtros 
FROM
    [Curso] -- nome da tabela
-- OBS: Dessa forma otimiza o coamando select

SELECT DISTINCT TOP 100 --> DISTINCT quando o valor de um dos campos for igual ele só mostra uma vez(Dados Distintos).
    [Nome]
FROM 
    [Categoria]

-----------------------------------------Queries(Filtros)-----------------------------------------------------

SELECT TOP 100 
    [Id] , [Nome], [CategoriaId]
FROM 
    [Curso]
WHERE
    [Id] = 1 AND [CategoriaId] = 1 OR --> fazendo comparação e usando operadores logicos.
    [CategoriaId] IS NULL --> comparando se [CategoriaId] é nula e pode usar o IS NOT(não é).

---------------------------------------------ORDER BY --------------------------------------------------------

SELECT TOP 100 
    [Id] , [Nome], [CategoriaId]
FROM 
    [Curso]
ORDER BY  --> ordena a tabela com prioridade da esquerda para a direita.
    [Nome] ASC, [Id] DESC, [CategoriaId] --> ASC: Acendente ordena do maior para o menor  --> DESC: Decedente ordena do menor para o maior

-----------------------------------------MIN(), MAX() and COUNT()-----------------------------------------------

SELECT TOP 100 
    MIN([Id]) --> seleciona o menor valor.
FROM 
    [Curso]

SELECT TOP 100 
    MAX([Id]) --> seleciona o maior valor.
FROM 
    [Curso]

SELECT TOP 100 
    COUNT([Id]) --> Conta quantos items tem.
FROM 
    [Curso]

-------------------------------------------AVG() and Sum()------------------------------------------------------

SELECT TOP 100 
    AVG([Id]) --> Media dos itens.
FROM 
    [Curso]

SELECT TOP 100 
    SUM([Id]) --> soma a coluna.
FROM 
    [Curso]

-------------------------------------------------LIKE--------------------------------------------------------------

SELECT  TOP 100
    * --> Todos os dados do BD, porém não é recomendavel.
FROM 
    [Curso]
WHERE
    [Nome] LIKE '%Fundamentos%' --> LIKE = similar .
                                --> % no inicio = termina com "palavra".
                                --> % no final = começa com "palavra".
                                --> %"palavra"% = contem.

-------------------------------------------------IN()---------------------------------------------------------------

SELECT TOP 100
    * --> Todos os dados do BD, porém não é recomendavel.
FROM 
    [Curso]
WHERE
    [Id] IN (1,3) --> IN: espera um array de vetores. Seleciona todos os cursos que estão de 1 à 3 no seu [Id].

-------------------------------------------------BERWEEN()-----------------------------------------------------------

SELECT TOP 100 
    * --> Todos os dados do BD, porém não é recomendavel.
FROM 
    [Curso]
WHERE
    [Id] BETWEEN 2 AND 3 -->BETWEEN: Seleciona valores entre algo, nesse caso seleciona valores entre 2 e 3.


SELECT TOP 100
    * --> Todos os dados do BD, porém não é recomendavel.
FROM 
    [Curso]
WHERE
    [Id] BETWEEN '2022-04-01 00:00:00' AND '2022-04-31 23:59:00' --> exemplo do BETWEEN com data e hora.

-------------------------------------------------Alias-----------------------------------------------------------
SELECT TOP 100
    [Id] AS [Codigo], -->Alias: Permite dar um apelido. Apelidou Id de Codigo.
    [Nome]
FROM
    [Curso]

-------------------------------------------------Joins-----------------------------------------------------------
--> Apresenta os itens relacionados.

--> INEER JOIN 
    SELECT TOP 100
        * 
    FROM 
        [Curso]
        INNER JOIN [Categoria]                          --> Faz a junçao de tabelas para pesquisas, todavia nessecita de instrução de como fazer essa junção. 
            ON [Curso].[CategoriaId] = [Categoria].[Id]  -- Desse modo utiliza-se o ON geralmente com as chaves primarias e estrangeiras.

    --> OBS: Quando o SELECT usar campos especificos sempre coloca como prefixo o nome da tabela.
    --> OBS2: INNER JOIN só pega os cursos que também existem em Categoria somente a intersecção dos dois, 
    --EX:

    SELECT TOP 100
        [Curso].[Id],
        [Curso].[Nome],
        [Categoria].[Id] AS [Categoria], -->Atribuiu um apelido para não coencidir o Id da tabela Curso e o Id da tabela Categoria. 
        [Categoria].[Nome]

    FROM 
        [Curso]
        INNER JOIN [Categoria]                           
            ON [Curso].[CategoriaId] = [Categoria].[Id] 

--> LEFT JOIN
    SELECT TOP 100
        [Curso].[Id],
        [Curso].[Nome], 
        [Categoria].[Id] AS [Categoria],
        [Categoria].[Nome]
    FROM
        [Curso]
        LEFT JOIN [Categoria]  -->LEFT JOIN: Apresenta todos os itens da primeira tabela(primeira tabela = [Curso]).                     
            ON [Curso].[CategoriaId] = [Categoria].[Id] 

--> RIGHT JOIN
    SELECT TOP 100
        [Curso].[Id],
        [Curso].[Nome],
        [Categoria].[Id] AS [Categoria],  
        [Categoria].[Nome]
    FROM
        [Curso]
        RIGHT JOIN [Categoria]  -->LEFT JOIN: Apresenta todos os itens da segunda tabela(segunda tabela = [Categoria]).                     
            ON [Curso].[CategoriaId] = [Categoria].[Id] 

--> FULL JOIN
    SELECT TOP 100
        [Curso].[Id],
        [Curso].[Nome],
        [Categoria].[Id] AS [Categoria],  
        [Categoria].[Nome]
    FROM
        [Curso]
        FULL OUTER JOIN [Categoria]  -->FULL JOIN: Apresenta todos os itens de ambas as tabelas.                  
            ON [Curso].[CategoriaId] = [Categoria].[Id] 

------------------------------------------------UNION-------------------------------------------------------------
--> Apresenta itens sem necessidade de estarem relacionadas. 
--> Necessita que seus dados sejam similares.
-- EX:

SELECT TOP 100
     [Id],
     [Nome]
FROM
    [Curso]

UNION  --> Une todos os dados em uma unica tabela. Pode usar o UNION ALL evita itens que estão duplicado.

    SELECT TOP 100
     [Id],
     [Nome]
FROM
    [Categoria]

----------------------------------------------Group By------------------------------------------------------------
--> Utiliza-se quando há necessidade de contar a qtd de um determinado item.

SELECT TOP 100
    [Categoria].[Nome],
    COUNT([Curso].[CategoriaId]) AS [Cursos] --> Para utilizar o COUNT aqui é necessario usar o GROUP BY.
FROM
    [Categoria]
    INNER JOIN [Curso] ON [Curso].[CategoriaId] = [Categoria].[Id]
GROUP BY --> agrupa as informações. 
    [Categoria].[Nome],
    [Curso].[CategoriaId]

-----------------------------------------------HAVING------------------------------------------------------------

SELECT TOP 100
    [Categoria].[Nome],
    COUNT([Curso].[CategoriaId]) AS [Cursos] --> Para utilizar o COUNT aqui é necessario usar o GROUP BY.
FROM
    [Categoria]
    INNER JOIN [Curso] ON [Curso].[CategoriaId] = [Categoria].[Id]
GROUP BY --> agrupa as informações. 
    [Categoria].[Nome],
    [Curso].[CategoriaId]
HAVING --> Substitui o WHERE(GROUP BY não permiti usar o filtro WHERE).
    COUNT([Curso].CategoriaId) > 1

-----------------------------------------------VIEW--------------------------------------------------------------

--> Aqui está sendo chamado o View que foi criado no arquivo ViewsComando.sql

SELECT * FROM vwContagemCursosPorCategoria
WHERE [Cursos] = 2