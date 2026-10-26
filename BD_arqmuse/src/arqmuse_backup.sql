--
-- PostgreSQL database dump
--

\restrict AZA0fAqxRt1qqdUPhgjz1JcQEq2VQ9OaBoyuIZmNV80CWdAHdJZVDxVHXG0eS9c

-- Dumped from database version 16.15 (Ubuntu 16.15-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.15 (Ubuntu 16.15-0ubuntu0.24.04.1)

-- Started on 2026-10-26 14:29:55 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16633)
-- Name: autor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autor (
    id_autor integer NOT NULL,
    nome character varying(150) NOT NULL,
    nacionalidade character varying(100),
    data_nascimento date,
    data_falecimento date
);


ALTER TABLE public.autor OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16632)
-- Name: autor_id_autor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.autor ALTER COLUMN id_autor ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.autor_id_autor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 16645)
-- Name: colecao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.colecao (
    id_colecao integer NOT NULL,
    nome character varying(150) NOT NULL,
    data_criacao date,
    descricao text
);


ALTER TABLE public.colecao OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16644)
-- Name: colecao_id_colecao_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.colecao ALTER COLUMN id_colecao ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.colecao_id_colecao_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 233 (class 1259 OID 16750)
-- Name: exposicao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exposicao (
    id_exposicao integer NOT NULL,
    nome character varying(150) NOT NULL,
    descricao text,
    data_inicio date,
    data_fim date,
    id_local integer NOT NULL
);


ALTER TABLE public.exposicao OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16749)
-- Name: exposicao_id_exposicao_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.exposicao ALTER COLUMN id_exposicao ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.exposicao_id_exposicao_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 16653)
-- Name: local; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.local (
    id_local integer NOT NULL,
    nome character varying(150) NOT NULL,
    endereco text,
    tipo character varying(50)
);


ALTER TABLE public.local OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16652)
-- Name: local_id_local_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.local ALTER COLUMN id_local ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.local_id_local_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 229 (class 1259 OID 16714)
-- Name: movimentacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movimentacao (
    id_movimentacao integer NOT NULL,
    data_saida date,
    data_retorno date,
    motivo text,
    responsavel character varying(150),
    id_obra integer NOT NULL,
    id_local_origem integer NOT NULL,
    id_local_destino integer NOT NULL
);


ALTER TABLE public.movimentacao OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16713)
-- Name: movimentacao_id_movimentacao_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.movimentacao ALTER COLUMN id_movimentacao ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.movimentacao_id_movimentacao_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 16661)
-- Name: obra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.obra (
    id_obra integer NOT NULL,
    estado_conservacao character varying(100),
    titulo character varying(200) NOT NULL,
    ano_criacao integer,
    descricao text,
    dimensoes character varying(100),
    material character varying(150),
    tipo character varying(100)
);


ALTER TABLE public.obra OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16668)
-- Name: obra_autor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.obra_autor (
    id_obra integer NOT NULL,
    id_autor integer NOT NULL
);


ALTER TABLE public.obra_autor OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16683)
-- Name: obra_colecao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.obra_colecao (
    id_obra integer NOT NULL,
    id_colecao integer NOT NULL
);


ALTER TABLE public.obra_colecao OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16762)
-- Name: obra_exposicao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.obra_exposicao (
    id_obra integer NOT NULL,
    id_exposicao integer NOT NULL,
    data_entrada date,
    data_saida date
);


ALTER TABLE public.obra_exposicao OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16660)
-- Name: obra_id_obra_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.obra ALTER COLUMN id_obra ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.obra_id_obra_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 227 (class 1259 OID 16698)
-- Name: posse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posse (
    id_obra integer NOT NULL,
    id_proprietario integer NOT NULL,
    data_inicio date NOT NULL,
    data_fim date
);


