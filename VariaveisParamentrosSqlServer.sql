
----------------------------------------------------------------Variaveis------------------------------------------------------------------

CREATE OR ALTER PROCEDURE [splistCourse] AS

    DECLARE @CategoryId INT 
    SET @CategoryId = (SELECT TOP 1 [Id] FROM [Categoria] WHERE [Nome] = 'Backend')

    SELECT * FROM [Curso] WHERE [CategoriaId] = @CategoryId





--> Para Chamar uma PROCEDURE usa o comando:
EXEC [splistCourse]

----------------------------------------------------------Utilizando Parametros-----------------------------------------------------------

CREATE OR ALTER PROCEDURE [splistCourse1]
    @Category NVARCHAR(60) --> parametro
 AS

    DECLARE @CategoryId INT --> declarando uma variavel
    SET @CategoryId = (SELECT TOP 1 [Id] FROM [Categoria] WHERE [Nome] = @Category)--> dando valor a variavel.

    SELECT * FROM [Curso] WHERE [CategoriaId] = @CategoryId





--> Para Chamar uma PROCEDURE usa o comando:
EXEC [splistCourse1] 'Backend' --> chama o procedure e passa o parametro.