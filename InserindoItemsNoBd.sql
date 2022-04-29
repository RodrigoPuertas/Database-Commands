CREATE DATABASE [Cursos]
GO

USE [Cursos]

CREATE TABLE [Categoria] (
    [Id] INT NOT NULL IDENTITY(1, 1), 
    [Nome] NVARCHAR(80) NOT NULL,

    CONSTRAINT [PK_Categoria] PRIMARY KEY([Id])
)
GO

CREATE TABLE [Curso] (
    [Id] INT NOT NULL IDENTITY(1, 1), 
    [Nome] NVARCHAR(80) NOT NULL,
    [CategoriaId] INT NOT NULL,

    CONSTRAINT [PK_Curso] PRIMARY KEY([Id]),
    CONSTRAINT [FK_Curso_Categoria] FOREIGN KEY([CategoriaId])
        REFERENCES [Categoria]([Id])
)
GO

--------------------------------------------Inserindo informações----------------------------------------------
--INSERT INTO [Categoria](campos) VALUES(valores)
INSERT INTO [Categoria](Nome) VALUES('Backend')
INSERT INTO [Categoria](Nome) VALUES('Frontend')
INSERT INTO [Categoria](Nome) VALUES('Mobile')

INSERT INTO [Curso]([Nome], [CategoriaId]) VALUES('Fundamentos de C#', 1)
INSERT INTO [Curso]([Nome], [CategoriaId]) VALUES('Fundamentos de OOP', 1)
INSERT INTO [Curso]([Nome], [CategoriaId]) VALUES('Angular', 2)
INSERT INTO [Curso]([Nome], [CategoriaId]) VALUES('Flutter', 3)

--------------------------------------Outra maneira de inserir informações------------------------------------


INSERT INTO [Curso] VALUES ('Flutter e SQLite', 3)--dessa maneira ele add na ordem dos campos.