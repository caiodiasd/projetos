-- ======================================
-- PASSO 1 - DADOS IMPORTADOS

-- ======================================

-- ======================================
-- PASSO 2 - CRIAR UMA VERSÃO LIMPA, DESCARTANDO COLUNAS NÃO UTILIZADAS
-- E RENOMEANDO AS COLUNAS PARA PADRÕES MAIS FÁCEIS DE CONSULTAR
-- ======================================

CREATE TABLE hot100_att AS
SELECT 
    "Date" AS date,
    "Song" AS title,
    "Artist" AS artist,
    "Rank" AS rank,
    "Peak Position" AS peak_pos,
    CAST("Weeks in Charts" AS INTEGER) AS weeks_on_chart
FROM hot100;

CREATE TABLE billboard200_att AS
SELECT 
    "Date" AS date,
    "Song" AS title,
    "Artist" AS artist,
    "Rank" AS rank,
    "Peak Position" AS peak_pos,
    CAST("Weeks in Charts" AS INTEGER) AS weeks_on_chart
FROM billboard200;

-- ======================================
-- PERGUNTA 1
-- Quais são os 10 artistas com mais entradas na Hot 100?
-- ======================================

SELECT artist, COUNT(*) AS entradas
FROM hot100_att
GROUP BY artist
ORDER BY entradas DESC
LIMIT 10;

-- ======================================
-- PERGUNTA 2
-- Quais foram as 5 músicas mais bem colocadas na semana mais recente?
-- ======================================

SELECT title, artist, rank, date
FROM hot100_att
WHERE date = (SELECT MAX(date) FROM hot100)
ORDER BY rank ASC
LIMIT 5;

-- ======================================
-- PERGUNTA 3
-- Qual o número total de músicas cadastradas por ano?
-- ======================================

SELECT 
    strftime('%Y', date) AS ano,
    COUNT(DISTINCT title) AS total_musicas
FROM hot100_att
GROUP BY ano
ORDER BY ano;

-- ======================================
-- PERGUNTA 4
-- Liste os 10 artistas que tiveram mais músicas no Top 10 da Hot 100
-- ======================================

SELECT artist, COUNT(DISTINCT title) AS "Total de Músicas no TOP 10"
FROM hot100_att 
WHERE rank <= 10
GROUP BY artist 
ORDER BY "Total de Músicas no TOP 10" DESC
LIMIT 10;

-- ======================================
-- PERGUNTA 5
-- Quais músicas ficaram mais semanas consecutivas no 1º lugar?
--
-- Método:
-- 1. Filtrar apenas as músicas que ficaram em 1º lugar.
-- 2. Usar ROW_NUMBER duas vezes:
--    - A primeira numera cada aparição de uma música em 1º lugar.
--    - A segunda numera todas as aparições em 1º lugar no geral.
-- 3. A diferença cria um identificador de sequência (streak_group).
--    Quando a diferença é constante, indica semanas consecutivas da mesma música no topo.
-- ======================================

WITH ranked_1s AS (
  SELECT 
    title,
    artist,
    date,
    ROW_NUMBER() OVER (PARTITION BY title, artist ORDER BY date) -
    ROW_NUMBER() OVER (ORDER BY date) AS streak_group
  FROM hot100_att
  WHERE rank = 1
),
streaks AS (
  SELECT 
    title,
    artist,
    COUNT(*) AS semanas_consecutivas
  FROM ranked_1s
  GROUP BY title, artist, streak_group
)
SELECT title, artist, MAX(semanas_consecutivas) AS "Maior Streak"
FROM streaks
GROUP BY title, artist
ORDER BY "Maior Streak" DESC
LIMIT 10;

-- ======================================
-- PERGUNTA 6
-- Quais os 5 artistas com mais semanas acumuladas no Top 5 da Hot 100?
-- ======================================

SELECT artist, COUNT(*) AS semanas_no_top_5
FROM hot100_att
WHERE rank <= 5
GROUP BY artist
ORDER BY semanas_no_top_5 DESC
LIMIT 5;

-- ======================================
-- PERGUNTA 7
-- Quais artistas aparecem em ambas as tabelas (Hot 100 e Billboard 200)?
-- ======================================

SELECT DISTINCT h.artist
FROM hot100_att h
INNER JOIN billboard200_att b
  ON h.artist = b.artist;

-- ======================================
-- PERGUNTA 8
-- Qual é o tempo médio que uma música permanece na Hot 100 por década?
-- ======================================

SELECT 
  decada,
  ROUND(AVG(semanas_no_chart), 2) AS media_semanas
FROM (
  SELECT 
    (CAST(strftime('%Y', date) AS INTEGER) / 10) * 10 AS decada,
    title,
    artist,
    COUNT(DISTINCT date) AS semanas_no_chart
  FROM hot100_att
  GROUP BY decada, title, artist
) AS musicas_por_decada
GROUP BY decada
ORDER BY decada;
