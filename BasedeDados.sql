-- --------------------------------------------------------
-- Anfitrião:                    127.0.0.1
-- Versão do servidor:           10.5.2-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Versão:              10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for recuperacao
CREATE DATABASE IF NOT EXISTS `recuperacao` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `recuperacao`;

-- Dumping structure for table recuperacao.analise
CREATE TABLE IF NOT EXISTS `analise` (
  `IDAnalise` int(11) NOT NULL AUTO_INCREMENT,
  `Aprovacao` tinyint(1) DEFAULT NULL,
  `Comentario` text DEFAULT NULL,
  `DataAnalise` datetime DEFAULT NULL,
  `ID_Questionario` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDAnalise`),
  KEY `ID_Questionario` (`ID_Questionario`),
  CONSTRAINT `FK_analise_questionario` FOREIGN KEY (`ID_Questionario`) REFERENCES `questionario` (`IDQuestionario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table recuperacao.analise: ~5 rows (approximately)
/*!40000 ALTER TABLE `analise` DISABLE KEYS */;
INSERT INTO `analise` (`IDAnalise`, `Aprovacao`, `Comentario`, `DataAnalise`, `ID_Questionario`) VALUES
	(1, 1, NULL, '2020-09-28 00:00:00', 1),
	(2, 1, 'Muito Bom', '2020-09-27 00:00:00', 3),
	(3, 1, 'Está aprovada!', '2020-09-29 03:15:53', 4),
	(4, NULL, NULL, NULL, 5),
	(5, NULL, NULL, NULL, 6);
/*!40000 ALTER TABLE `analise` ENABLE KEYS */;

-- Dumping structure for table recuperacao.anexospropriedade
CREATE TABLE IF NOT EXISTS `anexospropriedade` (
  `IDAnexos` int(11) NOT NULL AUTO_INCREMENT,
  `Anexo` longblob DEFAULT NULL,
  `ID_Propriedade` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDAnexos`),
  KEY `ID_Propriedade` (`ID_Propriedade`),
  CONSTRAINT `FK_anexospropriedade_propriedade` FOREIGN KEY (`ID_Propriedade`) REFERENCES `propriedade` (`IDPropriedade`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table recuperacao.anexospropriedade: ~0 rows (approximately)
/*!40000 ALTER TABLE `anexospropriedade` DISABLE KEYS */;
/*!40000 ALTER TABLE `anexospropriedade` ENABLE KEYS */;

-- Dumping structure for table recuperacao.anexosresposta
CREATE TABLE IF NOT EXISTS `anexosresposta` (
  `IDAnexoPergunta` int(11) NOT NULL AUTO_INCREMENT,
  `Anexo` longblob DEFAULT NULL,
  `ID_Resposta` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDAnexoPergunta`),
  KEY `ID_Resposta` (`ID_Resposta`),
  CONSTRAINT `FK_anexosresposta_respostas` FOREIGN KEY (`ID_Resposta`) REFERENCES `respostas` (`IDResposta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table recuperacao.anexosresposta: ~0 rows (approximately)
/*!40000 ALTER TABLE `anexosresposta` DISABLE KEYS */;
/*!40000 ALTER TABLE `anexosresposta` ENABLE KEYS */;

-- Dumping structure for table recuperacao.enderecoproprietario
CREATE TABLE IF NOT EXISTS `enderecoproprietario` (
  `IDEnderecoProprietario` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Proprietario` int(11) DEFAULT NULL,
  `Pais` varchar(50) DEFAULT NULL,
  `Estado/Distrito` varchar(18) DEFAULT NULL,
  `Cidade` varchar(18) DEFAULT NULL,
  `Rua` varchar(50) DEFAULT NULL,
  `Porta` varchar(10) DEFAULT NULL,
  `CodPostal` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`IDEnderecoProprietario`),
  KEY `ID_Proprietario` (`ID_Proprietario`),
  CONSTRAINT `FK_enderecoproprietario_proprietario` FOREIGN KEY (`ID_Proprietario`) REFERENCES `proprietario` (`IDProprietario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- Dumping data for table recuperacao.enderecoproprietario: ~23 rows (approximately)
/*!40000 ALTER TABLE `enderecoproprietario` DISABLE KEYS */;
INSERT INTO `enderecoproprietario` (`IDEnderecoProprietario`, `ID_Proprietario`, `Pais`, `Estado/Distrito`, `Cidade`, `Rua`, `Porta`, `CodPostal`) VALUES
	(1, 11, NULL, 'Evora', 'Vendas Novas', 'Rua das Couves', '75', '7080-555'),
	(2, 1, 'Portugal', 'a', '1', 'k', '1', '7080-456'),
	(3, 2, 'Brasil', 's', '2', 't', '1', '7080-457'),
	(4, 3, 'Japão', 'b', '3', 'x', '1', '7080-458'),
	(5, 4, 'Italia', 't', '4', 'wert', '1', '7080-459'),
	(6, 5, 'Coreia', 'a', '5', 'asdf', '1', '7080-460'),
	(7, 6, 'EUA', 's', '6', 'zxcv', '1', '7080-461'),
	(8, 7, 'Vietnam', 'b', '7', 't', '1', '7080-462'),
	(9, 8, 'Portugal', 't', '8', 'w', '1', '7080-463'),
	(10, 9, 'Brasil', 'a', '9', 'd', '1', '7080-464'),
	(11, 10, 'Japão', 's', '10', 'yuio', '1', '7080-465'),
	(12, 11, 'Italia', 'b', '11', 'f', '1', '7080-466'),
	(13, 12, 'Coreia', 't', '12', 'wryt', '1', '7080-467'),
	(14, 13, 'EUA', 'a', '13', 'sdfg', '1', '7080-468'),
	(15, 14, 'Vietnam', 's', '14', 'qwer', '1', '7080-469'),
	(16, 15, 'Portugal', 'b', '15', 'cvn', '1', '7080-470'),
	(17, 16, 'Brasil', 't', '16', 'tywr', '1', '7080-471'),
	(18, 17, 'Japão', 'a', '17', 'dfgj', '1', '7080-472'),
	(19, 18, 'Italia', 's', '18', 'uyoi', '1', '7080-473'),
	(20, 19, 'Coreia', 'b', '19', 'fda', '1', '7080-474'),
	(21, 20, 'EUA', 't', '20', 'rytbg', '1', '7080-475'),
	(33, 43, 'Portugal', 'Beja', 'Beja', 'Rua Alentejo', '5º E', '9050-456'),
	(34, 44, 'Portugal', 'Porto', 'Porto', 'Rua do Norte', '2º E', '1234-456');
/*!40000 ALTER TABLE `enderecoproprietario` ENABLE KEYS */;

-- Dumping structure for table recuperacao.perguntas
CREATE TABLE IF NOT EXISTS `perguntas` (
  `IDPerguntas` int(11) NOT NULL AUTO_INCREMENT,
  `TituloPergunta` varchar(50) DEFAULT NULL,
  `DescricaoPergunta` tinytext DEFAULT NULL,
  `ImagemPergunta` longblob DEFAULT NULL,
  PRIMARY KEY (`IDPerguntas`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table recuperacao.perguntas: ~2 rows (approximately)
/*!40000 ALTER TABLE `perguntas` DISABLE KEYS */;
INSERT INTO `perguntas` (`IDPerguntas`, `TituloPergunta`, `DescricaoPergunta`, `ImagemPergunta`) VALUES
	(1, 'Data Compra', 'Quando Comprou a sua propriedade?', NULL),
	(3, 'Idade da propriedade', 'Quantos anos possui a propriedade?', NULL);
/*!40000 ALTER TABLE `perguntas` ENABLE KEYS */;

-- Dumping structure for table recuperacao.perguntasquestionario
CREATE TABLE IF NOT EXISTS `perguntasquestionario` (
  `IDPerguntasQuestionario` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Perguntas` int(11) DEFAULT NULL,
  `ID_Questionario` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDPerguntasQuestionario`),
  KEY `ID_Perguntas` (`ID_Perguntas`),
  KEY `ID_Questionario` (`ID_Questionario`),
  CONSTRAINT `FK_perguntasquestionario_perguntas` FOREIGN KEY (`ID_Perguntas`) REFERENCES `perguntas` (`IDPerguntas`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_perguntasquestionario_questionario` FOREIGN KEY (`ID_Questionario`) REFERENCES `questionario` (`IDQuestionario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table recuperacao.perguntasquestionario: ~1 rows (approximately)
/*!40000 ALTER TABLE `perguntasquestionario` DISABLE KEYS */;
INSERT INTO `perguntasquestionario` (`IDPerguntasQuestionario`, `ID_Perguntas`, `ID_Questionario`) VALUES
	(1, 1, 1),
	(2, 3, 3);
/*!40000 ALTER TABLE `perguntasquestionario` ENABLE KEYS */;

-- Dumping structure for table recuperacao.propriedade
CREATE TABLE IF NOT EXISTS `propriedade` (
  `IDPropriedade` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Proprietario` int(11) DEFAULT NULL,
  `Nome` varchar(50) DEFAULT NULL,
  `Pais` varchar(50) DEFAULT NULL,
  `Estados/Distritos` varchar(50) DEFAULT NULL,
  `Cidade` varchar(50) DEFAULT NULL,
  `Rua` varchar(50) DEFAULT NULL,
  `N de porta` varchar(50) DEFAULT NULL,
  `Cod Postal` varchar(50) DEFAULT NULL,
  `Tamanho` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IDPropriedade`),
  KEY `ID_Proprietario` (`ID_Proprietario`),
  CONSTRAINT `FK_propriedade_proprietario` FOREIGN KEY (`ID_Proprietario`) REFERENCES `proprietario` (`IDProprietario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table recuperacao.propriedade: ~5 rows (approximately)
/*!40000 ALTER TABLE `propriedade` DISABLE KEYS */;
INSERT INTO `propriedade` (`IDPropriedade`, `ID_Proprietario`, `Nome`, `Pais`, `Estados/Distritos`, `Cidade`, `Rua`, `N de porta`, `Cod Postal`, `Tamanho`) VALUES
	(1, 1, 'Herdade Magalhães', 'Portugal', 'Evora', 'Vendas Novas', 'Rua das Batatas', '75', '7080-785', '750'),
	(2, 3, 'Herdade Xandão', 'Portugal', 'Setubal', 'Pinhal Novo', 'Rua das Alfarrobas', '74', '8080-751', '7500'),
	(3, 2, 'Herdade step', 'Portugal', 'Setubal', 'Pinhal Novo', 'Rua ao lado da outra', '74', '8080-785', '1000'),
	(4, 4, 'Herdade do Ramalhão', 'Portugal', 'Faro', 'Faro', 'Augusta', '89C', '8585-789', '850'),
	(5, 44, 'Herdade do Pifaro', 'Portugal', 'Faro', 'Faro', 'Helena', '69B', '8585-739', '855');
/*!40000 ALTER TABLE `propriedade` ENABLE KEYS */;

-- Dumping structure for table recuperacao.propriedadeanalise
CREATE TABLE IF NOT EXISTS `propriedadeanalise` (
  `IDPropriedadeAnalise` int(11) NOT NULL AUTO_INCREMENT,
  `DataSubmissao` datetime DEFAULT NULL,
  `ID_Propriedade` int(11) DEFAULT NULL,
  `ID_Analise` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDPropriedadeAnalise`),
  KEY `ID_Propriedade` (`ID_Propriedade`),
  KEY `ID_Analise` (`ID_Analise`),
  CONSTRAINT `FK_propriedadeanalise_analise` FOREIGN KEY (`ID_Analise`) REFERENCES `analise` (`IDAnalise`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_propriedadeanalise_propriedade` FOREIGN KEY (`ID_Propriedade`) REFERENCES `propriedade` (`IDPropriedade`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table recuperacao.propriedadeanalise: ~5 rows (approximately)
/*!40000 ALTER TABLE `propriedadeanalise` DISABLE KEYS */;
INSERT INTO `propriedadeanalise` (`IDPropriedadeAnalise`, `DataSubmissao`, `ID_Propriedade`, `ID_Analise`) VALUES
	(1, '2020-09-27 00:00:00', 1, 1),
	(2, '2020-09-27 00:00:00', 2, 2),
	(3, '2020-09-27 12:22:52', 3, 3),
	(4, '2020-09-29 02:40:26', 4, 4),
	(5, '2020-09-29 02:45:12', 5, 5);
/*!40000 ALTER TABLE `propriedadeanalise` ENABLE KEYS */;

-- Dumping structure for table recuperacao.proprietario
CREATE TABLE IF NOT EXISTS `proprietario` (
  `IDProprietario` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Utilizador` varchar(50) DEFAULT NULL,
  `PalavraPasse` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IDProprietario`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- Dumping data for table recuperacao.proprietario: ~31 rows (approximately)
/*!40000 ALTER TABLE `proprietario` DISABLE KEYS */;
INSERT INTO `proprietario` (`IDProprietario`, `Nome`, `Email`, `Utilizador`, `PalavraPasse`) VALUES
	(1, 'João', 'joao@mail.com', 'jman', '1234'),
	(2, 'João', 'joao@mail.com', 'jman', '1234'),
	(3, 'João', 'joao@mail.com', 'jman', '1234'),
	(4, 'João', 'joao@mail.com', 'jman', '1234'),
	(5, 'Pedro', 'pedro@mail.com', 'pman', '123'),
	(6, 'Tiago', 'tiago@mail.com', 'tman', '321'),
	(7, 'Tiago', 'tiago@mail.com', 'tman', '321'),
	(8, 'Alvaro', 'Alvaro@mail.com', 'aman', '4321'),
	(9, 'Francisco', 'Francisco@mail.com', 'fman', '456'),
	(10, 'Ruben', 'Ruben@mail.com', 'rman', '4567'),
	(11, 'Emanuel', 'Emanuel@mail.com', 'eman', '7654'),
	(12, 'pessoa3', '32@mail.com', 'pessoa3', '159'),
	(13, 'pessoa4', '42@mail.com', 'pessoa4', '1234'),
	(14, 'pessoa5', '5@mail.com', 'pessoa5', 'asdf'),
	(15, 'pessoa6', '6@mail.com', 'pessoa6', 'zxcv'),
	(16, 'pessoa7', '7@mail.com', 'pessoa7', '2309'),
	(17, 'pessoa8', '8@mail.com', 'pessoa8', '3384'),
	(18, 'pessoa9', '9@mail.com', 'pessoa9', 'asdf'),
	(19, 'pessoa10', '10@mail.com', 'pessoa10', 'zxcv'),
	(20, 'pessoa11', '11@mail.com', 'pessoa11', '4459'),
	(21, 'pessoa12', '12@mail.com', 'pessoa12', '5534'),
	(22, 'pessoa13', '13@mail.com', 'pessoa13', 'asdf'),
	(23, 'pessoa14', '14@mail.com', 'pessoa14', 'zxcv'),
	(24, 'pessoa15', '15@mail.com', 'pessoa15', '6609'),
	(25, 'pessoa16', '16@mail.com', 'pessoa16', '7684'),
	(26, 'pessoa17', '17@mail.com', 'pessoa17', 'asdf'),
	(27, 'pessoa18', '18@mail.com', 'pessoa18', 'zxcv'),
	(28, 'pessoa19', '19@mail.com', 'pessoa19', '8759'),
	(29, 'pessoa20', '20@mail.com', 'pessoa20', '9834'),
	(43, 'Alfredo', 'fred@mail.com', 'fredinho', 'aguadaspedra'),
	(44, 'Mateus', 'Matew@mail.com', 'Matew', 'Matw');
/*!40000 ALTER TABLE `proprietario` ENABLE KEYS */;

-- Dumping structure for table recuperacao.questionario
CREATE TABLE IF NOT EXISTS `questionario` (
  `IDQuestionario` int(11) NOT NULL AUTO_INCREMENT,
  `DataRespostas` datetime DEFAULT NULL,
  `Aprovacao` tinyint(1) DEFAULT NULL,
  `Publico` tinyint(1) DEFAULT NULL,
  `ResultadoFinal` char(1) DEFAULT NULL,
  PRIMARY KEY (`IDQuestionario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table recuperacao.questionario: ~6 rows (approximately)
/*!40000 ALTER TABLE `questionario` DISABLE KEYS */;
INSERT INTO `questionario` (`IDQuestionario`, `DataRespostas`, `Aprovacao`, `Publico`, `ResultadoFinal`) VALUES
	(1, '2020-09-28 13:25:48', 1, 1, 'B'),
	(2, NULL, NULL, NULL, '1'),
	(3, '2020-09-29 03:46:08', NULL, 1, NULL),
	(4, NULL, NULL, NULL, NULL),
	(5, NULL, NULL, NULL, NULL),
	(6, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `questionario` ENABLE KEYS */;

-- Dumping structure for table recuperacao.respostas
CREATE TABLE IF NOT EXISTS `respostas` (
  `IDResposta` int(11) NOT NULL AUTO_INCREMENT,
  `Resposta` varchar(50) DEFAULT NULL,
  `Nota` char(1) DEFAULT NULL,
  `DataResposta` datetime DEFAULT NULL,
  `ID_Pergunta` int(11) DEFAULT NULL,
  `ID_Questionario` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDResposta`),
  KEY `ID_Pergunta` (`ID_Pergunta`),
  KEY `ID_Questionario` (`ID_Questionario`),
  CONSTRAINT `FK_respostas_perguntas` FOREIGN KEY (`ID_Pergunta`) REFERENCES `perguntas` (`IDPerguntas`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_respostas_questionario` FOREIGN KEY (`ID_Questionario`) REFERENCES `questionario` (`IDQuestionario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table recuperacao.respostas: ~2 rows (approximately)
/*!40000 ALTER TABLE `respostas` DISABLE KEYS */;
INSERT INTO `respostas` (`IDResposta`, `Resposta`, `Nota`, `DataResposta`, `ID_Pergunta`, `ID_Questionario`) VALUES
	(1, 'Super Xandão', NULL, '2020-09-27 20:47:29', 1, 1),
	(2, '54 Anos', NULL, '2020-09-29 03:46:08', 3, 3);
/*!40000 ALTER TABLE `respostas` ENABLE KEYS */;

-- Dumping structure for table recuperacao.revisao
CREATE TABLE IF NOT EXISTS `revisao` (
  `IDRevisao` int(11) NOT NULL AUTO_INCREMENT,
  `DataRevisao` datetime DEFAULT NULL,
  `Resultado` char(1) DEFAULT NULL,
  `Comentario` tinytext DEFAULT NULL,
  `ID_Questionario` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDRevisao`),
  KEY `ID_Questionario` (`ID_Questionario`),
  CONSTRAINT `FK_revisao_questionario` FOREIGN KEY (`ID_Questionario`) REFERENCES `questionario` (`IDQuestionario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table recuperacao.revisao: ~0 rows (approximately)
/*!40000 ALTER TABLE `revisao` DISABLE KEYS */;
INSERT INTO `revisao` (`IDRevisao`, `DataRevisao`, `Resultado`, `Comentario`, `ID_Questionario`) VALUES
	(1, '2020-09-27 20:24:07', 'A', 'Aprovado', 1);
/*!40000 ALTER TABLE `revisao` ENABLE KEYS */;

-- Dumping structure for procedure recuperacao.SP_FazRevisao
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_FazRevisao`(
	IN `Q_ID` INT,
	IN `R_Resultado` CHAR(1),
	IN `R_Comentario` TINYTEXT,
	IN `Q_Aprov` TINYINT

)
    COMMENT 'Permite fazer revisão'
BEGIN

INSERT INTO revisao VALUES (NULL, NOW(), R_Resultado, R_Comentario, Q_ID);

UPDATE questionario
SET DataRespostas = NOW(), ResultadoFinal = R_Resultado, Aprovacao = Q_Aprov
WHERE IDQuestionario = Q_ID;

END//
DELIMITER ;

-- Dumping structure for procedure recuperacao.SP_Lista
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Lista`()
BEGIN

SELECT P.Nome, P.Pais, P.`Estados/Distritos`, P.Cidade, P.Rua, P.`N de porta`, P.`Cod Postal`, P.Tamanho, Q.ResultadoFinal
FROM propriedade P
INNER JOIN propriedadeanalise PA
ON P.IDPropriedade = PA.ID_Propriedade
INNER JOIN analise A
ON PA.ID_Analise = A.IDAnalise
INNER JOIN questionario Q
ON A.ID_Questionario = Q.IDQuestionario
WHERE Q.Aprovacao = 1;

END//
DELIMITER ;

-- Dumping structure for procedure recuperacao.SP_NovaPropriedade
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_NovaPropriedade`(
	IN `P_IDProprietario` INT,
	IN `P_Nome` VARCHAR(50),
	IN `P_Pais` VARCHAR(50),
	IN `P_Distrito` VARCHAR(50),
	IN `P_Cidade` VARCHAR(50),
	IN `P_Rua` VARCHAR(50),
	IN `P_Porta` VARCHAR(50),
	IN `P_CodPostal` VARCHAR(50),
	IN `P_Tamanho` VARCHAR(50)


)
    COMMENT 'Cria e Submete Propriedade para Analise'
BEGIN

/* Insere Nova Propriedade */
INSERT INTO propriedade VALUES (NULL, P_IDProprietario, P_Nome, P_Pais, P_Distrito, P_Cidade, P_Rua, P_Porta, P_CodPostal, P_Tamanho);

/* Guarda o ID da Propriedade */
SET @idprop = '';
SELECT IDPropriedade INTO @idprop FROM propriedade ORDER BY IDPropriedade DESC LIMIT 1;

/* Insere Questionario */
INSERT INTO questionario VALUES (NULL, NULL, NULL, NULL, NULL);

/* Guarda ID do Questionario */
SET @idquest = '';
SELECT IDQuestionario INTO @idquest FROM questionario ORDER BY IDQuestionario DESC LIMIT 1;

/* Insere Analise */
INSERT INTO analise(IDAnalise, ID_Questionario) VALUES (NULL, @idquest);

/* Guarda ID da Analise */
SET @idanalise = '';
SELECT IDAnalise INTO @idanalise FROM analise ORDER BY IDAnalise DESC LIMIT 1;

INSERT INTO propriedadeanalise VALUES (NULL, NOW(), @idprop, @idanalise);

END//
DELIMITER ;

-- Dumping structure for procedure recuperacao.SP_NovoProprietario
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_NovoProprietario`(
	IN `P_Nome` VARCHAR(50),
	IN `P_Email` VARCHAR(50),
	IN `P_Utilizador` VARCHAR(50),
	IN `P_PalavraPasse` VARCHAR(50)







)
    COMMENT 'Insere um novo proprietario'
BEGIN

/* Insere Novo Proprietario */
INSERT INTO proprietario VALUES (NULL, P_Nome, P_Email, P_Utilizador, P_PalavraPasse);

END//
DELIMITER ;

-- Dumping structure for procedure recuperacao.SP_NovoProprietarioFull
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_NovoProprietarioFull`(
	IN `P_Nome` VARCHAR(50),
	IN `P_Email` VARCHAR(50),
	IN `P_Utilizador` VARCHAR(50),
	IN `P_PalavraPasse` VARCHAR(50),
	IN `E_Pais` VARCHAR(50),
	IN `E_Distrito` VARCHAR(50),
	IN `E_Cidade` VARCHAR(50),
	IN `E_Rua` VARCHAR(50),
	IN `E_Porta` VARCHAR(50),
	IN `E_CodPostal` VARCHAR(50),
	IN `T_Numero` VARCHAR(50),
	IN `T_IDT` VARCHAR(50)





)
    COMMENT 'Cria novo proprietario com 1 Numero de telefone e 1 Endereço'
BEGIN

/* Insere Novo Proprietario */
INSERT INTO proprietario VALUES (NULL, P_Nome, P_Email, P_Utilizador, P_PalavraPasse);

/* Guarda o ID do proprietario */
SET @lastid = '';
SELECT IDProprietario INTO @lastid FROM proprietario ORDER BY IDProprietario DESC LIMIT 1;

/* Insere Endereco e Telefone */
INSERT INTO enderecoproprietario VALUES (NULL, @lastid, E_Pais, E_Distrito, E_Cidade, E_Rua, E_Porta, E_CodPostal);
INSERT INTO telefoneproprietario VALUES (NULL, T_Numero, @lastid, T_IDT);

END//
DELIMITER ;

-- Dumping structure for procedure recuperacao.SP_NumeroInscritos
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_NumeroInscritos`()
BEGIN

Select count(*) as Quantidade From proprietario;

END//
DELIMITER ;

-- Dumping structure for procedure recuperacao.SP_Pedido
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Pedido`(
	IN `P_ID` INT,
	IN `A_Aprovacao` TINYINT,
	IN `A_Comentario` TEXT


)
    COMMENT 'Aprova ou rejeita pedidos e ve os restantes'
BEGIN

UPDATE analise A
INNER JOIN propriedadeanalise PA
ON A.IDAnalise = PA.ID_Analise
INNER JOIN propriedade P
ON P.IDPropriedade = PA.ID_Propriedade
SET A.Aprovacao = A_Aprovacao, A.Comentario = A_Comentario, A.DataAnalise = NOW()
WHERE P.IDPropriedade = P_ID;

SELECT * FROM v_pedidos_para_aprovacao;

END//
DELIMITER ;

-- Dumping structure for procedure recuperacao.SP_Publico
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Publico`(
	IN `Q_ID` INT,
	IN `Q_Publico` TINYINT


)
    COMMENT 'Permite o proprietario colocar publico ou privado'
BEGIN

UPDATE questionario
SET Publico = Q_Publico
WHERE IDQuestionario = Q_ID;

END//
DELIMITER ;

-- Dumping structure for procedure recuperacao.SP_Questionario
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Questionario`(
	IN `Q_ID` INT,
	IN `P_Titulo` VARCHAR(50),
	IN `P_Descricao` TINYTEXT
,
	IN `P_Imagem` VARCHAR(50)
)
    COMMENT 'Cria as Perguntas para o Questionario'
BEGIN

/* Declara variavel contador */
/*SET @Counter = 1;*/

/* Começa um ciclo consoante o numero de perguntas pretendido */
/*WHILE @Counter <= NUM DO*/

/* Insere perguntas */
INSERT INTO perguntas VALUES (NULL, P_Titulo, P_Descricao, LOAD_FILE(P_Imagem));
/* NOTA: Para inserir imagem deve colocar a localização da imagem (EX: 'E:/Images/jack.jpg') */

/* Guarda o ID da Pergunta */
SET @idperg = '';
SELECT IDPerguntas INTO @idperg FROM perguntas ORDER BY IDPerguntas DESC LIMIT 1;

/* Insere pergunta/questionario */
INSERT INTO perguntasquestionario VALUES (NULL, @idperg, Q_ID);

/* Incrementa à Variavel @Counter */
/*SET @Counter = @Counter  + 1;*/

/* Finaliza o ciclo */
/*END WHILE;*/


END//
DELIMITER ;

-- Dumping structure for procedure recuperacao.SP_responder
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_responder`(
	IN `Q_ID` INT
,
	IN `P_ID` INT,
	IN `R_Resposta` VARCHAR(50)


)
BEGIN

INSERT INTO respostas (Resposta, DataResposta, ID_Pergunta, ID_Questionario) VALUES (R_Resposta, NOW(), P_ID, Q_ID);

UPDATE questionario
SET DataRespostas = NOW()
WHERE IDQuestionario = Q_ID;

CALL SP_verperguntas(Q_ID);

END//
DELIMITER ;

-- Dumping structure for procedure recuperacao.SP_verpedidos
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_verpedidos`(
	IN `PT_ID` INT

)
BEGIN

SELECT P.Nome, PA.DataSubmissao, A.Aprovacao,A.Comentario, A.DataAnalise
FROM proprietario PT
INNER JOIN propriedade P
ON PT.IDProprietario = P.ID_Proprietario
INNER JOIN propriedadeanalise PA 
ON P.IDPropriedade = PA.ID_Propriedade
INNER JOIN analise A 
ON A.IDAnalise = PA.ID_Analise
WHERE IDProprietario = PT_ID
ORDER BY PA.DataSubmissao;

END//
DELIMITER ;

-- Dumping structure for procedure recuperacao.SP_verperguntas
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_verperguntas`(
	IN `Q_ID` INT


)
BEGIN

SELECT P.TituloPergunta, P.DescricaoPergunta, R.Resposta, R.DataResposta, R.Nota, R.ID_Questionario
FROM respostas R
INNER JOIN perguntas P
ON P.IDPerguntas = R.ID_Pergunta
INNER JOIN perguntasquestionario PQ
ON P.IDPerguntas = PQ.ID_Perguntas
INNER JOIN questionario Q 
ON Q.IDQuestionario = PQ.ID_Questionario
WHERE Q.IDQuestionario = Q_ID;

END//
DELIMITER ;

-- Dumping structure for procedure recuperacao.SP_verpropriedade
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_verpropriedade`(
	IN `PT_ID` INT
)
BEGIN

SELECT * FROM propriedade P
INNER JOIN proprietario PT
ON PT.IDProprietario = P.ID_Proprietario
WHERE PT.IDProprietario = PT_ID;

END//
DELIMITER ;

-- Dumping structure for procedure recuperacao.SP_verquestionario
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_verquestionario`(
	IN `P_ID` INT

)
BEGIN

SELECT Q.IDQuestionario, Q.DataRespostas, Q.Aprovacao, Q.Publico, Q.ResultadoFinal, A.DataAnalise
FROM propriedade P
INNER JOIN propriedadeanalise PA
ON P.IDPropriedade = PA.ID_Propriedade
INNER JOIN analise A
ON A.IDAnalise = PA.ID_Analise
INNER JOIN questionario Q
ON Q.IDQuestionario = A.ID_Questionario
WHERE P.IDPropriedade = P_ID;


SELECT Q.IDQuestionario, Q.DataRespostas, Q.Aprovacao, Q.Publico, Q.ResultadoFinal, A.DataAnalise, R.DataRevisao, R.Resultado, R.Comentario
FROM propriedade P
INNER JOIN propriedadeanalise PA
ON P.IDPropriedade = PA.ID_Propriedade
INNER JOIN analise A
ON A.IDAnalise = PA.ID_Analise
INNER JOIN questionario Q
ON Q.IDQuestionario = A.ID_Questionario
INNER JOIN revisao R
ON Q.IDQuestionario = R.ID_Questionario
WHERE P.IDPropriedade = P_ID;

END//
DELIMITER ;

-- Dumping structure for procedure recuperacao.SP_verrespostas
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_verrespostas`(
	IN `Q_ID` INT

)
    COMMENT 'Permite ao admin rever respostas'
BEGIN

SELECT R.ID_Questionario, P.TituloPergunta, P.DescricaoPergunta, R.Resposta, R.Nota
FROM respostas R
INNER JOIN perguntas P
ON P.IDPerguntas = R.ID_Pergunta
WHERE R.ID_Questionario = Q_ID;

END//
DELIMITER ;

-- Dumping structure for table recuperacao.telefonepropriedade
CREATE TABLE IF NOT EXISTS `telefonepropriedade` (
  `IDTelefonePropriedade` int(11) NOT NULL AUTO_INCREMENT,
  `NumeroTelefone` varchar(20) DEFAULT NULL,
  `ID_Propriedade` int(11) DEFAULT NULL,
  `ID_TipoTelefonePropriedade` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDTelefonePropriedade`),
  KEY `ID_Propriedade` (`ID_Propriedade`),
  KEY `ID_TipoTelefonePropriedade` (`ID_TipoTelefonePropriedade`),
  CONSTRAINT `FK_telefonepropriedade_propriedade` FOREIGN KEY (`ID_Propriedade`) REFERENCES `propriedade` (`IDPropriedade`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_telefonepropriedade_tipotelefone` FOREIGN KEY (`ID_TipoTelefonePropriedade`) REFERENCES `tipotelefone` (`IDTipoTelefone`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table recuperacao.telefonepropriedade: ~0 rows (approximately)
/*!40000 ALTER TABLE `telefonepropriedade` DISABLE KEYS */;
/*!40000 ALTER TABLE `telefonepropriedade` ENABLE KEYS */;

-- Dumping structure for table recuperacao.telefoneproprietario
CREATE TABLE IF NOT EXISTS `telefoneproprietario` (
  `IDTelefoneProprietario` int(11) NOT NULL AUTO_INCREMENT,
  `NumeroTelefone` varchar(20) DEFAULT NULL,
  `ID_Proprietario` int(11) DEFAULT NULL,
  `ID_TipoTelefoneProprietario` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDTelefoneProprietario`),
  KEY `ID_Proprietario` (`ID_Proprietario`),
  KEY `ID_TipoTelefoneProprietario` (`ID_TipoTelefoneProprietario`),
  CONSTRAINT `FK_telefoneproporietario_proprietario` FOREIGN KEY (`ID_Proprietario`) REFERENCES `proprietario` (`IDProprietario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_telefoneproporietario_tipotelefone` FOREIGN KEY (`ID_TipoTelefoneProprietario`) REFERENCES `tipotelefone` (`IDTipoTelefone`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- Dumping data for table recuperacao.telefoneproprietario: ~23 rows (approximately)
/*!40000 ALTER TABLE `telefoneproprietario` DISABLE KEYS */;
INSERT INTO `telefoneproprietario` (`IDTelefoneProprietario`, `NumeroTelefone`, `ID_Proprietario`, `ID_TipoTelefoneProprietario`) VALUES
	(1, '987654321', 11, 1),
	(2, '123', 1, 1),
	(3, '234', 2, 1),
	(4, '222', 3, 1),
	(5, '292', 4, 1),
	(6, '341', 5, 2),
	(7, '391', 6, 3),
	(8, '440', 7, 1),
	(9, '490', 8, 2),
	(10, '539', 9, 3),
	(11, '589', 10, 1),
	(12, '638', 11, 2),
	(13, '688', 12, 3),
	(14, '737', 13, 1),
	(15, '787', 14, 2),
	(16, '836', 15, 3),
	(17, '886', 16, 1),
	(18, '935', 17, 1),
	(19, '985', 18, 1),
	(20, '1034', 19, 2),
	(21, '1084', 20, 3),
	(33, '+351 967 753 951', 43, 2),
	(34, '+351 967 777 951', 44, 1);
/*!40000 ALTER TABLE `telefoneproprietario` ENABLE KEYS */;

-- Dumping structure for table recuperacao.tipotelefone
CREATE TABLE IF NOT EXISTS `tipotelefone` (
  `IDTipoTelefone` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`IDTipoTelefone`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table recuperacao.tipotelefone: ~5 rows (approximately)
/*!40000 ALTER TABLE `tipotelefone` DISABLE KEYS */;
INSERT INTO `tipotelefone` (`IDTipoTelefone`, `Tipo`) VALUES
	(1, 'Movel'),
	(2, 'Residencial'),
	(3, 'Comercial'),
	(4, 'Fax'),
	(5, 'Outro');
/*!40000 ALTER TABLE `tipotelefone` ENABLE KEYS */;

-- Dumping structure for visualização recuperacao.v_novasrevisoespendentes
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_novasrevisoespendentes` (
	`IDQuestionario` INT(11) NOT NULL,
	`DataRespostas` DATETIME NULL,
	`ResultadoFinal` CHAR(1) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for visualização recuperacao.v_novospedidos
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_novospedidos` (
	`IDPropriedade` INT(11) NOT NULL,
	`Nome` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`Pais` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`Estados/Distritos` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`Cidade` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`Rua` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`N de porta` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`Cod Postal` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`Tamanho` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`DataSubmissao` DATETIME NULL,
	`Aprovacao` TINYINT(1) NULL,
	`Comentario` TEXT NULL COLLATE 'utf8_general_ci',
	`DataAnalise` DATETIME NULL
) ENGINE=MyISAM;

-- Dumping structure for visualização recuperacao.v_pedidos_para_aprovacao
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_pedidos_para_aprovacao` (
	`IDPropriedade` INT(11) NOT NULL,
	`Nome` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`Pais` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`Estados/Distritos` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`Cidade` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`Rua` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`N de porta` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`Cod Postal` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`Tamanho` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`DataSubmissao` DATETIME NULL,
	`Aprovacao` TINYINT(1) NULL,
	`Comentario` TEXT NULL COLLATE 'utf8_general_ci',
	`DataAnalise` DATETIME NULL
) ENGINE=MyISAM;

-- Dumping structure for visualização recuperacao.v_pedidos_perito
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_pedidos_perito` (
	`IDQuestionario` INT(11) NOT NULL
) ENGINE=MyISAM;

-- Dumping structure for visualização recuperacao.v_pedidos_resubmetidos
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_pedidos_resubmetidos` (
	`IDPropriedade` INT(11) NOT NULL,
	`Nome` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`Pais` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`Estados/Distritos` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`Cidade` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`Rua` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`N de porta` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`Cod Postal` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`Tamanho` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`DataSubmissao` DATETIME NULL,
	`Aprovacao` TINYINT(1) NULL,
	`Comentario` TEXT NULL COLLATE 'utf8_general_ci',
	`DataAnalise` DATETIME NULL
) ENGINE=MyISAM;

-- Dumping structure for visualização recuperacao.v_pergunta
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_pergunta` (
	`IDPerguntas` INT(11) NOT NULL,
	`TituloPergunta` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`DescricaoPergunta` TINYTEXT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for visualização recuperacao.v_revisoespendentes
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_revisoespendentes` (
	`IDQuestionario` INT(11) NOT NULL,
	`DataRespostas` DATETIME NULL,
	`ResultadoFinal` CHAR(1) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for visualização recuperacao.v_todospedidos
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_todospedidos` (
	`IDPropriedade` INT(11) NOT NULL,
	`Nome` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`Pais` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`Estados/Distritos` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`Cidade` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`Rua` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`N de porta` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`Cod Postal` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`Tamanho` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`DataSubmissao` DATETIME NULL,
	`Aprovacao` TINYINT(1) NULL,
	`Comentario` TEXT NULL COLLATE 'utf8_general_ci',
	`DataAnalise` DATETIME NULL
) ENGINE=MyISAM;

-- Dumping structure for visualização recuperacao.v_verpedidos
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `v_verpedidos` (
	`Nome` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`DataSubmissao` DATETIME NULL,
	`Aprovacao` TINYINT(1) NULL,
	`Comentario` TEXT NULL COLLATE 'utf8_general_ci',
	`DataAnalise` DATETIME NULL
) ENGINE=MyISAM;

-- Dumping structure for visualização recuperacao.v_novasrevisoespendentes
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_novasrevisoespendentes`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_novasrevisoespendentes` AS SELECT IDQuestionario, DataRespostas, ResultadoFinal
FROM questionario
WHERE IDQuestionario NOT IN (SELECT ID_Questionario FROM revisao) ;

-- Dumping structure for visualização recuperacao.v_novospedidos
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_novospedidos`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_novospedidos` AS SELECT P.IDPropriedade, P.Nome, P.Pais, P.`Estados/Distritos`, P.Cidade, P.Rua,P.`N de porta`,P.`Cod Postal`,P.Tamanho, PA.DataSubmissao, A.Aprovacao,A.Comentario,A.DataAnalise
FROM propriedade P
INNER JOIN propriedadeanalise PA 
ON P.IDPropriedade = PA.ID_Propriedade
INNER JOIN analise A 
ON A.IDAnalise = PA.ID_Analise
WHERE A.DataAnalise IS NULL
ORDER BY PA.DataSubmissao ;

-- Dumping structure for visualização recuperacao.v_pedidos_para_aprovacao
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_pedidos_para_aprovacao`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_pedidos_para_aprovacao` AS SELECT P.IDPropriedade, P.Nome, P.Pais, P.`Estados/Distritos`, P.Cidade, P.Rua,P.`N de porta`,P.`Cod Postal`,P.Tamanho, PA.DataSubmissao, A.Aprovacao,A.Comentario,A.DataAnalise
FROM propriedade P
INNER JOIN propriedadeanalise PA 
ON P.IDPropriedade = PA.ID_Propriedade
INNER JOIN analise A 
ON A.IDAnalise = PA.ID_Analise
WHERE PA.DataSubmissao > A.DataAnalise
OR A.DataAnalise IS NULL
ORDER BY PA.DataSubmissao ;

-- Dumping structure for visualização recuperacao.v_pedidos_perito
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_pedidos_perito`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_pedidos_perito` AS SELECT Q.IDQuestionario 
FROM analise A
INNER JOIN questionario Q
ON Q.IDQuestionario = A.ID_Questionario
WHERE A.Aprovacao = 1
AND Q.IDQuestionario NOT IN (SELECT ID_Questionario FROM perguntasquestionario) ;

-- Dumping structure for visualização recuperacao.v_pedidos_resubmetidos
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_pedidos_resubmetidos`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_pedidos_resubmetidos` AS SELECT P.IDPropriedade, P.Nome, P.Pais, P.`Estados/Distritos`, P.Cidade, P.Rua,P.`N de porta`,P.`Cod Postal`,P.Tamanho, PA.DataSubmissao, A.Aprovacao,A.Comentario,A.DataAnalise
FROM propriedade P
INNER JOIN propriedadeanalise PA 
ON P.IDPropriedade = PA.ID_Propriedade
INNER JOIN analise A 
ON A.IDAnalise = PA.ID_Analise
WHERE PA.DataSubmissao > A.DataAnalise
ORDER BY PA.DataSubmissao ;

-- Dumping structure for visualização recuperacao.v_pergunta
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_pergunta`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_pergunta` AS SELECT * FROM perguntas ;

-- Dumping structure for visualização recuperacao.v_revisoespendentes
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_revisoespendentes`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_revisoespendentes` AS SELECT IDQuestionario, DataRespostas, ResultadoFinal
FROM questionario Q
INNER JOIN revisao R
ON Q.IDQuestionario = R.ID_Questionario
WHERE R.DataRevisao < Q.DataRespostas ;

-- Dumping structure for visualização recuperacao.v_todospedidos
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_todospedidos`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_todospedidos` AS SELECT P.IDPropriedade, P.Nome, P.Pais, P.`Estados/Distritos`, P.Cidade, P.Rua,P.`N de porta`,P.`Cod Postal`,P.Tamanho, PA.DataSubmissao, A.Aprovacao,A.Comentario,A.DataAnalise
FROM propriedade P
INNER JOIN propriedadeanalise PA 
ON P.IDPropriedade = PA.ID_Propriedade
INNER JOIN analise A 
ON A.IDAnalise = PA.ID_Analise
ORDER BY A.Aprovacao ;

-- Dumping structure for visualização recuperacao.v_verpedidos
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `v_verpedidos`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_verpedidos` AS SELECT P.Nome, PA.DataSubmissao, A.Aprovacao,A.Comentario, A.DataAnalise
FROM proprietario PT
INNER JOIN propriedade P
ON PT.IDProprietario = P.ID_Proprietario
INNER JOIN propriedadeanalise PA 
ON P.IDPropriedade = PA.ID_Propriedade
INNER JOIN analise A 
ON A.IDAnalise = PA.ID_Analise
ORDER BY PA.DataSubmissao ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
