CREATE DATABASE atv_spring
GO
USE atv_spring

CREATE TABLE produto(
cod          INT          NOT NULL,
nome         VARCHAR(30)  NOT NULL,
valor_unit   DECIMAL(7,2) NOT NULL,
qtd_estoque  INT          NOT NULL
PRIMARY KEY (cod)
)

INSERT INTO produto VALUES
(1, 'Produto1', 6.00, 6),
(2, 'Produto2', 4.00, 10),
(3, 'Produto3', 7.00, 8),
(4, 'Produto4', 2.00, 4)

SELECT * FROM produto

--Errada
CREATE FUNCTION fn_valor_minimo (@val_min INT)
RETURNS INT
AS
BEGIN
	DECLARE @qnt_produtos INT;
    SELECT @qnt_produtos = COUNT(*) FROM produto WHERE qtd_estoque < @val_min;
    RETURN @qnt_produtos;

	RETURN @qnt_produtos
END

SELECT dbo.fn_valor_minimo(7)



CREATE FUNCTION fn_retorna_produto_estoque_baixo(@val_entrada INT)
RETURNS @table TABLE(
cod          INT          NOT NULL,
nome         VARCHAR(30)  NOT NULL,
valor_unit   DECIMAL(7,2) NOT NULL,
qtd_estoque  INT          NOT NULL
)
AS
BEGIN
	
	INSERT INTO @table(cod, nome, valor_unit, qtd_estoque)
		SELECT cod, nome, valor_unit, qtd_estoque FROM produto WHERE qtd_estoque < @val_entrada

	RETURN
END

SELECT * FROM fn_retorna_produto_estoque_baixo (7)