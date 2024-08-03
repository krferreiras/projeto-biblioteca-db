-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 31/07/2024 às 22:51
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `cep` int(8) NOT NULL,
  `address` varchar(45) NOT NULL,
  `neighborhood` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura para tabela `authors`
--

CREATE TABLE `authors` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Despejando dados para a tabela `authors`
--

INSERT INTO `authors` (`id`, `first_name`, `last_name`, `country`) VALUES
(1, 'George', 'Martin', 'Estados Unidos da América'),
(2, 'John', 'Tolkien', 'África do Sul'),
(3, 'Pablo', 'Marçal', 'Brasil');

-- --------------------------------------------------------

--
-- Estrutura para tabela `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `publication` year(4) NOT NULL,
  `isbn` bigint(13) NOT NULL,
  `amount` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `loan_id` int(11) DEFAULT NULL,
  `loan_status_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Despejando dados para a tabela `books`
--

INSERT INTO `books` (`id`, `title`, `publication`, `isbn`, `amount`, `category_id`, `loan_id`, `loan_status_id`) VALUES
(1, 'A Guerra dos Tronos : As Crônicas de Gelo e F', '2019', 9788556510785, 15, 1, NULL, NULL),
(2, 'A fúria dos reis: As Crônicas de Gelo e Fogo,', '2019', 9788556510792, 12, 1, NULL, NULL),
(3, 'A tormenta de espadas: As Crônicas de Gelo e ', '2019', 9788556510808, 8, 1, NULL, NULL),
(4, 'O Festim dos Corvos: As Crônicas de Gelo e Fo', '2019', 9788556510884, 13, 1, NULL, NULL),
(5, 'A dança dos dragões: As Crônicas de Gelo e Fo', '2019', 9788556510907, 19, 1, NULL, NULL),
(6, 'Fogo & Sangue – Volume 1', '2018', 9788556510761, 3, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `books_has_author`
--

CREATE TABLE `books_has_author` (
  `books_id` int(11) NOT NULL,
  `authors_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Despejando dados para a tabela `books_has_author`
--

INSERT INTO `books_has_author` (`books_id`, `authors_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `books_has_publisher`
--

CREATE TABLE `books_has_publisher` (
  `books_id` int(11) NOT NULL,
  `publisher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Despejando dados para a tabela `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(1, 'Fantasia', 'A história é de mentira'),
(2, 'Terror', 'A história é da medo'),
(3, 'Ação', 'A história é de agir'),
(4, 'Romance', 'A história é de amor');

-- --------------------------------------------------------

--
-- Estrutura para tabela `categories_has_books`
--

CREATE TABLE `categories_has_books` (
  `categories_id` int(11) NOT NULL,
  `books_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Despejando dados para a tabela `categories_has_books`
--

INSERT INTO `categories_has_books` (`categories_id`, `books_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6);

-- --------------------------------------------------------

--
-- Estrutura para tabela `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `employee_code` bigint(20) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `employee_position_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura para tabela `employee_position`
--

CREATE TABLE `employee_position` (
  `id` int(11) NOT NULL,
  `position` varchar(45) NOT NULL,
  `position_description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura para tabela `information`
--

CREATE TABLE `information` (
  `id` int(11) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `fix_phone` varchar(11) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(45) NOT NULL,
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura para tabela `loan`
--

CREATE TABLE `loan` (
  `id` int(11) NOT NULL,
  `loan_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  `expected_date` date NOT NULL,
  `users_id` int(11) NOT NULL,
  `employees_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura para tabela `publisher`
--

CREATE TABLE `publisher` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `number` bigint(8) DEFAULT NULL,
  `cnpj` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Despejando dados para a tabela `publisher`
--

INSERT INTO `publisher` (`id`, `name`, `address`, `number`, `cnpj`) VALUES
(1, 'HapperCollins', 'Rua da Quitanda 86, Rio de Janeiro, RJ, 20091', 2131751030, '22.016.633/0001-20'),
(2, 'Schwarcz S.A.', 'Rua Bandeira Paulista, 702, cj. 3204532-002', 1137073500, '55.789.390/0001-12'),
(3, 'Camelot', 'Bello Horizonte 1671, Lima, Lima', 11339377371, '21.878.520/0001-71');

-- --------------------------------------------------------

--
-- Estrutura para tabela `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `status` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `birth_date` date NOT NULL,
  `address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `cpf`, `first_name`, `last_name`, `birth_date`, `address_id`) VALUES
(1, '42530276870', 'Nohad', 'Real', '1967-03-19', 0),
(2, '49684104847', 'Heloise', 'Fogaça', '1949-07-13', 0),
(3, '02501871243', 'Sabrina', 'Cunha', '1975-06-17', 0),
(4, '55224710774', 'Julia', 'Bernardes', '1993-07-11', 0),
(5, '47967231457', 'Pedro', 'Aragão', '1964-06-25', 0);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`,`category_id`),
  ADD UNIQUE KEY `isbn_UNIQUE` (`isbn`),
  ADD KEY `fk_books_loan1_idx` (`loan_id`,`loan_status_id`);

--
-- Índices de tabela `books_has_author`
--
ALTER TABLE `books_has_author`
  ADD PRIMARY KEY (`books_id`,`authors_id`),
  ADD KEY `fk_books_has_author_author1_idx` (`authors_id`),
  ADD KEY `fk_books_has_author_books1_idx` (`books_id`);

--
-- Índices de tabela `books_has_publisher`
--
ALTER TABLE `books_has_publisher`
  ADD PRIMARY KEY (`books_id`,`publisher_id`),
  ADD KEY `fk_books_has_publisher_publisher1_idx` (`publisher_id`),
  ADD KEY `fk_books_has_publisher_books1_idx` (`books_id`);

--
-- Índices de tabela `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Índices de tabela `categories_has_books`
--
ALTER TABLE `categories_has_books`
  ADD PRIMARY KEY (`categories_id`,`books_id`),
  ADD KEY `fk_categories_has_books_categories1_idx` (`categories_id`),
  ADD KEY `fk_categories_has_books_books1_idx` (`books_id`);

--
-- Índices de tabela `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`,`employee_position_id`),
  ADD UNIQUE KEY `cpf_UNIQUE` (`employee_code`),
  ADD KEY `fk_employees_office1_idx` (`employee_position_id`);

--
-- Índices de tabela `employee_position`
--
ALTER TABLE `employee_position`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `information`
--
ALTER TABLE `information`
  ADD PRIMARY KEY (`id`,`users_id`),
  ADD KEY `fk_contacts_users1_idx` (`users_id`);

--
-- Índices de tabela `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`id`,`status_id`),
  ADD KEY `fk_loan_users1_idx` (`users_id`),
  ADD KEY `fk_loan_employees1_idx` (`employees_id`),
  ADD KEY `fk_loan_status1_idx` (`status_id`);

--
-- Índices de tabela `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cnpj_UNIQUE` (`cnpj`);

--
-- Índices de tabela `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`,`address_id`),
  ADD UNIQUE KEY `cpf_UNIQUE` (`cpf`),
  ADD KEY `fk_users_address1_idx` (`address_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `authors`
--
ALTER TABLE `authors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `information`
--
ALTER TABLE `information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `loan`
--
ALTER TABLE `loan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `publisher`
--
ALTER TABLE `publisher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `fk_books_loan1` FOREIGN KEY (`loan_id`,`loan_status_id`) REFERENCES `loan` (`id`, `status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `books_has_author`
--
ALTER TABLE `books_has_author`
  ADD CONSTRAINT `fk_books_has_author_author1` FOREIGN KEY (`authors_id`) REFERENCES `authors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_books_has_author_books1` FOREIGN KEY (`books_id`) REFERENCES `books` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `books_has_publisher`
--
ALTER TABLE `books_has_publisher`
  ADD CONSTRAINT `fk_books_has_publisher_books1` FOREIGN KEY (`books_id`) REFERENCES `books` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_books_has_publisher_publisher1` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `categories_has_books`
--
ALTER TABLE `categories_has_books`
  ADD CONSTRAINT `fk_categories_has_books_books1` FOREIGN KEY (`books_id`) REFERENCES `books` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_categories_has_books_categories1` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `fk_employees_office1` FOREIGN KEY (`employee_position_id`) REFERENCES `employee_position` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `information`
--
ALTER TABLE `information`
  ADD CONSTRAINT `fk_contacts_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `loan`
--
ALTER TABLE `loan`
  ADD CONSTRAINT `fk_loan_employees1` FOREIGN KEY (`employees_id`) REFERENCES `employees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_loan_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_loan_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_address1` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
