DROP DATABASE IF EXISTS `livraria`;
CREATE DATABASE `livraria`; 
USE `livraria`;

SET NAMES utf8;
SET character_set_client = utf8mb4;

CREATE TABLE `usuarios` (
   `cpf` char(11) NOT NULL,
   `nome` varchar(50) NOT NULL,
   `endereco` varchar(200) NOT NULL,
   `telefone` varchar(50) NOT NULL,
   `email` varchar(50) NOT NULL,
   PRIMARY KEY (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `autores` (
   `id_autor` smallint NOT NULL AUTO_INCREMENT,
   `nome_autor` varchar(50) NOT NULL,
   `sobrenome_autor` varchar(50) NOT NULL,
   PRIMARY KEY (`id_autor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `categorias` (
   `id_categoria` smallint NOT NULL AUTO_INCREMENT,
   `nome_categoria` varchar(50) NOT NULL,
   PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `livros` (
   `isbn` char(17) NOT NULL,
   `titulo_livro` varchar(100) NOT NULL,
   `data_de_publicacao` date NOT NULL,
   `id_autor` smallint NOT NULL,
   `id_categoria` smallint NOT NULL,
   PRIMARY KEY (`isbn`),
   KEY `FK_id_autor` (`id_autor`),
   CONSTRAINT `FK_id_autor` FOREIGN KEY (`id_autor`) REFERENCES `autores` (`id_autor`) ON UPDATE CASCADE,
   KEY `FK_id_categoria` (`id_categoria`),
   CONSTRAINT `FK_id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `livros_emprestados` (
   `id_de_emprestimo` int NOT NULL AUTO_INCREMENT,
   `data_expedido` date NOT NULL,
   `data_limite` date NOT NULL,
   `data_retornado` date DEFAULT NULL,
   `id_contrato` char(13) NOT NULL,
   `cpf` char(11) NOT NULL,
   `isbn` char(17) NOT NULL,
   PRIMARY KEY (`id_de_emprestimo`),
   UNIQUE (`id_contrato`),
   KEY `FK_cpf` (`cpf`),
   CONSTRAINT `FK_cpf` FOREIGN KEY (`cpf`) REFERENCES `usuarios` (`cpf`) ON DELETE RESTRICT ON UPDATE CASCADE,
   KEY `FK_isbn` (`isbn`),
   CONSTRAINT `FK_isbn` FOREIGN KEY (`isbn`) REFERENCES `livros` (`isbn`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;