-----------------------------------------------VIEW--------------------------------------------------------------
--> Deve ser escrito e executado em um novo arquivo e ser chamado em outro.

CREATE OR ALTER  VIEW vwContagemCursosPorCategoria AS --> CREATE OR ALTER: Permete que altera algo, se o comando fosse somente CREATE não seria possivel alterar.
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