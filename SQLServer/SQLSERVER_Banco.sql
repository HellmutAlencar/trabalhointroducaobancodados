DROP DATABASE IF EXISTS livraria;
CREATE DATABASE livraria;
USE livraria;

CREATE TABLE usuarios (
    cpf char(11) NOT NULL PRIMARY KEY,
    nome varchar(50) NOT NULL,
    endereco varchar(200) NOT NULL,
    telefone varchar(50) NOT NULL,
    email varchar(50) NOT NULL,
)

CREATE TABLE autores (
    id_autor smallint IDENTITY(1, 1) NOT NULL PRIMARY KEY,
    nome_autor varchar(50) NOT NULL,
    sobrenome_autor varchar(50) NOT NULL,
)

CREATE TABLE categorias (
    id_categoria smallint IDENTITY(1, 1) NOT NULL PRIMARY KEY,
    nome_categoria varchar(50) NOT NULL,
)

CREATE TABLE livros (
    isbn char(17) NOT NULL PRIMARY KEY,
    titulo_livro varchar(100) NOT NULL,
    data_de_publicacao date NOT NULL,
    id_autor smallint FOREIGN KEY REFERENCES autores(id_autor),
    id_categoria smallint FOREIGN KEY REFERENCES categorias(id_categoria),
)

CREATE TABLE livros_emprestados (
    id_de_emprestimo int IDENTITY (1, 1) NOT NULL PRIMARY KEY,
    data_expedido date NOT NULL,
    data_limite date NOT NULL,
    data_retornado date DEFAULT NULL,
    id_contrato char(13) NOT NULL UNIQUE,
    cpf char(11) FOREIGN KEY REFERENCES usuarios(cpf),
    isbn char(17) FOREIGN KEY REFERENCES livros(isbn),
)