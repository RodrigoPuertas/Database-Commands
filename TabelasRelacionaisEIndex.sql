USE [Curso]




CREATE TABLE [Categoria] (
    [Id] INT NOT NULL,
    [NOME] NVARCHAR(80) NOT NULL,
    [categoriaId] INT NOT NULL,

    CONSTRAINT [PK_Categoria] PRIMARY KEY ([Id])
)
GO

CREATE INDEX [IX_Aluno_Email] ON [Aluno] ([Email])--usa quando se pesquisa muito no banco de dados(pesquisas macivas).
DROP INDEX [IX_Aluno_Email] ON [Aluno]

CREATE TABLE [ProgressoCurso] (
    [AlunoId] INT NOT NULL,
    [CursoId] INT NOT NULL,
    [Progresso] INT NOT NULL,
    [UltimaAtualizacao] DATETIME NOT NULL DEFAULT(GETDATE()),

    CONSTRAINT [PK_ProgressoCurso] PRIMARY KEY ([AlunoId], [CursoId])

)
GO

CREATE TABLE [Curso] (
    [Id] INT NOT NULL IDENTITY(1, 1),-- IDENTITY faz o inclemento gera o Id automaticamente baseado no ultimo cadastrado (somente em números inteiros)
    [NOME] NVARCHAR(80) NOT NULL,
    [CategoriaId] int not null

    CONSTRAINT [PK_Curso] PRIMARY KEY ([Id])
    CONSTRAINT [Fk_Curso_Categoria] FOREIGN KEY ([CategoriaId])
        REFERENCES [Categoria]([Id])
)
GO




DROP TABLE [Curso]
