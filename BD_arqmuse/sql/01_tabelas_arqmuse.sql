

-- ==========================================
-- PROJETO: GESTAO DE OBRAS DE ARTE
-- PostgreSQL 18
-- ==========================================

-- 1. AUTOR
CREATE TABLE autor (
    id_autor INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    nacionalidade VARCHAR(100),
    data_nascimento DATE,
    data_falecimento DATE
);

-- 2. PROPRIETARIO
CREATE TABLE proprietario (
    id_proprietario INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    tipo VARCHAR(50),
    nome VARCHAR(150) NOT NULL,
    contato VARCHAR(150)
);

-- 3. COLECAO
CREATE TABLE colecao (
    id_colecao INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    data_criacao DATE,
    descricao TEXT
);

-- 4. LOCAL
CREATE TABLE local (
    id_local INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    endereco TEXT,
    tipo VARCHAR(50)
);

-- 5. OBRA
CREATE TABLE obra (
    id_obra INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    estado_conservacao VARCHAR(100),
    titulo VARCHAR(200) NOT NULL,
    ano_criacao INTEGER,
    descricao TEXT,
    dimensoes VARCHAR(100),
    material VARCHAR(150),
    tipo VARCHAR(100)
);

-- 6. RELACIONAMENTO ENTRE OBRA E AUTOR (N:N)
CREATE TABLE obra_autor (
    id_obra INTEGER NOT NULL,
    id_autor INTEGER NOT NULL,

    PRIMARY KEY (id_obra, id_autor),

    FOREIGN KEY (id_obra)
        REFERENCES obra(id_obra)
        ON DELETE CASCADE,

    FOREIGN KEY (id_autor)
        REFERENCES autor(id_autor)
        ON DELETE CASCADE
);

-- 7. RELACIONAMENTO ENTRE OBRA E COLECAO (N:N)
CREATE TABLE obra_colecao (
    id_obra INTEGER NOT NULL,
    id_colecao INTEGER NOT NULL,

    PRIMARY KEY (id_obra, id_colecao),

    FOREIGN KEY (id_obra)
        REFERENCES obra(id_obra)
        ON DELETE CASCADE,

    FOREIGN KEY (id_colecao)
        REFERENCES colecao(id_colecao)
        ON DELETE CASCADE
);

-- 8. RELACIONAMENTO ENTRE OBRA E PROPRIETARIO (N:N)
-- Guarda o periodo de posse de cada proprietario.
CREATE TABLE posse (
    id_obra INTEGER NOT NULL,
    id_proprietario INTEGER NOT NULL,
    data_inicio DATE,
    data_fim DATE,

    PRIMARY KEY (id_obra, id_proprietario, data_inicio),

    FOREIGN KEY (id_obra)
        REFERENCES obra(id_obra)
        ON DELETE CASCADE,

    FOREIGN KEY (id_proprietario)
        REFERENCES proprietario(id_proprietario)
        ON DELETE CASCADE
);

-- 9. MOVIMENTACAO
CREATE TABLE movimentacao (
    id_movimentacao INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    data_saida DATE,
    data_retorno DATE,
    motivo TEXT,
    responsavel VARCHAR(150),

    id_obra INTEGER NOT NULL,
    id_local_origem INTEGER NOT NULL,
    id_local_destino INTEGER NOT NULL,

    FOREIGN KEY (id_obra)
        REFERENCES obra(id_obra),

    FOREIGN KEY (id_local_origem)
        REFERENCES local(id_local),

    FOREIGN KEY (id_local_destino)
        REFERENCES local(id_local)
);

-- 10. RESTAURACAO
CREATE TABLE restauracao (
    id_restauracao INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    data_inicio DATE,
    data_fim DATE,
    descricao TEXT,
    responsavel VARCHAR(150),
    custo NUMERIC(12,2),

    id_obra INTEGER NOT NULL,

    FOREIGN KEY (id_obra)
        REFERENCES obra(id_obra)
);

-- 11. EXPOSICAO
CREATE TABLE exposicao (
    id_exposicao INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    descricao TEXT,
    data_inicio DATE,
    data_fim DATE,

    id_local INTEGER NOT NULL,

    FOREIGN KEY (id_local)
        REFERENCES local(id_local)
);

-- 12. RELACIONAMENTO ENTRE OBRA E EXPOSICAO (N:N)
-- Guarda a entrada e a saida de cada obra na exposicao.
CREATE TABLE obra_exposicao (
    id_obra INTEGER NOT NULL,
    id_exposicao INTEGER NOT NULL,
    data_entrada DATE,
    data_saida DATE,

    PRIMARY KEY (id_obra, id_exposicao),

    FOREIGN KEY (id_obra)
        REFERENCES obra(id_obra)
        ON DELETE CASCADE,

    FOREIGN KEY (id_exposicao)
        REFERENCES exposicao(id_exposicao)
        ON DELETE CASCADE
);