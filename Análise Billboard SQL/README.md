# Projeto SQL - Análise Billboard

Este projeto tem como objetivo explorar os dados históricos das paradas musicais **Billboard Hot 100** e **Billboard 200** utilizando consultas SQL. A análise foi feita a partir de arquivos CSV contendo registros semanais de músicas e álbuns que figuraram nas principais paradas norte-americanas.

## 📁 Estrutura do Projeto

- `hot100.csv` – Dados da Billboard Hot 100.
- `billboard200.csv` – Dados da Billboard 200.
- `billboard_query_sql` – Script SQL com limpeza, criação de tabelas e queries de análise.

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

## 🎵 Conclusões Possíveis do Projeto

📌 1. Dominância de artistas no mercado
Através das perguntas 1 e 4, vemos quais artistas dominaram os rankings da Billboard Hot 100 em número de entradas e presença no Top 10.


📌 2. Sucessos recentes versus clássicos
A pergunta 2 nos mostra quais músicas estão atualmente se destacando, o que ajuda a entender tendências atuais.

Comparando com outros anos (pergunta 3 e 8), podemos observar mudanças no padrão de consumo musical ao longo das décadas.

📌 3. Longevidade de músicas nos charts
A pergunta 5 revela quais músicas tiveram maior desempenho contínuo, ficando semanas seguidas no 1º lugar.

Isso mostra impacto e aceitação do público por certos hits.

📌 4. Artistas com maior consistência
A pergunta 6 revela quais artistas mantêm músicas constantemente entre os 5 primeiros, o que mostra poder de engajamento e recorrência de sucesso.

📌 5. Intersecção entre sucesso de singles e álbuns
A pergunta 7 nos mostra quais artistas têm sucesso tanto na Hot 100 (singles) quanto na Billboard 200 (álbuns).

Indicando artistas com carreira sólida e versátil.

📌 6. Mudança no comportamento da indústria
A pergunta 8 nos permite ver quanto tempo, em média, uma música permanece no Hot 100 por década.

Pode revelar se hoje os sucessos são mais efêmeros do que nas décadas anteriores, talvez por conta do streaming e viralização.


## 📂 Fonte de Dados

Os dados utilizados neste projeto foram obtidos a partir do Kaggle:

- Dataset: [Billboard Hot 100 & Billboard 200](https://www.kaggle.com/datasets/ludmin/billboard)  
- Licença: MIT License – [veja os termos](https://www.mit.edu/~amini/LICENSE.md)

Este projeto é de caráter educacional e analítico, e respeita os termos de uso dos dados públicos disponibilizados pelo autor no Kaggle.