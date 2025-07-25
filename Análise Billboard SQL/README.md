# Projeto SQL - Análise Billboard

Este projeto tem como objetivo explorar os dados históricos das paradas musicais **Billboard Hot 100** e **Billboard 200** utilizando consultas SQL. A análise foi feita a partir de arquivos CSV contendo registros semanais de músicas e álbuns que figuraram nas principais paradas norte-americanas.

## 📁 Estrutura do Projeto

- `hot100.csv` – Dados da Billboard Hot 100.
- `billboard200.csv` – Dados da Billboard 200.
- `projeto_sql_analise_billboard.sql` – Script SQL com limpeza, criação de tabelas e queries de análise.
- `projeto_sql_analise_billboard.pdf` – PDF com as perguntas separadas por nível de dificuldade.

## 📊 Consultas Realizadas

As perguntas foram organizadas por grau de complexidade:

### ✅ Fáceis
1. Quais são os 10 artistas com mais entradas na Hot 100?
2. Quais foram as 5 músicas mais bem colocadas na semana mais recente?
3. Qual o número total de músicas cadastradas por ano?

### 🔄 Médias
4. Liste os 10 artistas que tiveram mais músicas no Top 10 da Hot 100.
5. Quais os 5 artistas com mais semanas acumuladas no Top 5 da Hot 100?
6. Quais artistas aparecem em ambas as tabelas (Hot 100 e Billboard 200)?

### 🚀 Difíceis
7. Quais músicas ficaram mais semanas consecutivas no 1º lugar?
8. Qual é o tempo médio que uma música permanece na Hot 100 por década?

## ⚙️ Tecnologias Utilizadas

- SQLite / DBeaver
- SQL ANSI
- Python (para geração de PDF)

## 📌 Como Usar

1. Importe os arquivos CSV no seu banco SQLite.
2. Execute o script `projeto_sql_analise_billboard.sql` para limpar os dados e rodar as consultas.
3. Visualize os resultados conforme cada pergunta.