ALTER TABLE public.posse OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16639)
-- Name: proprietario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proprietario (
    id_proprietario integer NOT NULL,
    tipo character varying(50),
    nome character varying(150) NOT NULL,
    contato character varying(150)
);


ALTER TABLE public.proprietario OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16638)
-- Name: proprietario_id_proprietario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.proprietario ALTER COLUMN id_proprietario ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.proprietario_id_proprietario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 231 (class 1259 OID 16737)
-- Name: restauracao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restauracao (
    id_restauracao integer NOT NULL,
    data_inicio date,
    data_fim date,
    descricao text,
    responsavel character varying(150),
    custo numeric(12,2),
    id_obra integer NOT NULL
);


ALTER TABLE public.restauracao OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16736)
-- Name: restauracao_id_restauracao_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.restauracao ALTER COLUMN id_restauracao ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.restauracao_id_restauracao_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3519 (class 0 OID 16633)
-- Dependencies: 216
-- Data for Name: autor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.autor (id_autor, nome, nacionalidade, data_nascimento, data_falecimento) FROM stdin;
\.


--
-- TOC entry 3523 (class 0 OID 16645)
-- Dependencies: 220
-- Data for Name: colecao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.colecao (id_colecao, nome, data_criacao, descricao) FROM stdin;
\.


--
-- TOC entry 3536 (class 0 OID 16750)
-- Dependencies: 233
-- Data for Name: exposicao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exposicao (id_exposicao, nome, descricao, data_inicio, data_fim, id_local) FROM stdin;
\.


--
-- TOC entry 3525 (class 0 OID 16653)
-- Dependencies: 222
-- Data for Name: local; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.local (id_local, nome, endereco, tipo) FROM stdin;
\.


--
-- TOC entry 3532 (class 0 OID 16714)
-- Dependencies: 229
-- Data for Name: movimentacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movimentacao (id_movimentacao, data_saida, data_retorno, motivo, responsavel, id_obra, id_local_origem, id_local_destino) FROM stdin;
\.


--
-- TOC entry 3527 (class 0 OID 16661)
-- Dependencies: 224
-- Data for Name: obra; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.obra (id_obra, estado_conservacao, titulo, ano_criacao, descricao, dimensoes, material, tipo) FROM stdin;
\.


--
-- TOC entry 3528 (class 0 OID 16668)
-- Dependencies: 225
-- Data for Name: obra_autor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.obra_autor (id_obra, id_autor) FROM stdin;
\.


--
-- TOC entry 3529 (class 0 OID 16683)
-- Dependencies: 226
-- Data for Name: obra_colecao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.obra_colecao (id_obra, id_colecao) FROM stdin;
\.


--
-- TOC entry 3537 (class 0 OID 16762)
-- Dependencies: 234
-- Data for Name: obra_exposicao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.obra_exposicao (id_obra, id_exposicao, data_entrada, data_saida) FROM stdin;
\.


--
-- TOC entry 3530 (class 0 OID 16698)
-- Dependencies: 227
-- Data for Name: posse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posse (id_obra, id_proprietario, data_inicio, data_fim) FROM stdin;
\.


--
-- TOC entry 3521 (class 0 OID 16639)
-- Dependencies: 218
-- Data for Name: proprietario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proprietario (id_proprietario, tipo, nome, contato) FROM stdin;
\.


--
-- TOC entry 3534 (class 0 OID 16737)
-- Dependencies: 231
-- Data for Name: restauracao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.restauracao (id_restauracao, data_inicio, data_fim, descricao, responsavel, custo, id_obra) FROM stdin;
\.


--
-- TOC entry 3543 (class 0 OID 0)
-- Dependencies: 215
-- Name: autor_id_autor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.autor_id_autor_seq', 1, false);


--
-- TOC entry 3544 (class 0 OID 0)
-- Dependencies: 219
-- Name: colecao_id_colecao_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.colecao_id_colecao_seq', 1, false);


