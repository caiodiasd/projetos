# Projeto de Análise de Vendas com SQL

Este projeto simula uma análise de vendas usando **SQL** com foco em situações reais de negócios. A base de dados foi criada manualmente com 80 registros para representar vendas fictícias de uma loja brasileira.

---

## Objetivo

Transformar dados brutos em **insights comerciais**, utilizando **consultas SQL em PostgreSQL**, respondendo perguntas estratégicas como:

- Quais são os produtos mais vendidos?
- Qual o total de vendas por estado?
- Quem são os clientes que mais compram?
- Qual o ticket médio por venda?
- Quais produtos nunca venderam em certos estados?

---

## Base de Dados

Arquivo: `vendas_loja.csv`

**Colunas:**
- `id_venda`
- `data_venda`
- `cliente`
- `produto`
- `categoria`
- `quantidade`
- `preco_unitario`
- `estado`

---

## Consultas Respondidas

1. Ver todas as linhas e colunas da base
2. Total de vendas por categoria
3. Total de vendas por cliente
4. Total de vendas por estado
5. Produto mais vendido
6. Quantidade vendida por categoria
7. Média de preço por categoria
8. Valor médio gasto por venda
9. Top 5 clientes que mais gastaram
10. Top 3 produtos mais vendidos e faturamento
11. Total vendido no estado de SP
12. Produtos que nunca venderam em MG

---

## Conclusões

Com base na análise, é possível:

- Identificar os produtos e categorias de maior desempenho
- Conhecer os clientes mais lucrativos
- Localizar gargalos de venda por estado
- Entender o comportamento de consumo por região

---

## Tecnologias Usadas

- SQL (PostgreSQL)
- Ferramenta online para execução
- CSV gerado manualmente

---