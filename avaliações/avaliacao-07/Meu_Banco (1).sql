-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Tempo de geração: 14/02/2025 às 13:15
-- Versão do servidor: 8.0.41
-- Versão do PHP: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `Meu_Banco`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_CLIENTES`
--

CREATE TABLE `TB_CLIENTES` (
  `id` varchar(80) NOT NULL,
  `customerName` varchar(100) DEFAULT NULL,
  `contactLastName` varchar(60) DEFAULT NULL,
  `contactFirstName` varchar(40) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `adressLine1` varchar(40) DEFAULT NULL,
  `adressLine2` varchar(40) DEFAULT NULL,
  `city` varchar(80) DEFAULT NULL,
  `state` varchar(80) DEFAULT NULL,
  `postalCode` varchar(60) DEFAULT NULL,
  `country` varchar(80) DEFAULT NULL,
  `salesRepEmployeeNumber` varchar(40) DEFAULT NULL,
  `creditLimit` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_CLIENTES`
--

INSERT INTO `TB_CLIENTES` (`id`, `customerName`, `contactLastName`, `contactFirstName`, `phone`, `adressLine1`, `adressLine2`, `city`, `state`, `postalCode`, `country`, `salesRepEmployeeNumber`, `creditLimit`) VALUES
('1', 'Empresa XYZ', 'Silva', 'João', '1234-5678', 'Rua A, 123', 'Apto 10', 'São Paulo', 'SP', '01000-000', 'Brasil', '1001', 5000);

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_DETALHES_PEDIDOS`
--

CREATE TABLE `TB_DETALHES_PEDIDOS` (
  `id_orderNumber` int NOT NULL,
  `id_productCode` int NOT NULL,
  `quantityOrdered` int DEFAULT NULL,
  `priceEach` int DEFAULT NULL,
  `orderLineNumber` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_EMPREGADOS`
--

