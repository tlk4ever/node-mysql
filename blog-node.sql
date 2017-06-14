# Host: localhost  (Version 5.5.5-10.1.21-MariaDB)
# Date: 2017-06-13 23:25:06
# Generator: MySQL-Front 6.0  (Build 1.32)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "autor"
#

DROP TABLE IF EXISTS `autor`;
CREATE TABLE `autor` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOME` varchar(255) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Data for table "autor"
#

INSERT INTO `autor` VALUES (1,'Thiago Brito','thiago@email.com'),(2,'Raquel Zanini','raquel@email.com');

#
# Structure for table "login"
#

DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOGIN` varchar(100) DEFAULT NULL,
  `SENHA` varchar(100) DEFAULT NULL,
  `AUTOR_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_LOGIN_AUTOR` (`AUTOR_ID`),
  CONSTRAINT `FK_LOGIN_AUTOR` FOREIGN KEY (`AUTOR_ID`) REFERENCES `autor` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Data for table "login"
#

INSERT INTO `login` VALUES (1,'thiago','123456',1),(2,'raquel','123456',2);

#
# Structure for table "post"
#

DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITULO` varchar(255) DEFAULT NULL,
  `CORPO` text,
  `DATA` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `AUTOR_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `AUTOR_ID_FK` (`AUTOR_ID`),
  CONSTRAINT `AUTOR_ID_FK` FOREIGN KEY (`AUTOR_ID`) REFERENCES `autor` (`ID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

#
# Data for table "post"
#

INSERT INTO `post` VALUES (1,'Suspeito de ter diploma falso, professor da UFPB deu aula em 8 faculdades','Ele trabalhava como professor na Universidade Federal da Paraíba (UFPB) havia dez anos. Era descrito como um”ótimo profissional” e “altamente preparado” por seus alunos, com “muito conhecimento dos assuntos”. Era um professor focado, com aulas dinâmicas e que prendiam a atenção dos estudantes. Antes de chegar à UFPB, passou por pelo menos oito faculdades em Estados como Pernambuco e Maranhão.\r\nAté que em fevereiro, o professor universitário Deyve Redyson Melo dos Santos foi afastado do trabalho. A suspeita é que ele tenha apresentado diplomas falsos, motivo também que gerou um inquérito na PF (Polícia Federal).\r\nRedyson foi chamado a depor no dia 31.mar.2017, mas preferiu ficar calado –direito previsto na Constituição Federal. Ele também não quis conversar com a reportagem do UOL sobre a investigação.\r\nSua advogada, Kátia Farias, justificou que a situação causou um “impacto tremendo” na vida dele. “Um dia a pessoa tem uma vida pessoal e profissional totalmente organizada, no outro tudo está desconstruído”, afirmou.\r\nO afastamento, segundo Farias, pegou o professor de surpresa. “Nessa época, em fevereiro, ocorreu tanto o afastamento da instituição, sem remuneração, quanto a busca e a apreensão dos diplomas e documentos pela Polícia Federal. Foram atos conjuntos. Tudo ocorreu no mesmo dia e ele não tinha qualquer conhecimento sobre nenhum procedimento administrativo ou policial envolvendo seu nome”.','2017-06-10 16:12:28',1),(2,'Aos 79 anos, Martinho da Vila faz faculdade de relações internacionais','É sem alarde – ou devagar, devagarinho – que Martinho da Vila, de 79 anos, vem cursando o 5º período do curso de Relações Internacionais em uma faculdade paga do Rio de Janeiro. Os que desconheciam a empreitada acadêmica do sambista, iniciada em 2015, ficaram admirados ao vê-lo dentro de sala de aula, em uma foto tirada por um colega e postada na internet. Martinho, mesmo, não mostra qualquer espanto. A incursão universitária, que pode levá-lo a um cargo mais alto na CPLP (Comunidade dos Países de Língua Portuguesa), da qual é embaixador da boa vontade, é feita em ritmo moderado.\r\n“Passei no vestibular e escrevi à direção da Estácio de Sá, pedindo para ser aluno especial, aquele que faz o curso para adquirir conhecimento, não para formação profissional. Eu estudo as matérias que mais me interessam, não preciso fazer provas. Estatística, por exemplo, eu não vou fazer”, conta o cantor, citando uma matéria longe de sua predileção.\r\nO sambista também refuta comparações com um de seus hits, O Pequeno Burguês (aquele dos versos “Felicidade, passei no vestibular / Mas a faculdade é particular”), que seus colegas parecem desconhecer. “São meninos de 20 anos, que tinham 18 quando entrei. Eles me veem com naturalidade, me veem como igual a todo mundo.”','2017-06-10 16:30:50',2),(9,'Mãe encontra paredes com símbolos e criptografia após jovem sumir no AC',' Um quarto de um jovem encontrado com paredes cheias de sinais e livros escritos à mão e o desaparecimento do autor, o estudante de psicologia Bruno Borges, de 24 anos. O mistério, que viralizou nas redes sociais, é investigado pela Polícia Civil de Rio Branco (AC).\r\nDesde o dia 27.mar.2017, Borges está sumido, segundo sua família, e não fez nenhum contato. Em seu quarto, foram encontrados 14 livros escritos à mão e criptografados, além de figuras e algarismos romanos.\r\nO estudante não é visto desde que foi deixado pelo pai na porta de casa, em um bairro de classe média na capital do Acre.\r\nA parede, o piso e alguns móveis do quarto receberam os escritos de Borges. No meio do cômodo, ele colocou uma estátua em tamanho natural do filósofo italiano Giordano Bruno que, segundo o pai do jovem, o empresário Athos Borges, foi comprada pelo valor de R$ 7.000.\r\nEntre outras ideias, Giordano defendia que toda estrela era realmente um sol, rodeada de planetas, e que haveria mundos similares ao nosso em torno desses sóis. Ele foi perseguido por suas ideias subversivas e morto numa fogueira pela Inquisição em 1600.\r\nNas redes sociais, internautas comentam sobre a semelhança física entre Bruno e o filósofo.\r\nA mãe de Bruno, a psicóloga Denise Borges, disse que antes do desaparecimento o quarto do filho era normal, igual ao de um jovem estudante.','2017-06-10 18:46:04',1);