--
-- TOC entry 3545 (class 0 OID 0)
-- Dependencies: 232
-- Name: exposicao_id_exposicao_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exposicao_id_exposicao_seq', 1, false);


--
-- TOC entry 3546 (class 0 OID 0)
-- Dependencies: 221
-- Name: local_id_local_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.local_id_local_seq', 1, false);


--
-- TOC entry 3547 (class 0 OID 0)
-- Dependencies: 228
-- Name: movimentacao_id_movimentacao_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movimentacao_id_movimentacao_seq', 1, false);


--
-- TOC entry 3548 (class 0 OID 0)
-- Dependencies: 223
-- Name: obra_id_obra_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.obra_id_obra_seq', 1, false);


--
-- TOC entry 3549 (class 0 OID 0)
-- Dependencies: 217
-- Name: proprietario_id_proprietario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proprietario_id_proprietario_seq', 1, false);


--
-- TOC entry 3550 (class 0 OID 0)
-- Dependencies: 230
-- Name: restauracao_id_restauracao_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.restauracao_id_restauracao_seq', 1, false);


--
-- TOC entry 3339 (class 2606 OID 16637)
-- Name: autor autor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autor
    ADD CONSTRAINT autor_pkey PRIMARY KEY (id_autor);


--
-- TOC entry 3343 (class 2606 OID 16651)
-- Name: colecao colecao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colecao
    ADD CONSTRAINT colecao_pkey PRIMARY KEY (id_colecao);


--
-- TOC entry 3359 (class 2606 OID 16756)
-- Name: exposicao exposicao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exposicao
    ADD CONSTRAINT exposicao_pkey PRIMARY KEY (id_exposicao);


--
-- TOC entry 3345 (class 2606 OID 16659)
-- Name: local local_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.local
    ADD CONSTRAINT local_pkey PRIMARY KEY (id_local);


--
-- TOC entry 3355 (class 2606 OID 16720)
-- Name: movimentacao movimentacao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimentacao
    ADD CONSTRAINT movimentacao_pkey PRIMARY KEY (id_movimentacao);


--
-- TOC entry 3349 (class 2606 OID 16672)
-- Name: obra_autor obra_autor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obra_autor
    ADD CONSTRAINT obra_autor_pkey PRIMARY KEY (id_obra, id_autor);


--
-- TOC entry 3351 (class 2606 OID 16687)
-- Name: obra_colecao obra_colecao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obra_colecao
    ADD CONSTRAINT obra_colecao_pkey PRIMARY KEY (id_obra, id_colecao);


--
-- TOC entry 3361 (class 2606 OID 16766)
-- Name: obra_exposicao obra_exposicao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obra_exposicao
    ADD CONSTRAINT obra_exposicao_pkey PRIMARY KEY (id_obra, id_exposicao);


--
-- TOC entry 3347 (class 2606 OID 16667)
-- Name: obra obra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obra
    ADD CONSTRAINT obra_pkey PRIMARY KEY (id_obra);


--
-- TOC entry 3353 (class 2606 OID 16702)
-- Name: posse posse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posse
    ADD CONSTRAINT posse_pkey PRIMARY KEY (id_obra, id_proprietario, data_inicio);


--
-- TOC entry 3341 (class 2606 OID 16643)
-- Name: proprietario proprietario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proprietario
    ADD CONSTRAINT proprietario_pkey PRIMARY KEY (id_proprietario);


--
-- TOC entry 3357 (class 2606 OID 16743)
-- Name: restauracao restauracao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restauracao
    ADD CONSTRAINT restauracao_pkey PRIMARY KEY (id_restauracao);


--
-- TOC entry 3372 (class 2606 OID 16757)
-- Name: exposicao exposicao_id_local_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exposicao
    ADD CONSTRAINT exposicao_id_local_fkey FOREIGN KEY (id_local) REFERENCES public.local(id_local);


