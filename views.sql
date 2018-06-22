-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 22-Jun-2018 às 14:59
-- Versão do servidor: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siac_views`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `campus_cidade`
--

CREATE TABLE `campus_cidade` (
  `campus_apresentacao_id` int(11) NOT NULL,
  `uri_cidade` varchar(700) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `campus_cidade`
--

INSERT INTO `campus_cidade` (`campus_apresentacao_id`, `uri_cidade`) VALUES
(2, 'http://dbpedia.org/resource/Maca%C3%A9'),
(1, 'http://dbpedia.org/resource/Rio_de_Janeiro'),
(3, 'http://dbpedia.org/resource/Xerém');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_area_conhecimento`
--
CREATE TABLE `v_area_conhecimento` (
`id` int(11)
,`descricao` varchar(255)
,`id_area_pai` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_artigos_publicados`
--
CREATE TABLE `v_artigos_publicados` (
`id` int(11)
,`trabalho_apresentado` enum('F','P')
,`programacao_sessao_id` int(11)
,`revisao_id` int(11)
,`titulo` varchar(300)
,`resumo` longtext
,`programa_articulado_id` int(11)
,`modalidade_apresentacao_id` int(11)
,`data_sessao` date
,`modalidade_apresentacao` varchar(255)
,`ordem` int(11)
,`etapa` tinyint(1)
,`campus_apresentacao_id` int(11)
,`uri_cidade` varchar(700)
,`id_area_conhecimento_final` bigint(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_autor_artigo`
--
CREATE TABLE `v_autor_artigo` (
`id` int(11)
,`usuario_id` int(11)
,`artigo_id` int(11)
,`papel_id` int(11)
,`criador` tinyint(1)
,`ordem` varchar(45)
,`ordem_revisao` varchar(45)
,`status_avaliacao_artigo` int(11)
,`etapa` varchar(45)
,`justificativa_recusa_avaliacao` text
,`flag_habilitar` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_campus_apresentacao`
--
CREATE TABLE `v_campus_apresentacao` (
`id` int(11)
,`descricao` varchar(255)
,`campus_apresentacao_id` int(11)
,`uri_cidade` varchar(700)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_cursos`
--
CREATE TABLE `v_cursos` (
`id` bigint(20)
,`curso` varchar(110)
,`ativo` int(11)
,`unidade_id` bigint(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_instituicao`
--
CREATE TABLE `v_instituicao` (
`id` int(11)
,`nome` varchar(255)
,`sigla` varchar(45)
,`ativo` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_palavra_chave`
--
CREATE TABLE `v_palavra_chave` (
`id` int(11)
,`descricao` varchar(255)
,`descricao_min` varchar(255)
,`revisao_id` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_usuario`
--
CREATE TABLE `v_usuario` (
`id` int(11)
,`nome` varchar(60)
,`sobrenome` varchar(80)
,`cpf` varchar(40)
,`email` varchar(80)
,`senha` varchar(250)
,`sexo` varchar(60)
,`dre` varchar(20)
,`data_nascimento` date
,`vinculo_id` bigint(20)
,`situacao_id` int(11)
,`fonte_financiamento` varchar(80)
,`serie_id` int(11)
,`bolsa` varchar(85)
,`especificacao_bolsa` varchar(100)
,`especificacao_genero` varchar(45)
,`atuacao_administrativa_id` int(11)
,`atualizar_perfil` int(11)
,`chave` varchar(60)
,`turno` varchar(80)
,`data_inclusao` varchar(45)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_usuario_artigo`
--
CREATE TABLE `v_usuario_artigo` (
`id` int(11)
,`usuario_id` int(11)
,`artigo_id` int(11)
,`papel_id` int(11)
,`criador` tinyint(1)
,`ordem` varchar(45)
,`ordem_revisao` varchar(45)
,`status_avaliacao_artigo` int(11)
,`etapa` varchar(45)
,`justificativa_recusa_avaliacao` text
,`flag_habilitar` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_usuario_curso`
--
CREATE TABLE `v_usuario_curso` (
`id` bigint(20)
,`curso_id` bigint(20)
,`usuario_id` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_usuario_instituicao`
--
CREATE TABLE `v_usuario_instituicao` (
`usuario_id` int(11)
,`instituicao_id` int(11)
);

-- --------------------------------------------------------

--
-- Structure for view `v_area_conhecimento`
--
DROP TABLE IF EXISTS `v_area_conhecimento`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_area_conhecimento`  AS  select `siac`.`grande_area`.`id` AS `id`,`siac`.`grande_area`.`descricao` AS `descricao`,NULL AS `id_area_pai` from `siac`.`grande_area` union select `siac`.`area`.`id` AS `id`,`siac`.`area`.`descricao` AS `descricao`,`siac`.`area`.`grande_area_id` AS `grande_area_id` from `siac`.`area` union select `siac`.`sub_area`.`id` AS `id`,`siac`.`sub_area`.`descricao` AS `descricao`,`siac`.`sub_area`.`area_id` AS `area_id` from `siac`.`sub_area` union select `siac`.`especialidade`.`id` AS `id`,`siac`.`especialidade`.`descricao` AS `descricao`,`siac`.`especialidade`.`sub_area_id` AS `sub_area_id` from `siac`.`especialidade` ;

-- --------------------------------------------------------

--
-- Structure for view `v_artigos_publicados`
--
DROP TABLE IF EXISTS `v_artigos_publicados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_artigos_publicados`  AS  select distinct `a`.`id` AS `id`,`a`.`trabalho_apresentado` AS `trabalho_apresentado`,`a`.`programacao_sessao_id` AS `programacao_sessao_id`,`r`.`id` AS `revisao_id`,`r`.`titulo` AS `titulo`,`r`.`resumo` AS `resumo`,`r`.`programa_articulado_id` AS `programa_articulado_id`,`r`.`modalidade_apresentacao_id` AS `modalidade_apresentacao_id`,`ps`.`data` AS `data_sessao`,`ma`.`descricao` AS `modalidade_apresentacao`,`r`.`ordem` AS `ordem`,`r`.`etapa` AS `etapa`,`r`.`campus_apresentacao_id` AS `campus_apresentacao_id`,`ca`.`uri_cidade` AS `uri_cidade`,if((`ac`.`especialidade_id` is not null),`ac`.`especialidade_id`,if((`ac`.`sub_area_id` is not null),`ac`.`sub_area_id`,if((`ac`.`area_id` is not null),`ac`.`area_id`,if((`ac`.`grande_area_id` is not null),`ac`.`grande_area_id`,NULL)))) AS `id_area_conhecimento_final` from (((((`siac`.`artigo` `a` join `siac`.`revisao` `r` on((`a`.`id` = `r`.`artigo_id`))) join `siac`.`modalidade_apresentacao` `ma` on((`ma`.`id` = `r`.`modalidade_apresentacao_id`))) join `siac`.`programacao_sessao` `ps` on((`a`.`programacao_sessao_id` = `ps`.`id`))) join `siac`.`area_conhecimento` `ac` on((`r`.`id` = `ac`.`revisao_id`))) left join `v_campus_apresentacao` `ca` on((`ca`.`id` = `r`.`campus_apresentacao_id`))) where ((`a`.`trabalho_apresentado` = 'P') and (`r`.`ativa` = 1) and (`r`.`etapa` = (select max(`r1`.`etapa`) from `siac`.`revisao` `r1` where ((`r1`.`artigo_id` = `a`.`id`) and (`r1`.`ativa` = 1)))) and (`r`.`ordem` = (select max(`r1`.`ordem`) from `siac`.`revisao` `r1` where ((`r1`.`artigo_id` = `a`.`id`) and (`r1`.`ativa` = 1) and (`r1`.`etapa` = `r`.`etapa`))))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_autor_artigo`
--
DROP TABLE IF EXISTS `v_autor_artigo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_autor_artigo`  AS  select `siac`.`usuario_artigo`.`id` AS `id`,`siac`.`usuario_artigo`.`usuario_id` AS `usuario_id`,`siac`.`usuario_artigo`.`artigo_id` AS `artigo_id`,`siac`.`usuario_artigo`.`papel_id` AS `papel_id`,`siac`.`usuario_artigo`.`criador` AS `criador`,`siac`.`usuario_artigo`.`ordem` AS `ordem`,`siac`.`usuario_artigo`.`ordem_revisao` AS `ordem_revisao`,`siac`.`usuario_artigo`.`status_avaliacao_artigo` AS `status_avaliacao_artigo`,`siac`.`usuario_artigo`.`etapa` AS `etapa`,`siac`.`usuario_artigo`.`justificativa_recusa_avaliacao` AS `justificativa_recusa_avaliacao`,`siac`.`usuario_artigo`.`flag_habilitar` AS `flag_habilitar` from `siac`.`usuario_artigo` where ((`siac`.`usuario_artigo`.`papel_id` <= 3) and (`siac`.`usuario_artigo`.`flag_habilitar` = 1)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_campus_apresentacao`
--
DROP TABLE IF EXISTS `v_campus_apresentacao`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_campus_apresentacao`  AS  select `c`.`id` AS `id`,`c`.`descricao` AS `descricao`,`cc`.`campus_apresentacao_id` AS `campus_apresentacao_id`,`cc`.`uri_cidade` AS `uri_cidade` from (`siac`.`campus_apresentacao` `c` join `campus_cidade` `cc` on((`c`.`id` = `cc`.`campus_apresentacao_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_cursos`
--
DROP TABLE IF EXISTS `v_cursos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_cursos`  AS  select `siac`.`curso`.`id` AS `id`,`siac`.`curso`.`curso` AS `curso`,`siac`.`curso`.`ativo` AS `ativo`,`siac`.`curso`.`unidade_id` AS `unidade_id` from `siac`.`curso` where (`siac`.`curso`.`ativo` = 1) ;

-- --------------------------------------------------------

--
-- Structure for view `v_instituicao`
--
DROP TABLE IF EXISTS `v_instituicao`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_instituicao`  AS  select `siac`.`instituicao`.`id` AS `id`,`siac`.`instituicao`.`nome` AS `nome`,`siac`.`instituicao`.`sigla` AS `sigla`,`siac`.`instituicao`.`ativo` AS `ativo` from `siac`.`instituicao` where (`siac`.`instituicao`.`nome` is not null) ;

-- --------------------------------------------------------

--
-- Structure for view `v_palavra_chave`
--
DROP TABLE IF EXISTS `v_palavra_chave`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_palavra_chave`  AS  select `siac`.`palavra_chave`.`id` AS `id`,trim(`siac`.`palavra_chave`.`descricao`) AS `descricao`,lcase(trim(`siac`.`palavra_chave`.`descricao`)) AS `descricao_min`,`siac`.`palavra_chave`.`revisao_id` AS `revisao_id` from `siac`.`palavra_chave` where ((`siac`.`palavra_chave`.`descricao` is not null) and (trim(`siac`.`palavra_chave`.`descricao`) <> '')) ;

-- --------------------------------------------------------

--
-- Structure for view `v_usuario`
--
DROP TABLE IF EXISTS `v_usuario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_usuario`  AS  select `siac`.`usuario`.`id` AS `id`,`siac`.`usuario`.`nome` AS `nome`,`siac`.`usuario`.`sobrenome` AS `sobrenome`,`siac`.`usuario`.`cpf` AS `cpf`,`siac`.`usuario`.`email` AS `email`,`siac`.`usuario`.`senha` AS `senha`,`siac`.`usuario`.`sexo` AS `sexo`,`siac`.`usuario`.`dre` AS `dre`,`siac`.`usuario`.`data_nascimento` AS `data_nascimento`,`siac`.`usuario`.`vinculo_id` AS `vinculo_id`,`siac`.`usuario`.`situacao_id` AS `situacao_id`,`siac`.`usuario`.`fonte_financiamento` AS `fonte_financiamento`,`siac`.`usuario`.`serie_id` AS `serie_id`,`siac`.`usuario`.`bolsa` AS `bolsa`,`siac`.`usuario`.`especificacao_bolsa` AS `especificacao_bolsa`,`siac`.`usuario`.`especificacao_genero` AS `especificacao_genero`,`siac`.`usuario`.`atuacao_administrativa_id` AS `atuacao_administrativa_id`,`siac`.`usuario`.`atualizar_perfil` AS `atualizar_perfil`,`siac`.`usuario`.`chave` AS `chave`,`siac`.`usuario`.`turno` AS `turno`,`siac`.`usuario`.`data_inclusao` AS `data_inclusao` from `siac`.`usuario` ;

-- --------------------------------------------------------

--
-- Structure for view `v_usuario_artigo`
--
DROP TABLE IF EXISTS `v_usuario_artigo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_usuario_artigo`  AS  select `siac`.`usuario_artigo`.`id` AS `id`,`siac`.`usuario_artigo`.`usuario_id` AS `usuario_id`,`siac`.`usuario_artigo`.`artigo_id` AS `artigo_id`,`siac`.`usuario_artigo`.`papel_id` AS `papel_id`,`siac`.`usuario_artigo`.`criador` AS `criador`,`siac`.`usuario_artigo`.`ordem` AS `ordem`,`siac`.`usuario_artigo`.`ordem_revisao` AS `ordem_revisao`,`siac`.`usuario_artigo`.`status_avaliacao_artigo` AS `status_avaliacao_artigo`,`siac`.`usuario_artigo`.`etapa` AS `etapa`,`siac`.`usuario_artigo`.`justificativa_recusa_avaliacao` AS `justificativa_recusa_avaliacao`,`siac`.`usuario_artigo`.`flag_habilitar` AS `flag_habilitar` from `siac`.`usuario_artigo` ;

-- --------------------------------------------------------

--
-- Structure for view `v_usuario_curso`
--
DROP TABLE IF EXISTS `v_usuario_curso`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_usuario_curso`  AS  select `siac`.`usuario_curso`.`id` AS `id`,`siac`.`usuario_curso`.`curso_id` AS `curso_id`,`siac`.`usuario_curso`.`usuario_id` AS `usuario_id` from `siac`.`usuario_curso` ;

-- --------------------------------------------------------

--
-- Structure for view `v_usuario_instituicao`
--
DROP TABLE IF EXISTS `v_usuario_instituicao`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_usuario_instituicao`  AS  select `siac`.`usuario_instituicao`.`usuario_id` AS `usuario_id`,`siac`.`usuario_instituicao`.`instituicao_id` AS `instituicao_id` from `siac`.`usuario_instituicao` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `campus_cidade`
--
ALTER TABLE `campus_cidade`
  ADD PRIMARY KEY (`campus_apresentacao_id`),
  ADD UNIQUE KEY `uri_cidade_UNIQUE` (`uri_cidade`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `campus_cidade`
--
ALTER TABLE `campus_cidade`
  MODIFY `campus_apresentacao_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
