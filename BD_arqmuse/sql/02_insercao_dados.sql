
-- ==========================================
-- PROJETO: ARQMUSE
-- POPULACAO DO BANCO DE DADOS
-- PostgreSQL 18
-- 120 registros por tabela principal
-- 144 registros por tabela associativa
-- ==========================================

BEGIN;

-- ==========================================
-- 1. AUTOR
-- ==========================================

INSERT INTO autor (nome, nacionalidade, data_nascimento, data_falecimento)
SELECT
    (ARRAY[
        'Ana', 'Carlos', 'Maria', 'Joao',
        'Helena', 'Pedro', 'Clara', 'Lucas',
        'Beatriz', 'Rafael', 'Laura', 'Miguel'
    ])[(g - 1) % 12 + 1]
    || ' '
    || (ARRAY[
        'Silva', 'Santos', 'Oliveira', 'Costa',
        'Almeida', 'Ferreira', 'Souza', 'Lima',
        'Carvalho', 'Gomes'
    ])[(g - 1) % 10 + 1],
    (ARRAY[
        'Brasileira', 'Portuguesa', 'Francesa',
        'Italiana', 'Espanhola', 'Argentina'
    ])[(g - 1) % 6 + 1],
    DATE '1940-01-01' + (g * 100),
    CASE
        WHEN g % 4 = 0 THEN NULL
        ELSE DATE '2000-01-01' + (g * 30)
    END
FROM generate_series(1, 120) AS g;


-- ==========================================
-- 2. PROPRIETARIO
-- ==========================================

INSERT INTO proprietario (tipo, nome, contato)
SELECT
    CASE
        WHEN g % 3 = 0 THEN 'Instituição'
        WHEN g % 3 = 1 THEN 'Pessoa física'
        ELSE 'Fundação'
    END,
    'Proprietário ' || LPAD(g::TEXT, 3, '0'),
    'contato' || g || '@arqmuse.com'
FROM generate_series(1, 120) AS g;


-- ==========================================
-- 3. COLECAO
-- ==========================================

INSERT INTO colecao (nome, data_criacao, descricao)
SELECT
    'Coleção ' || LPAD(g::TEXT, 3, '0'),
    DATE '1980-01-01' + (g * 90),
    'Coleção de obras de arte e patrimônio cultural.'
FROM generate_series(1, 120) AS g;


-- ==========================================
-- 4. LOCAL
-- ==========================================

INSERT INTO local (nome, endereco, tipo)
SELECT
    'Local ' || LPAD(g::TEXT, 3, '0'),
    'Rua das Artes, número ' || g || ', Brasil',
    CASE
        WHEN g % 3 = 0 THEN 'Museu'
        WHEN g % 3 = 1 THEN 'Galeria'
        ELSE 'Centro cultural'
    END
FROM generate_series(1, 120) AS g;


-- ==========================================
-- 5. OBRA
-- ==========================================

INSERT INTO obra (
    estado_conservacao,
    titulo,
    ano_criacao,
    descricao,
    dimensoes,
    material,
    tipo
)
SELECT
    CASE
        WHEN g % 3 = 0 THEN 'Excelente'
        WHEN g % 3 = 1 THEN 'Bom'
        ELSE 'Em restauração'
    END,
    'Obra artística ' || LPAD(g::TEXT, 3, '0'),
    1850 + (g % 170),
    'Obra pertencente ao acervo do ArqMuse.',
    (40 + g % 100) || ' x ' || (30 + g % 80) || ' cm',
    CASE
        WHEN g % 4 = 0 THEN 'Óleo sobre tela'
        WHEN g % 4 = 1 THEN 'Madeira'
        WHEN g % 4 = 2 THEN 'Mármore'
        ELSE 'Aquarela sobre papel'
    END,
    CASE
        WHEN g % 4 = 0 THEN 'Pintura'
        WHEN g % 4 = 1 THEN 'Escultura'
        WHEN g % 4 = 2 THEN 'Desenho'
        ELSE 'Gravura'
    END
FROM generate_series(1, 120) AS g;


-- ==========================================
-- 6. EXPOSICAO
-- ==========================================

INSERT INTO exposicao (
    nome, descricao, data_inicio, data_fim, id_local
)
SELECT
    'Exposição ' || LPAD(g::TEXT, 3, '0'),
    'Exposição temática de obras do acervo.',
    DATE '2025-01-01' + (g * 2),
    DATE '2025-02-01' + (g * 2),
    g
FROM generate_series(1, 120) AS g;


-- ==========================================
-- 7. OBRA_AUTOR
-- 144 relacionamentos
-- ==========================================

INSERT INTO obra_autor (id_obra, id_autor)
SELECT g, g
FROM generate_series(1, 120) AS g

UNION ALL

SELECT g, g + 1
FROM generate_series(1, 24) AS g;


-- ==========================================
-- 8. OBRA_COLECAO
-- 144 relacionamentos
-- ==========================================

INSERT INTO obra_colecao (id_obra, id_colecao)
SELECT g, g
FROM generate_series(1, 120) AS g

UNION ALL

SELECT g, g + 1
FROM generate_series(1, 24) AS g;


-- ==========================================
-- 9. POSSE
-- 144 registros de histórico de posse
-- ==========================================

INSERT INTO posse (
    id_obra, id_proprietario, data_inicio, data_fim
)
SELECT
    g,
    g,
    DATE '2000-01-01' + (g * 10),
    DATE '2010-01-01' + (g * 10)
FROM generate_series(1, 120) AS g

UNION ALL

SELECT
    g,
    g + 1,
    DATE '2015-01-01' + (g * 10),
    NULL
FROM generate_series(1, 24) AS g;


-- ==========================================
-- 10. RESTAURACAO
-- ==========================================

INSERT INTO restauracao (
    data_inicio, data_fim, descricao,
    responsavel, custo, id_obra
)
SELECT
    DATE '2020-01-01' + (g * 5),
    DATE '2020-02-01' + (g * 5),
    'Procedimento de conservação e restauração da obra.',
    'Restaurador ' || g,
    500.00 + (g * 25),
    g
FROM generate_series(1, 120) AS g;


-- ==========================================
-- 11. MOVIMENTACAO
-- ==========================================

INSERT INTO movimentacao (
    data_saida, data_retorno, motivo, responsavel,
    id_obra, id_local_origem, id_local_destino
)
SELECT
    DATE '2024-01-01' + (g * 2),
    DATE '2024-01-10' + (g * 2),
    CASE
        WHEN g % 2 = 0 THEN 'Empréstimo para exposição'
        ELSE 'Transferência entre unidades'
    END,
    'Responsável ' || g,
    g,
    g,
    CASE
        WHEN g = 120 THEN 1
        ELSE g + 1
    END
FROM generate_series(1, 120) AS g;


-- ==========================================
-- 12. OBRA_EXPOSICAO
-- 144 relacionamentos
-- ==========================================

INSERT INTO obra_exposicao (
    id_obra, id_exposicao, data_entrada, data_saida
)
SELECT
    g,
    g,
    DATE '2025-01-01' + (g * 2),
    DATE '2025-02-01' + (g * 2)
FROM generate_series(1, 120) AS g

UNION ALL

SELECT
    g,
    g + 1,
    DATE '2025-03-01' + (g * 2),
    DATE '2025-04-01' + (g * 2)
FROM generate_series(1, 24) AS g;


COMMIT;
