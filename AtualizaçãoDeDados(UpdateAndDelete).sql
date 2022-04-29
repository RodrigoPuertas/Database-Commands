SELECT * FROM [Categoria]

--Utilizar BEGIN TRANSACTION(começa uma trasação) quando for fazer UPDATE de poucos dados.

BEGIN TRANSACTION --> inicia uma transação.
    UPDATE
        [Categoria] --> nome da tabela.
    SET
        [Nome] = 'Backend1' --> alteração.
    WHERE 
        [iD] = 1 --> Onde ira fazer a alteração.
ROLLBACK --> Desfaz as ações no final da execução.

--depois de certificar que o update está correto usa o codigo abaixo:

BEGIN TRANSACTION --> inicia uma transação.
    UPDATE
        [Categoria] --> nome da tabela.
    SET
        [Nome] = 'Backend1' --> alteração.
    WHERE 
        [iD] = 1 --> Onde ira fazer a alteração.
COMMIT --> Faz a alteração.

   
    DELETE FROM
        [Categoria] --> nome da tabela.
    WHERE 
        [iD] = 1 
        --> OBS: Como medida de segurança pode-se usar o BEGIN TRANSACTION
    