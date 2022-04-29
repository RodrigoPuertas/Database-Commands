use [Curso]

DROP TABLE [Aluno]

CREATE TABLE [Aluno](
    [Id] INT NOT NULL,
    [Nome] NVARCHAR(80) NOT NULL,
    [Email] NVARCHAR(180) NOT NULL UNIQUE,--UNIQUE: esse comando carante que os valores não se repetem.
    [Nascimento] DATETIME NULL,
    [Active] BIT NOT NULL --DEFAULT(0): essa comando determina um valor padrão para o campo.

    --PRIMARY KEY ([Id]): Desse modo o nome da chave é criado automaticamente.
    CONSTRAINT [PK_Aluno] PRIMARY KEY ([Id])--  Cria uma chave primaria com o inserido manualmente.
)
GO
 



/*
-----------------------------------ALTERANDO TABELA JÁ CRIADA-----------------------------------------

ALTER TABLE [Aluno]
    ADD [Document] NVARCHAR(11)--add um novo campo em uma tabela já criada.
GO

ALTER TABLE [Aluno]
    DROP COLUMN [Document]--apaga um campo em um tabela já criada.
GO

ALTER TABLE [Aluno]
    ALTER COLUMN [Document] CHAR(11)--modifica um campo já existente.
GO

ALTER TABLE [Aluno]
    ADD PRIMARY KEY ([Id])--Add uma chave primaria em uma tabela já criada.
GO

ALTER TABLE [Aluno]
    DROP CONSTRAINT [PK_Aluno_]
GO
*/