--
-- TOC entry 3368 (class 2606 OID 16731)
-- Name: movimentacao movimentacao_id_local_destino_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimentacao
    ADD CONSTRAINT movimentacao_id_local_destino_fkey FOREIGN KEY (id_local_destino) REFERENCES public.local(id_local);


--
-- TOC entry 3369 (class 2606 OID 16726)
-- Name: movimentacao movimentacao_id_local_origem_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimentacao
    ADD CONSTRAINT movimentacao_id_local_origem_fkey FOREIGN KEY (id_local_origem) REFERENCES public.local(id_local);


--
-- TOC entry 3370 (class 2606 OID 16721)
-- Name: movimentacao movimentacao_id_obra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimentacao
    ADD CONSTRAINT movimentacao_id_obra_fkey FOREIGN KEY (id_obra) REFERENCES public.obra(id_obra);


--
-- TOC entry 3362 (class 2606 OID 16678)
-- Name: obra_autor obra_autor_id_autor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obra_autor
    ADD CONSTRAINT obra_autor_id_autor_fkey FOREIGN KEY (id_autor) REFERENCES public.autor(id_autor) ON DELETE CASCADE;


--
-- TOC entry 3363 (class 2606 OID 16673)
-- Name: obra_autor obra_autor_id_obra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obra_autor
    ADD CONSTRAINT obra_autor_id_obra_fkey FOREIGN KEY (id_obra) REFERENCES public.obra(id_obra) ON DELETE CASCADE;


--
-- TOC entry 3364 (class 2606 OID 16693)
-- Name: obra_colecao obra_colecao_id_colecao_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obra_colecao
    ADD CONSTRAINT obra_colecao_id_colecao_fkey FOREIGN KEY (id_colecao) REFERENCES public.colecao(id_colecao) ON DELETE CASCADE;


--
-- TOC entry 3365 (class 2606 OID 16688)
-- Name: obra_colecao obra_colecao_id_obra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obra_colecao
    ADD CONSTRAINT obra_colecao_id_obra_fkey FOREIGN KEY (id_obra) REFERENCES public.obra(id_obra) ON DELETE CASCADE;


--
-- TOC entry 3373 (class 2606 OID 16772)
-- Name: obra_exposicao obra_exposicao_id_exposicao_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obra_exposicao
    ADD CONSTRAINT obra_exposicao_id_exposicao_fkey FOREIGN KEY (id_exposicao) REFERENCES public.exposicao(id_exposicao) ON DELETE CASCADE;


--
-- TOC entry 3374 (class 2606 OID 16767)
-- Name: obra_exposicao obra_exposicao_id_obra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.obra_exposicao
    ADD CONSTRAINT obra_exposicao_id_obra_fkey FOREIGN KEY (id_obra) REFERENCES public.obra(id_obra) ON DELETE CASCADE;


--
-- TOC entry 3366 (class 2606 OID 16703)
-- Name: posse posse_id_obra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posse
    ADD CONSTRAINT posse_id_obra_fkey FOREIGN KEY (id_obra) REFERENCES public.obra(id_obra) ON DELETE CASCADE;


--
-- TOC entry 3367 (class 2606 OID 16708)
-- Name: posse posse_id_proprietario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posse
    ADD CONSTRAINT posse_id_proprietario_fkey FOREIGN KEY (id_proprietario) REFERENCES public.proprietario(id_proprietario) ON DELETE CASCADE;


--
-- TOC entry 3371 (class 2606 OID 16744)
-- Name: restauracao restauracao_id_obra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restauracao
    ADD CONSTRAINT restauracao_id_obra_fkey FOREIGN KEY (id_obra) REFERENCES public.obra(id_obra);


-- Completed on 2026-10-26 14:29:55 -03

--
-- PostgreSQL database dump complete
--

\unrestrict AZA0fAqxRt1qqdUPhgjz1JcQEq2VQ9OaBoyuIZmNV80CWdAHdJZVDxVHXG0eS9c

