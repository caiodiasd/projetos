--=======================
-- PASSO 1 - IMPORTAR BASE DE DADOS
--=======================

-- Base de dados 'vendas_loja' importada para análise

--=======================
-- PASSO 2 - RENOMEAR COLUNAS
--=======================

ALTER TABLE vendas_loja RENAME COLUMN c1 TO id_venda;

-- ...

--=======================
-- PASSO 3 - VERIFICANDO LINHAS E COLUNAS
--=======================
SELECT * FROM vendas_loja;

--=======================
-- PASSO 4 - TOTAL DE VENDAS POR CATEGORIA (R$)
--=======================
SELECT 
  ROUND(SUM(quantidade * preco_unitario)::numeric, 2) AS "Faturamento Total"
FROM vendas_loja;

--=======================
-- PASSO 5 - TOTAL DE VENDAS POR CLIENTE
--=======================
SELECT 
    id_venda,
    cliente,
    SUM(quantidade) AS "Total de Vendas"
FROM vendas_loja
GROUP BY id_venda, cliente
ORDER BY "Total de Vendas" DESC;

--=======================
-- PASSO 6 - TOTAL DE VENDAS POR ESTADO
--=======================
SELECT 
    estado,
    SUM(quantidade) AS "Total de Vendas"
FROM vendas_loja
GROUP BY estado
ORDER BY "Total de Vendas" DESC;

--=======================
-- PASSO 7 - PRODUTO COM MAIOR QUANTIDADE VENDIDA
--=======================
SELECT 
    produto,
    SUM(quantidade) AS "Quantidade Vendida"
FROM vendas_loja
GROUP BY produto
ORDER BY "Quantidade Vendida" DESC;

--=======================
-- PASSO 8 - QUANTIDADE TOTAL VENDIDA POR CATEGORIA
--=======================
SELECT 
    categoria,
    SUM(quantidade) AS "Quantidade Total"
FROM vendas_loja
GROUP BY categoria
ORDER BY "Quantidade Total" DESC;

--=======================
-- PASSO 9 - MÉDIA DE PREÇO UNITÁRIO POR CATEGORIA
--=======================
SELECT 
    categoria,
    ROUND(AVG(preco_unitario)::NUMERIC, 2) AS "Média de preço"
FROM vendas_loja
GROUP BY categoria
ORDER BY "Média de preço" DESC;

--=======================
-- PASSO 10 - VALOR MÉDIO GASTO POR VENDA
--=======================
SELECT 
    ROUND(AVG(quantidade * preco_unitario)::NUMERIC, 2) AS "Valor médio por venda"
FROM vendas_loja;

--=======================
-- PASSO 11 - TOP 5 CLIENTES QUE MAIS GASTARAM
--=======================
SELECT 
    cliente,
    ROUND(SUM(quantidade * preco_unitario)::NUMERIC, 2) AS "Total gasto"
FROM vendas_loja
GROUP BY cliente
ORDER BY "Total gasto" DESC
LIMIT 5;

--=======================
-- PASSO 12 - TOP 3 PRODUTOS MAIS VENDIDOS E FATURAMENTO
--=======================
SELECT 
    produto,
    SUM(quantidade) AS total_vendido,
    ROUND(SUM(quantidade * preco_unitario)::NUMERIC, 2) AS faturamento_total
FROM vendas_loja
GROUP BY produto
ORDER BY total_vendido DESC
LIMIT 3;

--=======================
-- PASSO 13 - VALOR TOTAL VENDIDO EM SP
--=======================
SELECT
    ROUND(SUM(quantidade * preco_unitario)::NUMERIC, 2) AS "Total vendido SP"
FROM vendas_loja
WHERE estado = 'SP';

--=======================
-- PASSO 14 - PRODUTOS NUNCA VENDIDOS EM MG
--=======================
SELECT DISTINCT produto
FROM vendas_loja
WHERE produto NOT IN (
    SELECT DISTINCT produto
    FROM vendas_loja
    WHERE estado = 'MG'
);