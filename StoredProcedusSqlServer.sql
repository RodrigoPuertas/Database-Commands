---------------------------------------------------STORED PROCEDUS(PROCEDIMENTOS ARMAZENADOS)-----------------------------------------------
--> São pedaços de codigo que podem ser chamados.
--CREATE OR ALTER PROCEDURE [nomeDaProcere]


CREATE OR ALTER PROCEDURE [splistCourse] AS 
    SELECT * FROM [Curso]

--> Excluir uma PROCEDURE
DROP PROCEDURE [splistCourse]

--> Para Chamar uma PROCEDURE usa o comando:
EXEC [splistCourse]



