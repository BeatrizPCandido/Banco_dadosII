
--criação do banco de dados
CREATE DATABASE Clube_livro_BD

-- Criação da tabela Usuário
CREATE TABLE Usuario (
    ID INT PRIMARY KEY,
    Nome VARCHAR(62) not null,
    Endereco VARCHAR(100) not null,
    Email VARCHAR(100) not null,
    
);
-- dados da tabrla Usuario
insert into Usuario (Id, Nome, Endereco, Email)
 Values
  (1, 'Paulo Andre', 'Rua do Paraiso, 20', 'pandre@gmail.com'),
  (2, 'Camila dos Santos', 'Rua do sol, 120', 'camila@gmail.com'),
  (3, 'Maria Aparecida', 'Alameda Santos, 100', 'maria@gmail.com'),
  (4, 'Jose Maria', 'Rua Angelo, 30', 'jose@gmail.com'),
  (5, 'Marcio de Castro', 'Rua Das Flores', 'marcio@gmail.com'),
  (6, 'Aline Reis', 'Rua Dos Cravos, 48', 'aline@gmail.com')

  select * from usuario

  -- autalização na tabela usuario, na coluna  endereço retirada da numeração 
  update Usuario set Endereco= 'Rua do Paraiso' where id = 1
  update Usuario set Endereco= 'Rua do sol' where id = 2
  update Usuario set Endereco= 'Alameda Santos' where id = 3
  update Usuario set Endereco= 'Rua Angelo' where id = 4
  update Usuario set Endereco= 'Rua Das Flores' where id = 5
  update Usuario set Endereco= 'Rua Dos Cravos' where id = 6

-- Criação da tabela Livro
CREATE TABLE Livro (
    ID INT PRIMARY KEY,
    Titulo VARCHAR(255) not null,
    Autor VARCHAR(100) not null,
    Genero VARCHAR(50) not null,
    AnoPublicacao INT not null,
    QuantidadeDisponivel INT not null,
    
);

--dados da tabel livro 
insert into Livro (ID, Titulo, Autor, Genero, AnoPublicacao, QuantidadeDisponivel)
  values 
    (1, 'A Hipótese Do Amor', 'Ali Hazelwood', 'Romance', 2022, 3)

insert into Livro (ID, Titulo, Autor, Genero, AnoPublicacao, QuantidadeDisponivel)
  values 
    (2, 'Uma segunda chance', 'Colleen Hoover', 'Romance', 2020, 1),
	(3, 'A Paciente Silenciosa', 'Alex Michaelides', 'Suspence', 2019, 6),
	(5, 'Guerra Que Salvou A Minha Vida', 'Kimberly Brubaker Bradley', 'Guerra', 2021, 2),
	(6, 'O Sol É Para Todos', 'Harper Lee', 'Classico', 1960, 5),
	(7, 'O Milagre Da Manhã', 'Hal Elrod', 'Aito_ajuda', 2019, 3),
	(8, 'O Jardim Secreto', 'Frances Hodgson Burnett', 'Classico', 1911, 1),
	(9, 'Autismo: Uma Leitura Espiritual', 'Miranda, Herminio C.', 'Espiritualismo', 2012, 1),
	(10, 'O Médico Da Emoção', 'AUGUSTO CURY', 'Espiritualismo', 2022, 1)

select * from Livro

-- Criação da tabela Venda
CREATE TABLE Venda (
    ID INT PRIMARY KEY,
    ID_Livro INT FOREIGN KEY REFERENCES Livro(ID),
    ID_Comprador INT FOREIGN KEY REFERENCES Usuario(ID),
    DataVenda DATE not null,
    Preco DECIMAL(10, 2) not null,
 
);

--dados da tabela venda 
INSERT INTO Venda (ID, ID_Livro, ID_Comprador, DataVenda, Preco)
VALUES
    (1, 3, 2, '2023-04-01', 49.00);

INSERT INTO Venda (ID, ID_Livro, ID_Comprador, DataVenda, Preco)
VALUES
    (2, 6, 1, '2023-06-01', 49.00),
	(3, 5, 4, '2023-04-09', 69.00),
	(4, 9, 5, '2023-01-01', 10.00),
	(5, 8, 6, '2023-06-01', 59.00)

select * from Venda

-- Criação da tabela Troca
CREATE TABLE Troca (
    ID INT PRIMARY KEY,
    ID_LivroOfertado INT FOREIGN KEY REFERENCES Livro(ID),
    ID_LivroDesejado INT FOREIGN KEY REFERENCES Livro(ID),
    ID_Usuario INT FOREIGN KEY REFERENCES Usuario(ID),
    DataTroca DATE not null,
   
);

--dados da tabela troca
INSERT INTO Troca (ID, ID_LivroOfertado, ID_LivroDesejado, ID_Usuario, DataTroca)
VALUES
    (1, 7, 3, 2, '2023-08-02'),
	(2, 1, 5, 4, '2023-04-11'),
	(3, 2, 6, 1, '2023-07-12'),
	(4, 10, 1, 5, '2023-06-20'),
	(5, 3, 2, 3, '2023-06-04')

select * from Troca

-- Criação da tabela Doacao
CREATE TABLE Doacao (
    ID INT PRIMARY KEY,
    ID_LivroDoado INT FOREIGN KEY REFERENCES Livro(ID),
    ID_Doador INT FOREIGN KEY REFERENCES Usuario(ID),
    DataDoacao DATE not null,
   
);

-- dados da tabela Doacao
insert into Doacao (ID, ID_LivroDoado, ID_Doador, DataDoacao)
values
  (1, 9, 1, '2023-06-14'),
  (2, 7, 4, '2023-09-10'),
  (3, 10, 5, '2023-08-12'),
  (4, 3, 2, '2023-07-04'),
  (5, 1, 6, '2023-06-14')

  
  select * from Troca

  select * from Doacao
  select * from usuario
   select * from Livro

 select * from Venda


  --compra do livro inner join
  select L.Titulo, L.Genero, U.Nome, V.Preco
  from Livro L
  join Usuario U on L.ID = U.ID
  join Venda V  on L.id = V.id

  -- troca do livro Inner Join
  select l.Titulo, l.Genero, u.Nome, t.DataTroca
  from Livro L
  join Usuario U on l.ID = u.ID
  join Troca t  on l.id = t.id

-- doacao Inner Join
select l.Titulo, l.Genero, u.Nome, D.DataDoacao
  from Livro L
  join Usuario U on l.ID = u.ID
  join Doacao D  on l.id = D.id

   --compra do livro Left Join
  select l.Titulo, l.Genero, u.Nome, V.Preco
  from Livro L
  left join Usuario U on l.ID = u.ID
 left join Venda V  on l.id = v.id


 -- troca do livro Left Join
  select l.Titulo, l.Genero, u.Nome, t.DataTroca
  from Livro L
 left  join Usuario U on l.ID = u.ID
  left join Troca t  on l.id = t.id