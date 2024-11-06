-- CRIAÇÃO DE FUNÇÕES 

/*1. Será criada uma função para calcular o valor de desconto em cima do produto, o valor base para conseguir
um desconto será de 150 Reais - terá 5%
200 Reais - 10 %*/

DELIMITER //

CREATE FUNCTION calcula_desconto_final(preco DECIMAL(10, 2), desconto DECIMAL(5, 2))  
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    RETURN preco - (preco * desconto / 100);
END //

DELIMITER ;

SELECT calcula_desconto_final(200, 10) AS Desconto_Final ;


/*2.  Faz a soma do total de produtos que tem no estoque */

DELIMITER //

CREATE FUNCTION calcula_estoque_total(id_produto INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE estoque_total INT;
    
    SELECT SUM(quantidade) INTO estoque_total
    FROM estoque
    WHERE id_estoque = id_estoque;
    
    RETURN COALESCE(estoque_total, 0); -- Retorna 0 se não houver estoque
END //

DELIMITER ;

SELECT calcula_estoque_total(50) AS Soma_Total_De_Produtos;-- Retorna o estoque total do produto com ID 1
