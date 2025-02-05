-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Tempo de geração: 05/02/2025 às 18:35
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
-- Banco de dados: `Meu Banco`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `CLIENTES`
--

CREATE TABLE `CLIENTES` (
  `id` int(11) NOT NULL,
  `nomeCliente` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `sobrenomeContato` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `nomeContato` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `telefone` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `endereco1` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `endereco2` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `cidade` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `estado` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `codigoPostal` varchar(15) COLLATE latin1_general_ci DEFAULT NULL,
  `pais` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `representanteVendas_id` int(11) DEFAULT NULL,
  `limiteCredito` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `DETALHES_PEDIDO`
--

CREATE TABLE `DETALHES_PEDIDO` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `produto_id` varchar(15) COLLATE latin1_general_ci DEFAULT NULL,
  `quantidadePedida` int(11) NOT NULL,
  `precoUnitario` decimal(10,2) NOT NULL,
  `numeroLinhaPedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ESCRITORIOS`
--

CREATE TABLE `ESCRITORIOS` (
  `id` varchar(10) COLLATE latin1_general_ci NOT NULL,
  `cidade` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `telefone` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  `endereco1` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `endereco2` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `estado` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `pais` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `codigoPostal` varchar(15) COLLATE latin1_general_ci DEFAULT NULL,
  `territorio` varchar(50) COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `FUNCIONARIOS`
--

CREATE TABLE `FUNCIONARIOS` (
  `id` int(11) NOT NULL,
  `sobrenome` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `nome` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `ramal` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `email` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `escritorio_id` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `supervisor_id` int(11) DEFAULT NULL,
  `cargo` varchar(50) COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `LINHAS_PRODUTO`
--

CREATE TABLE `LINHAS_PRODUTO` (
  `id` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `descricaoTexto` text COLLATE latin1_general_ci,
  `descricaoHtml` text COLLATE latin1_general_ci,
  `imagem` blob
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `PAGAMENTOS`
--

CREATE TABLE `PAGAMENTOS` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `numeroCheque` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `dataPagamento` date DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `PEDIDOS`
--

CREATE TABLE `PEDIDOS` (
  `id` int(11) NOT NULL,
  `dataPedido` date NOT NULL,
  `dataRequerida` date NOT NULL,
  `dataEnviada` date DEFAULT NULL,
  `status` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `comentarios` text COLLATE latin1_general_ci,
  `cliente_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `PRODUTOS`
--

CREATE TABLE `PRODUTOS` (
  `id` varchar(15) COLLATE latin1_general_ci NOT NULL,
  `nomeProduto` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `linhaProduto_id` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `escalaProduto` varchar(10) COLLATE latin1_general_ci DEFAULT NULL,
  `fornecedorProduto` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `descricaoProduto` text COLLATE latin1_general_ci,
  `quantidadeEstoque` int(11) DEFAULT NULL,
  `precoCompra` decimal(10,2) DEFAULT NULL,
  `precoSugerido` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `CLIENTES`
--
ALTER TABLE `CLIENTES`
  ADD PRIMARY KEY (`id`),
  ADD KEY `representanteVendas_id` (`representanteVendas_id`);

--
-- Índices de tabela `DETALHES_PEDIDO`
--
ALTER TABLE `DETALHES_PEDIDO`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_id` (`pedido_id`),
  ADD KEY `produto_id` (`produto_id`);

--
-- Índices de tabela `ESCRITORIOS`
--
ALTER TABLE `ESCRITORIOS`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `FUNCIONARIOS`
--
ALTER TABLE `FUNCIONARIOS`
  ADD PRIMARY KEY (`id`),
  ADD KEY `escritorio_id` (`escritorio_id`),
  ADD KEY `supervisor_id` (`supervisor_id`);

--
-- Índices de tabela `LINHAS_PRODUTO`
--
ALTER TABLE `LINHAS_PRODUTO`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `PAGAMENTOS`
--
ALTER TABLE `PAGAMENTOS`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Índices de tabela `PEDIDOS`
--
ALTER TABLE `PEDIDOS`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Índices de tabela `PRODUTOS`
--
ALTER TABLE `PRODUTOS`
  ADD PRIMARY KEY (`id`),
  ADD KEY `linhaProduto_id` (`linhaProduto_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `CLIENTES`
--
ALTER TABLE `CLIENTES`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `DETALHES_PEDIDO`
--
ALTER TABLE `DETALHES_PEDIDO`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `FUNCIONARIOS`
--
ALTER TABLE `FUNCIONARIOS`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `PAGAMENTOS`
--
ALTER TABLE `PAGAMENTOS`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `PEDIDOS`
--
ALTER TABLE `PEDIDOS`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `CLIENTES`
--
ALTER TABLE `CLIENTES`
  ADD CONSTRAINT `CLIENTES_ibfk_1` FOREIGN KEY (`representanteVendas_id`) REFERENCES `FUNCIONARIOS` (`id`);

--
-- Restrições para tabelas `DETALHES_PEDIDO`
--
ALTER TABLE `DETALHES_PEDIDO`
  ADD CONSTRAINT `DETALHES_PEDIDO_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `PEDIDOS` (`id`),
  ADD CONSTRAINT `DETALHES_PEDIDO_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `PRODUTOS` (`id`);

--
-- Restrições para tabelas `FUNCIONARIOS`
--
ALTER TABLE `FUNCIONARIOS`
  ADD CONSTRAINT `FUNCIONARIOS_ibfk_1` FOREIGN KEY (`escritorio_id`) REFERENCES `ESCRITORIOS` (`id`),
  ADD CONSTRAINT `FUNCIONARIOS_ibfk_2` FOREIGN KEY (`supervisor_id`) REFERENCES `FUNCIONARIOS` (`id`);

--
-- Restrições para tabelas `PAGAMENTOS`
--
ALTER TABLE `PAGAMENTOS`
  ADD CONSTRAINT `PAGAMENTOS_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `CLIENTES` (`id`);

--
-- Restrições para tabelas `PEDIDOS`
--
ALTER TABLE `PEDIDOS`
  ADD CONSTRAINT `PEDIDOS_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `CLIENTES` (`id`);

--
-- Restrições para tabelas `PRODUTOS`
--
ALTER TABLE `PRODUTOS`
  ADD CONSTRAINT `PRODUTOS_ibfk_1` FOREIGN KEY (`linhaProduto_id`) REFERENCES `LINHAS_PRODUTO` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
