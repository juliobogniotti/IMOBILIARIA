-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 12/11/2026 às 12:13
-- Versão do servidor: 8.0.42-0ubuntu0.24.04.2
-- Versão do PHP: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `imobiliaria`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `imoveis`
--

CREATE TABLE `imoveis` (
  `id` int NOT NULL,
  `tipo_imovel` varchar(100) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `valor` varchar(100) NOT NULL,
  `tipo_venda` varchar(100) NOT NULL,
  `id_proprietario` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `negocios`
--

CREATE TABLE `negocios` (
  `id` int NOT NULL,
  `id_imovel` int DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `contrato` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pessoas`
--

CREATE TABLE `pessoas` (
  `id` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `endereco` varchar(200) NOT NULL,
  `telefone` varchar(50) NOT NULL,
  `CPF` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `pessoas`
--

INSERT INTO `pessoas` (`id`, `nome`, `email`, `senha`, `endereco`, `telefone`, `CPF`) VALUES
(1, 'julio cesar', 'julio.bogniotti@gmail.com', 'jubog', 'rua agata', '5544411221', '1379663366'),
(2, 'isabela feorenzano', 'isabela@gmail.com', 'isa0101', 'bela vista', '5544411221', '14455221'),
(3, 'gabriel espadim', 'gabriel@gmail.com', 'gabi', 'rua mauro', '5544411221', '5454545454'),
(4, 'vanderlei bogniotti', 'vanderlei@gmail.com', 'senha123', 'ouro branco', '5544411221', '10101010');

-- --------------------------------------------------------

--
-- Estrutura para tabela `relacoes_pessoas`
--

CREATE TABLE `relacoes_pessoas` (
  `id_pessoa` int NOT NULL,
  `id_tipo_pessoa` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_pessoa`
--

CREATE TABLE `tipo_pessoa` (
  `id` int NOT NULL,
  `tipo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `tipo_pessoa`
--

INSERT INTO `tipo_pessoa` (`id`, `tipo`) VALUES
(1, 'cliente'),
(2, 'usuario'),
(3, 'proprietario');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `imoveis`
--
ALTER TABLE `imoveis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_proprietario` (`id_proprietario`);

--
-- Índices de tabela `negocios`
--
ALTER TABLE `negocios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_imovel` (`id_imovel`),
  ADD KEY `fk_id_cliente` (`id_cliente`);

--
-- Índices de tabela `pessoas`
--
ALTER TABLE `pessoas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `senha` (`senha`),
  ADD UNIQUE KEY `CPF` (`CPF`);

--
-- Índices de tabela `relacoes_pessoas`
--
ALTER TABLE `relacoes_pessoas`
  ADD PRIMARY KEY (`id_pessoa`,`id_tipo_pessoa`),
  ADD KEY `fk_tipo_pessoa` (`id_tipo_pessoa`);

--
-- Índices de tabela `tipo_pessoa`
--
ALTER TABLE `tipo_pessoa`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `imoveis`
--
ALTER TABLE `imoveis`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `negocios`
--
ALTER TABLE `negocios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pessoas`
--
ALTER TABLE `pessoas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tipo_pessoa`
--
ALTER TABLE `tipo_pessoa`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `imoveis`
--
ALTER TABLE `imoveis`
  ADD CONSTRAINT `fk_proprietario` FOREIGN KEY (`id_proprietario`) REFERENCES `pessoas` (`id`);

--
-- Restrições para tabelas `negocios`
--
ALTER TABLE `negocios`
  ADD CONSTRAINT `fk_id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `pessoas` (`id`),
  ADD CONSTRAINT `fk_id_imovel` FOREIGN KEY (`id_imovel`) REFERENCES `imoveis` (`id`);

--
-- Restrições para tabelas `relacoes_pessoas`
--
ALTER TABLE `relacoes_pessoas`
  ADD CONSTRAINT `fk_id_pessoa` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoas` (`id`),
  ADD CONSTRAINT `fk_tipo_pessoa` FOREIGN KEY (`id_tipo_pessoa`) REFERENCES `tipo_pessoa` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
