# ArqMuse

Sistema de gerenciamento de acervos e exposições de museus.

## Sobre o projeto

O **ArqMuse** é um projeto de banco de dados desenvolvido para auxiliar na gestão de acervos e exposições de museus. O sistema busca centralizar e organizar informações relacionadas às obras, autores, coleções, proprietários, exposições, restaurações e movimentações.

O projeto foi desenvolvido no contexto da disciplina de **Banco de Dados**, passando pelas etapas de modelagem conceitual e implementação do banco de dados.

## Objetivos

- Modelar a estrutura de um banco de dados para gerenciamento de acervos;
- Organizar e manter a integridade dos dados;
- Permitir o cadastro e gerenciamento de obras;
- Gerenciar autores e proprietários;
- Controlar coleções e exposições;
- Registrar restaurações realizadas nas obras;
- Acompanhar o histórico de movimentações das obras.

## Funcionalidades

- Cadastro e gerenciamento de obras/objetos;
- Cadastro e gerenciamento de autores;
- Cadastro de proprietários;
- Gerenciamento de coleções;
- Cadastro e gerenciamento de exposições;
- Registro de restaurações;
- Registro de movimentações das obras.

## Modelo Entidade-Relacionamento

O banco de dados é baseado no seguinte modelo conceitual:

> ![Modelo Entidade-Relacionamento](BD_arqmuse/modeloER.png)

O modelo contém as seguintes entidades:

- **Autor** — armazena informações sobre os autores das obras;
- **Obra** — representa os objetos pertencentes ao acervo;
- **Coleção** — organiza as obras em coleções;
- **Proprietário** — registra pessoas ou instituições relacionadas à propriedade das obras;
- **Exposição** — registra as exposições realizadas;
- **Restauração** — registra intervenções de restauração realizadas nas obras;
- **Movimentação** — registra o deslocamento das obras;
- **Local** — representa os locais relacionados às obras e às movimentações.

## Tecnologias

- **MySQL** — Sistema de gerenciamento do banco de dados;
- **SQL** — Linguagem utilizada para criação e manipulação dos dados;
- **Visual Studio Code** — Ambiente de desenvolvimento;
- **Git e GitHub** — Controle de versão e armazenamento do projeto.
