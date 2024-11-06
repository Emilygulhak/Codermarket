-- CRIAÇÃO DE VIEWS

/* 1. Primeira view - Criar uma view que retornará somente as informações importante para identificar o contato do cliente simplicando
e melhorando a visibilidade das informações. */
CREATE VIEW vwContatoCliente AS
SELECT concat_ws(' ', primeiro_nome , sobrenome) AS Nome,
telefone AS Telefone,
email AS Email 
FROM cliente;

SELECT * FROM vwContatoCliente;

/*2. Crie uma view que retorne somente os clientes do estado de São Paulo, junto com nome, sobrenome e cpf */
CREATE VIEW vwLocalizacao_Cliente AS
SELECT concat_ws(' ', primeiro_nome , sobrenome) AS Nome,
c.cpf AS CPF,
e.estado AS Estado
FROM cliente c
INNER JOIN endereco e ON c.endereco_cliente = e.id_endereco
WHERE estado = 'São Paulo';

SELECT * FROM vwLocalizacao_Cliente;

/*3.Crie um view que retorne o produto, valor e quantidade dele no estoque */
SELECT * FROM produto;
CREATE VIEW vwDescricao_valor AS
SELECT p.descricao AS Produto,
p.valor AS Preço,
e.quantidade AS Quantidade
FROM produto p 
INNER JOIN estoque e ON p.estoque_produto = e.id_estoque
ORDER BY e.quantidade;

SELECT * FROM vwDescricao_valor;


/*4. Crie uma view que retorne apenas o produto com quantidade maior que 30 */
CREATE VIEW vwEstoque_quantidade AS
SELECT p.descricao AS Produto,
e.quantidade AS Quantidade
FROM produto p 
INNER JOIN estoque e ON p.estoque_produto = e.id_estoque
WHERE e.quantidade >= 30
ORDER BY e.quantidade;

SELECT * FROM vwEstoque_quantidade;

/*5.Crie uma view que retorne o o produto, e qual fornecedor possui aquele produto*/
CREATE VIEW vw_Fornecedores AS
SELECT p.descricao AS Produto,
f.cnpj AS CNPJ,
f.nome AS Nome_do_Fornecedor
FROM produto p 
INNER JOIN estoque e ON p.estoque_produto = e.id_estoque
INNER JOIN fornecedor f ON e.estoque_fornecedor = f.id_fornecedor
WHERE p.categoria_produto = 'Massas';

SELECT * FROM vw_Fornecedores;


