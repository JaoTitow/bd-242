-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Tempo de geração: 05/02/2025 às 17:01
-- Versão do servidor: 5.7.44
-- Versão do PHP: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `MeuBanco`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_PRODUTOS`
--

CREATE TABLE `TB_PRODUTOS` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text,
  `preco` decimal(10,2) NOT NULL,
  `estoque` int(11) NOT NULL,
  `produto_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `TB_PRODUTOS`
--

INSERT INTO `TB_PRODUTOS` (`id`, `nome`, `descricao`, `preco`, `estoque`, `produto_id`) VALUES
(1, 'Notebook Dell', 'Notebook potente para trabalho', 950.00, 10, NULL),
(3, 'Mouse Sem Fio', 'Mouse ergonômico com Bluetooth', 120.00, 15, NULL),
(4, 'Monitor 24\"', 'Monitor Full HD', 900.00, 8, NULL),
(5, 'Fone de Ouvido', 'Fone Bluetooth com Noise Cancelling', 350.00, 12, NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `TB_PRODUTOS`
--
ALTER TABLE `TB_PRODUTOS`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_produto_categoria` (`produto_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `TB_PRODUTOS`
--
ALTER TABLE `TB_PRODUTOS`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `TB_PRODUTOS`
--
ALTER TABLE `TB_PRODUTOS`
  ADD CONSTRAINT `fk_produto_categoria` FOREIGN KEY (`produto_id`) REFERENCES `TB_CATEGORIAS` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