CREATE TABLE `TB_EMPREGADOS` (
  `id` int NOT NULL,
  `lastName` varchar(80) DEFAULT NULL,
  `firstName` varchar(40) DEFAULT NULL,
  `extension` varchar(20) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `officeCode` varchar(40) DEFAULT NULL,
  `reportsTo` varchar(40) DEFAULT NULL,
  `jobTittle` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_ESCRITORIOS`
--

CREATE TABLE `TB_ESCRITORIOS` (
  `id` int NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `addresLine1` varchar(60) DEFAULT NULL,
  `addresLine2` varchar(60) DEFAULT NULL,
  `state` varchar(80) DEFAULT NULL,
  `country` varchar(80) DEFAULT NULL,
  `postalCode` varchar(40) DEFAULT NULL,
  `territory` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_LINHAS_DE_PRODUTO`
--

CREATE TABLE `TB_LINHAS_DE_PRODUTO` (
  `id` int NOT NULL,
  `htmlDescription` text,
  `image` varchar(100) DEFAULT NULL,
  `textDescription` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_LINHAS_DE_PRODUTO`
--

INSERT INTO `TB_LINHAS_DE_PRODUTO` (`id`, `htmlDescription`, `image`, `textDescription`) VALUES
(1, '<p>Descrição em HTML</p>', 'imagem.jpg', 'Descrição simples');

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_PAGAMENTOS`
--

CREATE TABLE `TB_PAGAMENTOS` (
  `id` int NOT NULL,
  `id_costumerNumber` varchar(80) DEFAULT NULL,
  `paymentDate` varchar(40) DEFAULT NULL,
  `amount` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_PAGAMENTOS`
--

INSERT INTO `TB_PAGAMENTOS` (`id`, `id_costumerNumber`, `paymentDate`, `amount`) VALUES
(1, '1', '2025-02-15', 2000);

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_PEDIDOS`
--

CREATE TABLE `TB_PEDIDOS` (
  `id` int NOT NULL,
  `orderDate` varchar(40) DEFAULT NULL,
  `requiredDate` varchar(40) DEFAULT NULL,
  `shippedDate` varchar(40) DEFAULT NULL,
  `status` varchar(40) DEFAULT NULL,
  `comments` text,
  `id_costumerNumber` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_PEDIDOS`
--

INSERT INTO `TB_PEDIDOS` (`id`, `orderDate`, `requiredDate`, `shippedDate`, `status`, `comments`, `id_costumerNumber`) VALUES
(2, '2025-02-14', '2025-02-20', NULL, 'Em processamento', 'Pedido urgente', '1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_PRODUTOS`
--

CREATE TABLE `TB_PRODUTOS` (
  `id` int NOT NULL,
  `productName` varchar(100) DEFAULT NULL,
  `id_productLine` int DEFAULT NULL,
  `productScale` varchar(100) DEFAULT NULL,
  `productVendor` varchar(100) DEFAULT NULL,
  `productDescription` text,
  `quantityInStock` int DEFAULT NULL,
  `buyPrice` int DEFAULT NULL,
  `MSRP` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_PRODUTOS`
--

INSERT INTO `TB_PRODUTOS` (`id`, `productName`, `id_productLine`, `productScale`, `productVendor`, `productDescription`, `quantityInStock`, `buyPrice`, `MSRP`) VALUES
(2, 'Produto Exemplo', 1, '1:10', 'Fornecedor X', 'Descrição do produto', 50, 100, 150);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `TB_CLIENTES`
--
ALTER TABLE `TB_CLIENTES`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `TB_DETALHES_PEDIDOS`
--
ALTER TABLE `TB_DETALHES_PEDIDOS`
  ADD PRIMARY KEY (`id_orderNumber`,`id_productCode`),
  ADD KEY `id_productCode` (`id_productCode`);

--
-- Índices de tabela `TB_EMPREGADOS`
--
ALTER TABLE `TB_EMPREGADOS`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `TB_ESCRITORIOS`
--
ALTER TABLE `TB_ESCRITORIOS`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `TB_LINHAS_DE_PRODUTO`
--
ALTER TABLE `TB_LINHAS_DE_PRODUTO`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `TB_PAGAMENTOS`
--
ALTER TABLE `TB_PAGAMENTOS`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_costumerNumber` (`id_costumerNumber`);

--
-- Índices de tabela `TB_PEDIDOS`
--
ALTER TABLE `TB_PEDIDOS`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_costumerNumber` (`id_costumerNumber`);

--
-- Índices de tabela `TB_PRODUTOS`
--
ALTER TABLE `TB_PRODUTOS`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_productLine` (`id_productLine`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `TB_EMPREGADOS`
--
ALTER TABLE `TB_EMPREGADOS`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `TB_ESCRITORIOS`
--
ALTER TABLE `TB_ESCRITORIOS`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `TB_LINHAS_DE_PRODUTO`
--
ALTER TABLE `TB_LINHAS_DE_PRODUTO`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `TB_PEDIDOS`
--
ALTER TABLE `TB_PEDIDOS`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `TB_PRODUTOS`
--
ALTER TABLE `TB_PRODUTOS`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `TB_DETALHES_PEDIDOS`
--
ALTER TABLE `TB_DETALHES_PEDIDOS`
  ADD CONSTRAINT `TB_DETALHES_PEDIDOS_ibfk_1` FOREIGN KEY (`id_orderNumber`) REFERENCES `TB_PEDIDOS` (`id`),
  ADD CONSTRAINT `TB_DETALHES_PEDIDOS_ibfk_2` FOREIGN KEY (`id_productCode`) REFERENCES `TB_PRODUTOS` (`id`);

--
-- Restrições para tabelas `TB_PAGAMENTOS`
--
ALTER TABLE `TB_PAGAMENTOS`
  ADD CONSTRAINT `TB_PAGAMENTOS_ibfk_1` FOREIGN KEY (`id_costumerNumber`) REFERENCES `TB_CLIENTES` (`id`);

--
-- Restrições para tabelas `TB_PEDIDOS`
--
ALTER TABLE `TB_PEDIDOS`
  ADD CONSTRAINT `TB_PEDIDOS_ibfk_1` FOREIGN KEY (`id_costumerNumber`) REFERENCES `TB_CLIENTES` (`id`);

--
-- Restrições para tabelas `TB_PRODUTOS`
--
ALTER TABLE `TB_PRODUTOS`
  ADD CONSTRAINT `TB_PRODUTOS_ibfk_1` FOREIGN KEY (`id_productLine`) REFERENCES `TB_LINHAS_DE_PRODUTO` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
