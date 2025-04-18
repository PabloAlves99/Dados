-- Banco de dados para estudos de SQL

-- Criando schema para o banco de dados estudos ( Ja existente e configurado no MySQL Workbench )
CREATE SCHEMA IF NOT EXISTS estudos;


-- Criando tabelas no schema estudos
CREATE TABLE LIVROS (
    ID_LIVRO INT NOT NULL,
    NOME_LIVRO VARCHAR(100) NOT NULL,
    AUTORIA VARCHAR(100) NOT NULL,
    EDITORA VARCHAR(100) NOT NULL,
    CATEGORIA VARCHAR(100) NOT NULL,
    PREÇO DECIMAL(5,2) NOT NULL,  
 PRIMARY KEY (ID_LIVRO)
);

CREATE TABLE ESTOQUE (
    ID_LIVRO INT NOT NULL,
    QTD_ESTOQUE INT NOT NULL,
 PRIMARY KEY (ID_LIVRO)
);

CREATE TABLE VENDAS (
    ID_PEDIDO INT NOT NULL,
    ID_VENDEDOR INT NOT NULL,
    ID_LIVRO INT NOT NULL,
    QTD_VENDIDA INT NOT NULL,
    DATA_VENDA DATE NOT NULL,
 PRIMARY KEY (ID_VENDEDOR,ID_PEDIDO)
);

CREATE TABLE VENDEDORES (
    ID_VENDEDOR INT NOT NULL,
    NOME_VENDEDOR VARCHAR(255) NOT NULL,
 PRIMARY KEY (ID_VENDEDOR)
);


-- Inserir forein key
ALTER TABLE ESTOQUE
ADD CONSTRAINT CE_ESTOQUE_LIVROS
FOREIGN KEY (ID_LIVRO) 
REFERENCES LIVROS(ID_LIVRO)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE VENDAS
ADD CONSTRAINT CE_VENDAS_LIVROS
FOREIGN KEY (ID_LIVRO)
REFERENCES LIVROS(ID_LIVRO)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE VENDAS
ADD CONSTRAINT CE_VENDAS_VENDEDORES
FOREIGN KEY (ID_VENDEDOR)
REFERENCES VENDEDORES(ID_VENDEDOR)
ON DELETE NO ACTION
ON UPDATE NO ACTION;


-- Inserir dados

INSERT INTO LIVROS (ID_LIVRO, NOME_LIVRO, AUTORIA, EDITORA, CATEGORIA, PREÇO) VALUES
(1, 'SQL Para Iniciantes', 'Ana Costa', 'TechBooks', 'Tecnologia', 59.90),
(2, 'Dominando Python', 'Carlos Silva', 'CodePress', 'Tecnologia', 79.90),
(3, 'Romance em Veneza', 'Laura Melo', 'Amor&Leitura', 'Romance', 39.90),
(4, 'História do Brasil', 'João Prado', 'EducLivros', 'História', 49.90),
(5, 'Aventuras na Lua', 'Tiago Luz', 'FicçãoTop', 'Ficção Científica', 44.90),
(6, 'Aprendendo Java', 'Mariana Lima', 'CodePress', 'Tecnologia', 69.90),
(10, 'Viagem ao Centro da Terra', 'Jules Verne', 'Clássicos', 'Ficção Científica', 34.90),
(11, 'O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 'Clássicos', 'Ficção', 24.90),
(12, 'A Arte da Guerra', 'Sun Tzu', 'Clássicos', 'Estratégia', 19.90),
(13, 'O Senhor dos Anéis', 'J.R.R. Tolkien', 'Fantasia', 'Ficção Fantástica', 99.90),
(14, '1984', 'George Orwell', 'Clássicos', 'Distopia', 29.90),
(15, 'O Alquimista', 'Paulo Coelho', 'Ficção Brasileira', 'Ficção', 39.90),
(16, 'O Código Da Vinci', 'Dan Brown', 'Ficção', 'Mistério', 49.90),
(17, 'O Hobbit', 'J.R.R. Tolkien', 'Fantasia', 'Ficção Fantástica', 44.90),
(18, 'O Guia do Mochileiro das Galáxias', 'Douglas Adams', 'Ficção Científica', 'Comédia', 34.90),
(19, 'O Lobo de Wall Street', 'Jordan Belfort', 'Biografia', 'Negócios', 59.90),
(20, 'A Revolução dos Bichos', 'George Orwell', 'Clássicos', 'Fábula', 19.90);

INSERT INTO ESTOQUE (ID_LIVRO, QTD_ESTOQUE) VALUES
(1, 20),
(2, 15),
(3, 10),
(4, 12),
(5, 18),
(6, 22),
(10, 9),
(11, 30),
(12, 25),
(13, 7),
(14, 14),
(15, 16),
(16, 13),
(17, 11),
(18, 17),
(19, 8),
(20, 21);

INSERT INTO VENDEDORES (ID_VENDEDOR, NOME_VENDEDOR) VALUES
(1, 'Carlos Mendes'),
(2, 'Fernanda Lima'),
(3, 'João Oliveira'),
(4, 'Patrícia Souza');

INSERT INTO VENDAS (ID_PEDIDO, ID_VENDEDOR, ID_LIVRO, QTD_VENDIDA, DATA_VENDA) VALUES
(1001, 1, 1, 2, '2025-04-10'),
(1002, 1, 3, 1, '2025-04-11'),
(1003, 2, 2, 3, '2025-04-12'),
(1004, 2, 10, 1, '2025-04-13'),
(1005, 3, 5, 2, '2025-04-14'),
(1006, 3, 11, 1, '2025-04-15'),
(1007, 4, 6, 1, '2025-04-15'),
(1008, 1, 13, 2, '2025-04-16'),
(1009, 2, 14, 1, '2025-04-16'),
(1010, 4, 20, 3, '2025-04-17');


-- Visualizar dados

select NOME_LIVRO as 'Nome dos Livros' from LIVROS;
select NOME_LIVRO as 'Nome dos Livros', AUTORIA as 'Autor' from liLIVROSvros;

select NOME_LIVRO as 'NOME DOS LIVROS' from LIVROS
where categoria = 'tecnologia';

select NOME_LIVRO as 'NOME DOS LIVROS', PREÇO from LIVROS
where categoria = 'tecnologia' and PREÇO < 70;

select NOME_LIVRO as 'NOME DOS LIVROS', PREÇO from LIVROS
where categoria = 'tecnologia' and PREÇO between 50 and 70;

select NOME_LIVRO as 'NOME DOS LIVROS', PREÇO from LIVROS
where NOME_LIVRO like '%python'

