-- ============================================
-- CONSULTA 1: Obras e seus respectivos autores

-- ============================================

SELECT o.id_obra, o.titulo, a.nome AS autor
FROM obra o
JOIN obra_autor oa ON o.id_obra = oa.id_obra
JOIN autor a ON oa.id_autor = a.id_autor
ORDER BY o.id_obra;

-- ============================================
-- CONSULTA 2: Obras pertencentes às coleções
-- ============================================

SELECT o.titulo, c.nome AS colecao
FROM obra o
JOIN obra_colecao oc ON o.id_obra = oc.id_obra
JOIN colecao c ON oc.id_colecao = c.id_colecao
ORDER BY c.nome, o.titulo;

-- ============================================
-- CONSULTA 3: Histórico de posse das obras
-- ============================================

SELECT o.titulo, p.nome AS proprietario,
       ps.data_inicio, ps.data_fim
FROM posse ps
JOIN obra o ON ps.id_obra = o.id_obra
JOIN proprietario p ON ps.id_proprietario = p.id_proprietario
ORDER BY o.id_obra, ps.data_inicio;

-- ============================================
-- CONSULTA 4: Exposições e seus respectivos locais
-- ============================================

SELECT e.nome AS exposicao,
       l.nome AS local,
       e.data_inicio, e.data_fim
FROM exposicao e
JOIN local l ON e.id_local = l.id_local
ORDER BY e.data_inicio;

-- ============================================
-- CONSULTA 5: Obras apresentadas em cada exposição
-- ============================================

SELECT o.titulo, e.nome AS exposicao,
       oe.data_entrada, oe.data_saida
FROM obra_exposicao oe
JOIN obra o ON oe.id_obra = o.id_obra
JOIN exposicao e ON oe.id_exposicao = e.id_exposicao
ORDER BY e.nome, o.titulo;

-- ============================================
-- CONSULTA 6: Histórico de restaurações
-- ============================================

SELECT o.titulo, r.data_inicio, r.data_fim,
       r.responsavel, r.custo
FROM restauracao r
JOIN obra o ON r.id_obra = o.id_obra
ORDER BY r.custo DESC;

-- ============================================
-- CONSULTA 7: Histórico de movimentação das obras
-- ============================================


SELECT o.titulo,
       lo.nome AS local_origem,
       ld.nome AS local_destino,
       m.data_saida, m.data_retorno,
       m.motivo, m.responsavel
FROM movimentacao m
JOIN obra o ON m.id_obra = o.id_obra
JOIN local lo ON m.id_local_origem = lo.id_local
JOIN local ld ON m.id_local_destino = ld.id_local
ORDER BY m.data_saida;

-- ============================================
-- CONSULTA 8: Quantidade de obras por coleção
-- ============================================

SELECT c.nome AS colecao,
       COUNT(oc.id_obra) AS quantidade_obras
FROM colecao c
JOIN obra_colecao oc ON c.id_colecao = oc.id_colecao
GROUP BY c.id_colecao, c.nome
ORDER BY quantidade_obras DESC;

-- ============================================
-- CONSULTA 9: Quantidade de obras por autor
-- ============================================

SELECT a.nome AS autor,
       COUNT(oa.id_obra) AS quantidade_obras
FROM autor a
JOIN obra_autor oa ON a.id_autor = oa.id_autor
GROUP BY a.id_autor, a.nome
ORDER BY quantidade_obras DESC;

-- ============================================
-- CONSULTA 10: Obras que estão em restauração
-- ============================================

SELECT id_obra, titulo, estado_conservacao
FROM obra
WHERE estado_conservacao = 'Em restauração'
ORDER BY titulo;

-- ============================================
-- CONSULTA 11: Coleções com mais de uma obra
-- ============================================

SELECT c.nome AS colecao,
       COUNT(oc.id_obra) AS quantidade_obras
FROM colecao c
JOIN obra_colecao oc ON c.id_colecao = oc.id_colecao
GROUP BY c.id_colecao, c.nome
HAVING COUNT(oc.id_obra) > 1
ORDER BY quantidade_obras DESC;

-- ============================================
-- CONSULTA 12: Proprietários associados a mais de uma obra
-- ============================================

SELECT p.nome AS proprietario,
       COUNT(ps.id_obra) AS quantidade_obras
FROM proprietario p
JOIN posse ps ON p.id_proprietario = ps.id_proprietario
GROUP BY p.id_proprietario, p.nome
HAVING COUNT(ps.id_obra) > 1
ORDER BY quantidade_obras DESC;
