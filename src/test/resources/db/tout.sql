drop schema if exists `newro-factory-db`;
  create schema if not exists `newro-factory-db`;
  use `newro-factory-db`;

  drop table if exists stagiaire;
  drop table if exists promotion;
  drop table if exists questions;
  drop table if exists questions_propositions;
  drop table if exists chapitre;

  create table promotion (
    id                        bigint not null auto_increment,
    name                      varchar(255),
    constraint pk_promotion primary key (id))
  ;

  create table stagiaire (
    id                        bigint not null auto_increment,
    first_name                      varchar(255),
    last_name                      varchar(255),
    arrival                timestamp NULL,
    formation_over              timestamp NULL,
    promotion_id                bigint default NULL,
    constraint pk_stagiaire primary key (id))
  ;

  alter table stagiaire add constraint fk_stagiaire_promotion_1 foreign key (promotion_id) references promotion (id) on delete restrict on update restrict;
  create index ix_stagiaire_promotion_1 on stagiaire (promotion_id);

 CREATE TABLE `chapter` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(100) NOT NULL,
	`parent_path` varchar(500) NOT NULL DEFAULT '/',
	PRIMARY KEY (`id`)
);

CREATE TABLE `question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `statement` text NOT NULL,
  `chapter_id` int NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `QUESTION_ibfk_1` FOREIGN KEY (`chapter_id`) REFERENCES `chapter` (`id`)
);

CREATE TABLE `answer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(1) NOT NULL,
  `text` varchar(255) NOT NULL,
  `valid_answer` tinyint(1) NOT NULL,
  `question_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ANSWER_ibfk_1_idx` (`question_id`),
  CONSTRAINT `ANSWER_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
);


  #-----------------------------------
  #USER RIGHTS MANAGEMENT
  #-----------------------------------
  CREATE USER 'adminnewro'@'localhost' IDENTIFIED BY 'qwerty1234';

  GRANT ALL PRIVILEGES ON `newro-factory-db`.* TO 'adminnewro'@'localhost' WITH GRANT OPTION;


  FLUSH PRIVILEGES;INSERT INTO promotion(id, name) VALUES (1,'F??vrier 2011');
INSERT INTO promotion(id, name) VALUES (2,'Mars 2011');
INSERT INTO promotion(id, name) VALUES (3,'Avril 2011');
INSERT INTO promotion(id, name) VALUES (4,'F??vrier 2012');
INSERT INTO promotion(id, name) VALUES (5,'Mars 2012');
INSERT INTO promotion(id, name) VALUES (6,'Avril 2012');
INSERT INTO promotion(id, name) VALUES (7,'Mai 2012');
INSERT INTO promotion(id, name) VALUES (8,'F??vrier 2013');
INSERT INTO promotion(id, name) VALUES (9,'Mars 2013');
INSERT INTO promotion(id, name) VALUES (10,'Avril 2013');
INSERT INTO promotion(id, name) VALUES (11,'Mai 2013');
INSERT INTO promotion(id, name) VALUES (12,'F??vrier 2014');
INSERT INTO promotion(id, name) VALUES (13,'Mars 2014');
INSERT INTO promotion(id, name) VALUES (14,'Avril 2014');
INSERT INTO promotion(id, name) VALUES (15,'Mai 2014');
INSERT INTO promotion(id, name) VALUES (16,'F??vrier 2015');
INSERT INTO promotion(id, name) VALUES (17,'Mars 2015');
INSERT INTO promotion(id, name) VALUES (18,'Avril 2015');
INSERT INTO promotion(id, name) VALUES (19,'Mai 2015');
INSERT INTO promotion(id, name) VALUES (20,'F??vrier 2016');
INSERT INTO promotion(id, name) VALUES (21,'Mars 2016');
INSERT INTO promotion(id, name) VALUES (22,'Avril 2016');
INSERT INTO promotion(id, name) VALUES (23,'Mai 2016');
INSERT INTO promotion(id, name) VALUES (24,'F??vrier 2017');
INSERT INTO promotion(id, name) VALUES (25,'Mars 2017');
INSERT INTO promotion(id, name) VALUES (26,'Avril 2017');
INSERT INTO promotion(id, name) VALUES (27,'Mai 2017');
INSERT INTO promotion(id, name) VALUES (28,'F??vrier 2018');
INSERT INTO promotion(id, name) VALUES (29,'Mars 2018');
INSERT INTO promotion(id, name) VALUES (30,'Avril 2018');
INSERT INTO promotion(id, name) VALUES (31,'Mai 2018');
INSERT INTO promotion(id, name) VALUES (32,'F??vrier 2019');
INSERT INTO promotion(id, name) VALUES (33,'Mars 2019');
INSERT INTO promotion(id, name) VALUES (34,'Avril 2019');
INSERT INTO promotion(id, name) VALUES (35,'Mai 2019');
INSERT INTO promotion(id, name) VALUES (36,'F??vrier 2020');
INSERT INTO promotion(id, name) VALUES (37,'Mars 2020');
INSERT INTO promotion(id, name) VALUES (38,'Avril 2020');
INSERT INTO promotion(id, name) VALUES (39,'Mai 2020');
INSERT INTO promotion(id, name) VALUES (40,'F??vrier 2021');
INSERT INTO promotion(id, name) VALUES (41,'Mars 2021');
INSERT INTO promotion(id, name) VALUES (42,'Avril 2021');
INSERT INTO promotion(id, name) VALUES (43,'Mai 2021');
INSERT INTO promotion(id, name) VALUES (44,'F??vrier 2022');
INSERT INTO promotion(id, name) VALUES (45,'Mars 2022');
INSERT INTO promotion(id, name) VALUES (46,'Avril 2022');
INSERT INTO promotion(id, name) VALUES (47,'Mai 2022');

INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Abel','Boulle',1);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Ab??lard','Grandjean',1);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Abelin','Bourguignon',1);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Abraham','Delannoy',1);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Achille','Charbonnier',1);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Adam','Bousquet',1);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Ad??lie','Bellegarde',1);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Ad??lie','Lavaud',1);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Ad??lie','Rouzet',1);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Adrienne','Geiger',1);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Adrienne','Mazet',1);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Agn??s','Courtial',1);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Alain','Delcroix',1);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Alberte','Dimont',1);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Alceste','Marchant',2);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Alceste','Serre',2);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Alexandre','Bethune',2);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Alfred','Lacan',2);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Alix','Arsenault',2);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Alix','Gardet',2);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Amand','Baschet',2);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Amand','Silvestre',2);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Amanda','Morel',2);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Ana??s','Monteil',2);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Andr??e','Philidor',2);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Ang??le','Beauchamp',2);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Ang??le','Cochet',2);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Angeline','Cuvier',2);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Anne-Laure','Bertillon',2);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Anne-Marie','Brochard',2);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Anne-Sophie','Berger',2);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Annick','Desmarais',2);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Annick','G??rald',3);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Annick','Picard',3);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Antoine','Berger',3);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Ariane','Magnier',3);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Armel','Ardouin',3);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Armelle','Ouvrard',3);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Ars??ne','Simon',3);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Ars??ne','Trouv??',4);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Aubin','Guilloux',4);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Aude','Besson',4);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Audrey','B??langer',4);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Augustin','Chaney',4);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Augustine','Niel',4);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Aur??lia','Allard',4);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Axelle','Chuquet',4);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Axelle','Thiers',4);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Aymeric','Moreau',4);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Barbe','Droz',4);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Barth??lemy','Gavreau',4);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Bastien','Arceneaux',5);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('B??lise','Courbis',5);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('B??lise','Cousteau',5);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('B??n??dicte','Chauve',5);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('B??n??dicte','Delon',5);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('B??n??dicte','Jullien',5);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('B??n??dicte','Moineau',5);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Beno??t','Benett',5);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Beno??t','Jaubert',6);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('B??rang??re','Lavigne',6);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('B??reng??re','Bittencourt',6);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('B??reng??re','Boudet',6);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('B??r??nice','Jauffret',6);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Berthe','Affr??',6);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Bethsab??e','Balzac',6);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Bethsab??e','Duval',6);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Blaise','Brochard',6);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Blaise','Colbert',6);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Blanche','Baum??',7);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Brice','Bacque',7);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Brice','Doisneau',7);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Brigitte','Barthet',7);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Bruno','LaFromboise',7);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Camille','Maitre',8);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Camille','P??rier',8);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Capucine','Celice',8);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Capucine','Haillet',8);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Carmen','Berthelot',8);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Caro','Deslys',8);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Caro','Dujardin',8);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('C??cile','Beaulieu',8);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('C??cile','G??rard',8);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('C??leste','Charbonneau',8);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Charl??ne','Pueyrred??n',8);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Charlotte','??douard',9);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Chlo??','Tr??maux',9);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Christelle','Touchard',9);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Christophe','Peltier',9);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Christopher','Deschanel',9);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Clara','Lebas',9);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Claude','Deniau',9);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Claude','Genest',9);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Claudia','Dimont',10);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Claudia','Hector',10);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Claudie','Leroux',10);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Claudine','Reverdin',10);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Cl??lia','Pascal',10);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Cl??lia','Philidor',10);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Cl??lia','Vandame',10);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Cl??lie','Verninac',10);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Clotilde','Mace',10);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Colin','Abadie',10);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('C??me','Bourguignon',10);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Constance','Jeannin',10);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Coralie','LeTonnelier',11);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Cyril','G??rin',11);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Cyrille','L??ger',11);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Damien','G??rin',11);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Danielle','Pierlot',11);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Dany','Boutin',11);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Dany','Toussaint',11);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('David','Gagnon',11);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('David','Prudhomme',11);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Davy','Auch',11);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('D??bora','Bouchard',11);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('D??borah','Lemaigre',11);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Denis','Cuvillier',11);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Dimitri','Naud??',11);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Dolor??s','Chapuis',12);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Dominique','Boudreaux',12);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Dominique','DAmboise',12);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Dominique','Poincar??',12);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Doroth??e','Brasseur',12);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('??dith','Berger',12);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('??gide','Bachelet',12);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('??gide','Millet',12);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('??lie','Dujardin',12);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('??lie','Gaudin',12);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('??lise','Bouthillier',13);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Elise','Lussier',13);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('??lis??e','Vaillancourt',13);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('??loi','Charbonneau',13);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('??lo??se','Laframboise',13);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Emilie','Chagnon',13);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Emma','Lecl??re',13);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Emmanuel','Choquet',13);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Esther','Thibodeau',13);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Estienne','Neri',14);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Estienne','Philippon',14);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('??tienne','Garnier',14);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Eug??ne','Bourdon',14);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Eulalie','Allais',14);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Eulalie','Devilliers',14);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('??va','Sharpe',14);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('??velyne','Landry',14);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('??velyne','Robillard',14);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('??vrard','Pleimelding',14);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Fabien','Lafl??che',15);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('F??licit??','Charbonneau',15);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('F??lix','Larousse',15);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Fernand','Auger',15);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Fernand','Laurent',15);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Fernand','Loup',15);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Fiona','Thiers',15);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Flore','Berengar',15);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Florentin','Boudier',15);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('France','Matthieu',15);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('France','R??my',15);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Franck','Cordonnier',15);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Fr??d??ric','Rossignol',15);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Gaby','Bassot',15);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Gaby','Beaumont',15);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Ga??l','Bittencourt',15);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Ga??lle','Pueyrred??n',15);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Ga??tan','Alard',15);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Ga??tan','Duchamp',15);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Ga??tane','Charbonneau',16);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Ga??tane','Donnet',16);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Gaspard','Peletier',16);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Gauthier','Deshaies',16);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Gauthier','Dupont',16);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Gautier','Brunelle',16);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Gautier','Manaudou',16);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Genevi??ve','Beauvilliers',16);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('G??rard','Chabert',16);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Germain','Loup',16);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('G??r??me','Pichard',16);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Gervais','Chauve',16);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Gervais','Loup',16);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Gervais','Poussin',16);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Gervaise','Didier',16);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Gervaise','Gachet',16);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Ghislain','Baum??',16);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Ghyslaine','Cl??rico',17);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Ghyslaine','Leroux',17);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Gilbert','G??rard',17);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Giselle','Cl??rico',17);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Godefroy','Beaugendre',17);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Godeleine','Crozier',17);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Guillaume','Jacquemoud',17);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Guillaume','Montgomery',17);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Guillemette','Duclos',17);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Gustave','Pierlot',18);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Gwena??l','Courbis',18);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Hector','Chapelle',18);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Hector','Kl??ber',18);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Hector','Laurent',18);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('H??lo??se','Badeaux',18);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Henriette','Bissonnette',18);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Henriette','Chaney',18);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Henriette','J??gou',18);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Henriette','Subercaseaux',18);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Hippolyte','Deloffre',18);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Hippolyte','Lazard',19);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Honorine','Barth??lemy',19);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Hubert','Halphen',19);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Huguette','Garreau',19);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Ignace','Laframboise',19);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Igor','Chauveau',19);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Igor','Subercaseaux',19);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('In??s','Pierrat',19);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Ingrid','Toit',19);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Isaac','Chevotet',19);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Ivanna','Hachette',20);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Jasmin','Auclair',20);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Jasmin','Parmentier',20);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Jasmine','Alard',20);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Jasmine','Rousseau',20);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Jean-Baptiste','Pleimelding',20);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Jean-Charles','Beaux',20);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Jean-Charles','Moreau',20);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Jean-Christophe','Kaplan',20);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Jean-Claude','Saunier',20);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Jean-Fran??ois','Suchet',20);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Jean-Jacques','Schaeffer',20);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Jean-Jacques','Suchet',20);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Jean-Jo??l','Couvreur',21);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Jean-Luc','Barrault',21);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Jean-Luc','Baschet',21);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Jean-Luc','Maret',21);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Jean-Marc','Arceneaux',21);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Jean-Marc','Charbonnier',21);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Jean-Marc','Rigal',21);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Jean-Marie','Moreau',21);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Jean-Michel','Cazal',21);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Jean-Michel','Michaux',22);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Jean-No??l','Botrel',22);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Jean-Paul','Berlioz',22);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Jean-Philippe','Giraud',22);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Jean-Philippe','Jacquinot',22);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Jean-Yves','Landry',22);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Jeanne','P??rier',22);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('J??r??mie','Thiers',22);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('J??r??me','Roatta',22);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Jessica','M??nard',22);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Jo??l','LeMahieu',22);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Jo??lle','Dujardin',22);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Jordan','Delon',22);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Jos??e','Bonnel',23);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Jos??e','Houdin',23);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Jos??phine','Jacquard',23);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Josette','Lema??tre',23);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Josselin','Bertillon',23);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Josselin','Choffard',23);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Josselin','Loup',23);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Josselin','Malet',23);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Josseline','Lucy',24);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Jules','Longchambon',24);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Julia','Bozonnet',24);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Juliette','Mignard',24);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Justin','Dumont',24);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Justin','Gaubert',24);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Justin','Sylvestre',24);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Kevin','Az??ma',24);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Killian','Bonnet',24);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Ladislas','Rousseau',24);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('La??titia','Regnard',24);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Lara','Beaumanoir',24);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Laurence','Flandin',24);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Laurent','Beauvau',24);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Laurette','Cuvier',25);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('L??a','Beaumont',25);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('L??a','L??mery',25);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('L??o','LeMahieu',25);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('L??onard','Boudier',25);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('L??onard','Morel',25);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('L??opold','Portier',25);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Linda','Auch',25);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Lisa','F??ret',26);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Lisette','Blanchard',26);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Lorraine','Bain',26);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Lorraine','Fresnel',26);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Lou','Auguste',26);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Lou','Mallet',26);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Louis','Sol??',26);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Louise','Gaume',26);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Loup','Alm??ras',26);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Luc','Cl??rico',26);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Luc','Saunier',27);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Lucas','Berthelot',27);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Lucas','R??my',27);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Lucille','Girard',27);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Lucr??ce','Carbonneau',27);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Lucr??ce','Raoult',27);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Lucr??ce','Rousseau',27);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Ludovic','Balzac',27);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Ludovic','Deslys',27);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Ludovic','Dior',28);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Lydie','Saint-Pierre',28);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Lydie','Vaugrenard',28);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Ma??l','Bazalgette',28);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Ma??l','Silvestre',28);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Ma??va','Charpentier',28);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Ma??va','Mallet',28);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Manon','Leclair',28);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Marc-Antoine','Bachelet',28);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Margot','Gounelle',28);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Marianne','Subercaseaux',29);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Marie-Ange','Berger',29);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Marie-Ange','C??t??',29);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Marie-Claire','Boulle',29);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Marie-Claude','Ponce',29);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Marie-Fran??oise','Messier',29);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Marie-Jos??','Vaugeois',29);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Marie-Laure','Gauthier',30);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Marie-Laure','Leroux',30);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Marie-No??lle','Jacquet',30);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Marie-No??lle','Landry',30);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Marie-Paule','Boissieu',30);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Marie-Th??r??se','Beaugendre',30);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Marielle','Maurice',30);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Marina','B??langer',31);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Marinette','Chagnon',31);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Marion','Delaunay',31);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Marius','Jaccoud',31);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Marthe','Brassard',31);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Marthe','Brousseau',31);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Marthe','Girault',31);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Martin','Chausson',31);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Maryvonne','Boissieu',32);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Maryvonne','Carbonneau',32);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Math??o','DAboville',32);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Matthias','Abbadie',32);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Maud','Blanchet',32);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Max','Larousse',32);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Maxime','Parmentier',32);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Maxime','Vaugeois',32);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('M??dard','Niel',32);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('M??gane','Asselineau',32);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('M??lanie','Cazenave',32);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('M??lissa','Durand',33);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('M??lodie','B??liveau',33);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('M??lodie','Carrel',33);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Micha??l','Maurice',33);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Michel','Vernier',33);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Mich??le','Bourseiller',33);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Michelle','Villiers',33);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Micka??l','Cr??pin',33);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Milo','Aubert',33);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Myriam','Dufour',33);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Myriam','Loupe',33);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Nadia','Lalande',33);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Nadine','Demb??l??',33);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Napol??on','Gigot',33);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Natana??l','Loupe',33);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Nathan','Blaise',34);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Nathan','Boudet',34);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Nathan','Duchemin',34);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Nathana??l','Gallois',34);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Nicolas','Cahun',34);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Nicolas','LaFromboise',34);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Nikita','Beaugendre',35);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Nikita','Spanghero',35);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Ninon','Leroux',35);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('No??','H??risson',35);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('No??mi','Allais',35);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Oc??ane','Demaret',35);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Odette','Berthelot',35);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Odile','Toit',35);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Odile','Gainsbourg',36);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Olivier','Gainsbourg',36);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Olivier','Nicollier',36);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Olivier','Sol??',36);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Oph??lie','Rigal',36);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Pascal','Thibault',36);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Pascale','Blanc',36);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Patrice','Aza??s',36);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Patrice','Beauvilliers',36);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Patricia','Delaunay',36);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Patrick','Pascal',36);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Paulin','Delannoy',36);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Pauline','F??tique',36);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Peggy','Lavaud',37);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Philibert','Carrell',37);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Philibert','Verley',37);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Philippe','Gueguen',37);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Pierre-Marie','Cartier',37);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Pierre-Marie','Delafose',37);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Pierre-Marie','Dieulafoy',37);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Porthos','Seyr??s',37);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Quentin','Gaumont',38);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Quentin','G??rard',38);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Quentin','Manoury',38);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Rachelle','Berthelot',38);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Rapha??l','Gainsbourg',38);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Rebecca','Bittencourt',38);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Rebecca','Duclos',38);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('R??gine','Demaret',38);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('R??gis','Duret',38);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('R??gis','Marais',38);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('R??mi','B??liveau',38);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('R??mi','Durand',38);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Remi','Haillet',38);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('R??mi','Joubert',39);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Remy','Leroux',39);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Ren??','Moreau',39);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Ren??','Vall??e',39);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Richard','Sartre',39);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Roberte','Lucy',40);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Roberte','Moineau',40);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Roch','Bozonnet',40);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Roger','Duret',40);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Rolande','Allaire',40);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Rolande','Bourdon',40);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Romane','Marchal',40);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Rom??o','Carr??',40);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Romuald','Seyr??s',40);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Rosalie','Bassot',40);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Rosalie','Boulet',40);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Rose','Clair',41);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Roseline','Ancel',41);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Roseline','Bureau',41);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Roseline','Chabert',41);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Roxane','Ouvrard',41);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Roxane','Pomeroy',41);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Sabine','Crevier',41);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Sabine','Desjardins',41);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Sacha','Bourcier',41);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Sacha','Delafosse',41);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Sacha','Fr??re',42);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Samuel','Belyea',42);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Samuel','Carrel',42);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Sandrine','Hennequin',42);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Sandrine','Maret',42);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Sara','Auguste',42);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Sarah','Villiers',42);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Sarah','Leavitt',42);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Sarah','Silvestre',42);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('S??bastien','Barrande',42);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('S??gol??ne','Verley',42);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('S??verin','Appell',42);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Silvain','Boudet',43);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Simon','Bourbeau',43);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Simon','Toutain',43);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Solange','Bourguignon',43);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Sophie','V??rany',43);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('St??phane','Fouquet',43);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('St??phane','Vaugrenard',43);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('St??phanie','Alm??ras',43);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('St??phanie','Gainsbourg',43);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Suzanne','Demaret',43);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Suzanne','Pleimelding',43);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Sylvaine','Dior',43);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Sylvaine','Plantier',43);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Sylvia','V??rany',43);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Sylviane','Plantier',44);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Sylvie','??douard',44);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Sylvie','Rousseau',44);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Th??odore','Beauvau',44);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Thibaud','Ouvrard',44);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Thibault','Levett',44);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Thibaut','Gouin',44);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Thibaut','Raoult',44);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Thibaut','Rochefort',44);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Timoth??','Gavreau',44);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Timoth??','Grinda',44);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Timoth??','Jaubert',44);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Tiphaine','Pasteur',45);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Tobie','Kaplan',45);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Tristan','Caillat',45);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Valentin','Dieulafoy',45);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Val??rie','Cuvillier',45);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Val??ry','Jacquard',45);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Vanessa','Landry',45);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Vanessa','Manoury',45);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Victoire','Coulomb',45);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Victoire','Delacroix',45);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Victoria','Beaulne',45);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Victoria','Bescond',45);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Victoria','Delisle',45);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Viviane','Brian',45);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Wilfrid','Delafose',46);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Wilfried','Barbet',46);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('William','Bonnet',46);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('William','L??ger',46);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('William','Saint-Yves',46);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Xavier','Bonnet',46);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Xavier','Dimont',46);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Xavier','Trudeau',46);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Yolande','Lecerf',47);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Yseult','Boudet',47);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Yvette','Barrault',47);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Yvette','Paquin',47);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Yvette','Wathelet',47);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Yvon','Battier',47);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Yvon','Cartier',47);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Yvonne','Devereux',47);
INSERT INTO stagiaire(first_name, last_name, promotion_id) VALUES ('Zacharie','Laframboise',47);

INSERT INTO chapter (id, name, parent_path) VALUES(145, '"FINALIZE()"', '/OCA/CH 1 Java Building Blocks/DESTROYING OBJECTS/');
INSERT INTO chapter (id, name, parent_path) VALUES(178, '[OCA] D??velopper avec des classes et m??thodes abstraites', '/OCP Exam Objectives/Conception avanc??e de Classes Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(181, '[OCA] D??velopper avec le mot-cl?? final', '/OCP Exam Objectives/Conception avanc??e de Classes Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(325, '[OPT] Aper??u des classes de Stream de base', '/OCP Exam Objectives/Les fondamentaux de Java IO/Lire et ??crire des donn??es/');
INSERT INTO chapter (id, name, parent_path) VALUES(527, '[OPT] Bonne pratique des classes', '/OCA Exam Objectives/Structure d''une classe Java/G??rer les classes dans un fichier/');
INSERT INTO chapter (id, name, parent_path) VALUES(589, '[OPT] Compiler et executer manuellement un paquet', '/OCA Exam Objectives/L''organisation en paquets de Java/Cr??er un nouveau paquet /');
INSERT INTO chapter (id, name, parent_path) VALUES(223, '[opt] Complexit?? et notation O', '/OCP Exam Objectives/G??n??ricit?? et Collections/Cr??er et utiliser les objets de Collections/');
INSERT INTO chapter (id, name, parent_path) VALUES(590, '[OPT] Comprendre le principe des classpath', '/OCA Exam Objectives/L''organisation en paquets de Java/Cr??er un nouveau paquet /');
INSERT INTO chapter (id, name, parent_path) VALUES(578, '[OPT] Comprendre les diff??rences avec un passage par r??f??rence dans les autres langages', '/OCA Exam Objectives/Les m??thodes et l''encapsulation/Ma??triser le passage de param??tre par valeur/');
INSERT INTO chapter (id, name, parent_path) VALUES(188, '[OPT] Le Pattern Builder', '/OCP Exam Objectives/Conception de Classes Java/Impl??menter les Design Patterns/');
INSERT INTO chapter (id, name, parent_path) VALUES(191, '[OPT] Le Pattern Factory', '/OCP Exam Objectives/Conception de Classes Java/Impl??menter les Design Patterns/');
INSERT INTO chapter (id, name, parent_path) VALUES(231, '[OPT] M??thodes par d??faut', '/OCP Exam Objectives/Interfaces fonctionnelles int??gr??es ?? Java/Utiliser les interfaces int??gr??es dans le package java.util.fonction/');
INSERT INTO chapter (id, name, parent_path) VALUES(385, '[opt] R??capitulaitf des diff??rentes m??thodes de l''objet File et NIO2', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/');
INSERT INTO chapter (id, name, parent_path) VALUES(275, '[opt] r??capitulatif', '/OCP Exam Objectives/API Stream de Java/Utiliser les op??rations terminales/');
INSERT INTO chapter (id, name, parent_path) VALUES(218, '[opt] R??capitulatif de merge() et des m??thodes compute', '/OCP Exam Objectives/G??n??ricit?? et Collections/Cr??er et utiliser les objets de Collections/Maps/');
INSERT INTO chapter (id, name, parent_path) VALUES(393, '[OPT] R??capitulatif des classes de Stream', '/OCP Exam Objectives/Les fondamentaux de Java IO/Lire et ??crire des donn??es/');
INSERT INTO chapter (id, name, parent_path) VALUES(281, '[OPT] R??capitulatif des Exceptions ?? conna??tre', '/OCP Exam Objectives/Exceptions et Assertions/');
INSERT INTO chapter (id, name, parent_path) VALUES(369, '[OPT] Utiliser l''encodage des caract??res', '/OCP Exam Objectives/Les fondamentaux de Java IO/Lire et ??crire des donn??es/Les Classes de Stream/');
INSERT INTO chapter (id, name, parent_path) VALUES(396, '[OPT] Version historique', '/OCP Exam Objectives/Les fondamentaux de Java IO/Lire et ??crire des donn??es depuis la console/');
INSERT INTO chapter (id, name, parent_path) VALUES(492, 'Acc??der aux arguments de l''ex??cution dans la m??thode main', '/OCA Exam Objectives/L''ex??cution en Java/Comprendre le processus d''ex??cution/');
INSERT INTO chapter (id, name, parent_path) VALUES(365, 'Acc??s au m??tadonn??es via des vues', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Comprendre les attributs de fichier (metadata)/');
INSERT INTO chapter (id, name, parent_path) VALUES(273, 'Activer les assertions', '/OCP Exam Objectives/Exceptions et Assertions/Tester l''invariance avec les assertions/');
INSERT INTO chapter (id, name, parent_path) VALUES(786, 'Affichage de donn??es et directives', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(383, 'Afficher le contenu d''un fichier avec la m??thode lines', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Naviguer dans les fichiers via des streams/');
INSERT INTO chapter (id, name, parent_path) VALUES(491, 'Ajouter des arguments ?? l''ex??cution', '/OCA Exam Objectives/L''ex??cution en Java/Comprendre le processus d''ex??cution/');
INSERT INTO chapter (id, name, parent_path) VALUES(770, 'Ajouter un fichier - git add', '/Modifier un projet/');
INSERT INTO chapter (id, name, parent_path) VALUES(808, 'Ajouter un tag', '/Modifier un projet/Identifier une version du projet/');
INSERT INTO chapter (id, name, parent_path) VALUES(437, 'Am??lioration des performances', '/OCP Exam Objectives/Concurrence en Java/Les streams parall??les/Ex??cuter des t??ches en parall??le/');
INSERT INTO chapter (id, name, parent_path) VALUES(151, 'Annotation-driven d??veloppement avec Spring', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(773, 'Annuler mes modifications non valid??es', '/Modifier un projet/');
INSERT INTO chapter (id, name, parent_path) VALUES(775, 'Annuler mes modifications valid??es', '/Modifier un projet/');
INSERT INTO chapter (id, name, parent_path) VALUES(322, 'Aper??u et r??capitulatif des arguments ?? conna??tre', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Interactions entre Paths et Files/');
INSERT INTO chapter (id, name, parent_path) VALUES(241, 'API Stream de Java', '/OCP Exam Objectives/');
INSERT INTO chapter (id, name, parent_path) VALUES(568, 'Appeler un constructeur', '/OCA Exam Objectives/Cycle de vie des objets/Les constructeurs/');
INSERT INTO chapter (id, name, parent_path) VALUES(563, 'Appeler une m??thode statique', '/OCA Exam Objectives/Les m??thodes et l''encapsulation/Appliquer le mot cl?? static /');
INSERT INTO chapter (id, name, parent_path) VALUES(552, 'Appliquer des modificateurs d''acc??s', '/OCA Exam Objectives/Les m??thodes et l''encapsulation/');
INSERT INTO chapter (id, name, parent_path) VALUES(551, 'Appliquer le mot cl?? static ', '/OCA Exam Objectives/Les m??thodes et l''encapsulation/');
INSERT INTO chapter (id, name, parent_path) VALUES(554, 'Appliquer les principes de l''encapsulation dans une classe', '/OCA Exam Objectives/Les m??thodes et l''encapsulation/');
INSERT INTO chapter (id, name, parent_path) VALUES(843, 'Apport et nouveaut??s', '/Vue.JS version 3/');
INSERT INTO chapter (id, name, parent_path) VALUES(721, 'ArithmeticException', '/OCA Exam Objectives/Les exceptions/Conna??tre les exceptions communes/');
INSERT INTO chapter (id, name, parent_path) VALUES(722, 'ArrayIndexOutOfBoundsException', '/OCA Exam Objectives/Les exceptions/Conna??tre les exceptions communes/');
INSERT INTO chapter (id, name, parent_path) VALUES(405, 'Arr??ter un thread Executor simple', '/OCP Exam Objectives/Concurrence en Java/Cr??er des threads de travail pour ??xecuter des t??ches de mani??re concurrente/Le ExecutorService/Les threads Executor simples/');
INSERT INTO chapter (id, name, parent_path) VALUES(154, 'Aspect-oriented programming', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(410, 'Attendre les r??sultats des threads', '/OCP Exam Objectives/Concurrence en Java/Cr??er des threads de travail pour ??xecuter des t??ches de mani??re concurrente/Le ExecutorService/');
INSERT INTO chapter (id, name, parent_path) VALUES(412, 'Augmenter la concurence en augmentant le pool de threads', '/OCP Exam Objectives/Concurrence en Java/Cr??er des threads de travail pour ??xecuter des t??ches de mani??re concurrente/Le ExecutorService/');
INSERT INTO chapter (id, name, parent_path) VALUES(853, 'Autres directives (facultatif)', '/Affichage de donn??es et directives/Les directives/');
INSERT INTO chapter (id, name, parent_path) VALUES(501, 'Avantages de Java', '/OCA Exam Objectives/');
INSERT INTO chapter (id, name, parent_path) VALUES(432, 'Bases de donn??es relatives', '/OCP Exam Objectives/Construire des applications de BDD avec JDBC/');
INSERT INTO chapter (id, name, parent_path) VALUES(87, 'BE ABLE TO DETERMINE THE OUTPUT OF CODE "ARRAYLST"', '/OCA EXAM ESSENTIALS/CHAPITRE 3: CORE JAVA APIs/');
INSERT INTO chapter (id, name, parent_path) VALUES(83, 'BE ABLE TO DETERMINE THE OUTPUT OF CODE USING "STRING"', '/OCA EXAM ESSENTIALS/CHAPITRE 3: CORE JAVA APIs/');
INSERT INTO chapter (id, name, parent_path) VALUES(84, 'BE ABLE TO DETERMINE THE OUTPUT OF CODE USING "STRINGBUILDER"', '/OCA EXAM ESSENTIALS/CHAPITRE 3: CORE JAVA APIs/');
INSERT INTO chapter (id, name, parent_path) VALUES(86, 'BE ABLE TO DETERMINE THE OUTPUT OF CODE USING ARRAYS', '/OCA EXAM ESSENTIALS/CHAPITRE 3: CORE JAVA APIs/');
INSERT INTO chapter (id, name, parent_path) VALUES(70, 'BE ABLE TO DETERMINE WHERE VARIABLES GO INTO AND OUT OF SCOPE', '/OCA EXAM ESSENTIALS/');
INSERT INTO chapter (id, name, parent_path) VALUES(90, 'BE ABLE TO IDENTIFY CORRECT AND INCORRECT METHOD DECLARATIONS', '/OCA EXAM ESSENTIALS/CHAPITRE 4 : METHODS AND ENCAPSULATION/');
INSERT INTO chapter (id, name, parent_path) VALUES(69, 'BE ABLE TO IDENTIFY LEGAL AND ILLEGAL DECLARATIONS AND INITIALIZATION', '/OCA EXAM ESSENTIALS/');
INSERT INTO chapter (id, name, parent_path) VALUES(68, 'BE ABLE TO RECOGNIZE A CONTRUCTOR', '/OCA EXAM ESSENTIALS/');
INSERT INTO chapter (id, name, parent_path) VALUES(71, 'BE ABLE TO RECOGNIZE MISPLACED STATEMENTS IN A CLASS', '/OCA EXAM ESSENTIALS/');
INSERT INTO chapter (id, name, parent_path) VALUES(95, 'BE ABLE TO RECOGNIZE WHEN A CLASS IS PROPERLY ENCAPSULATED', '/OCA EXAM ESSENTIALS/CHAPITRE 4 : METHODS AND ENCAPSULATION/');
INSERT INTO chapter (id, name, parent_path) VALUES(76, 'BE ABLE TO RECOGNIZE WHICH OPERATORS ARE ASSOCIATED WITH WHICH DATA TYPES', '/OCA EXAM ESSENTIALS/CHAPITRE 2 : OPERATORS AND STATEMENTS/');
INSERT INTO chapter (id, name, parent_path) VALUES(102, 'BE ABLE TO WRITE CODE THAT CREATES AND EXTENDS ABSTRACT CLASSES', '/OCA EXAM ESSENTIALS/CHAPITRE 5 : CLASS DESIGN/');
INSERT INTO chapter (id, name, parent_path) VALUES(103, 'BE ABLE TO WRITE CODE THAT CREATES, EXTENDS, AND IMPLEMENTS INTERFACES', '/OCA EXAM ESSENTIALS/CHAPITRE 5 : CLASS DESIGN/');
INSERT INTO chapter (id, name, parent_path) VALUES(98, 'BE ABLE TO WRITE CODE THAT EXTENDS OTHER CLASSES', '/OCA EXAM ESSENTIALS/CHAPITRE 5 : CLASS DESIGN/');
INSERT INTO chapter (id, name, parent_path) VALUES(104, 'BE ABLE TO WRITE CODE THAT USES DEFAULT AND STATIC INTERFACE METHODS', '/OCA EXAM ESSENTIALS/CHAPITRE 5 : CLASS DESIGN/');
INSERT INTO chapter (id, name, parent_path) VALUES(75, 'BE ABLE TO WRITE CODE THAT USES JAVA OPERATORS', '/OCA EXAM ESSENTIALS/CHAPITRE 2 : OPERATORS AND STATEMENTS/');
INSERT INTO chapter (id, name, parent_path) VALUES(78, 'BE ABLE TO WRITE CODE THATUSES PARENTHESES TO OVERRIDE OPERATOR PRECEDENCE', '/OCA EXAM ESSENTIALS/CHAPITRE 2 : OPERATORS AND STATEMENTS/');
INSERT INTO chapter (id, name, parent_path) VALUES(66, 'BE ABLE TO WRITECODE USING A MAIN() METHOD', '/OCA EXAM ESSENTIALS/');
INSERT INTO chapter (id, name, parent_path) VALUES(126, 'BENEFITS OF JAVA', '/OCA/CH 1 Java Building Blocks/');
INSERT INTO chapter (id, name, parent_path) VALUES(33, 'Bienvenue dans Java', '/OCP 11/');
INSERT INTO chapter (id, name, parent_path) VALUES(427, 'Blocking queues', '/OCP Exam Objectives/Concurrence en Java/Les collections concurrentes/Les types de collections concurrentes/');
INSERT INTO chapter (id, name, parent_path) VALUES(754, 'Bonnes pratiques', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(376, 'Breadth-First Search', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Naviguer dans les fichiers via des streams/Concepts de navigation/');
INSERT INTO chapter (id, name, parent_path) VALUES(24, 'Buffer and Stream', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(755, 'C''est quoi Git ?', '/Les bases/');
INSERT INTO chapter (id, name, parent_path) VALUES(516, 'Cas 1 : Caract??re dans le nom (d??but/tout le mot)', '/OCA Exam Objectives/R??gles g??n??riques de d??claration et initialisation des variables en Java/Conna??tre les r??gles de nommage/');
INSERT INTO chapter (id, name, parent_path) VALUES(530, 'Cas 1 : Variable locale', '/OCA Exam Objectives/Port??e des variables/Conna??tre la port??e des variables selon leur type/');
INSERT INTO chapter (id, name, parent_path) VALUES(544, 'Cas 2 : Appel d''une m??thode sur une variable de type primitif', '/OCA Exam Objectives/Types r??f??rences/Savoir diff??rencier types r??f??rences et types primitifs/');
INSERT INTO chapter (id, name, parent_path) VALUES(517, 'Cas 2 : Nom r??serv?? par un mot cl??', '/OCA Exam Objectives/R??gles g??n??riques de d??claration et initialisation des variables en Java/Conna??tre les r??gles de nommage/');
INSERT INTO chapter (id, name, parent_path) VALUES(531, 'Cas 2 : Variable d''instance', '/OCA Exam Objectives/Port??e des variables/Conna??tre la port??e des variables selon leur type/');
INSERT INTO chapter (id, name, parent_path) VALUES(546, 'Cas 3 : Diff??rence de nommage dans les types ', '/OCA Exam Objectives/Types r??f??rences/Savoir diff??rencier types r??f??rences et types primitifs/');
INSERT INTO chapter (id, name, parent_path) VALUES(532, 'Cas 3 : Variable de classe', '/OCA Exam Objectives/Port??e des variables/Conna??tre la port??e des variables selon leur type/');
INSERT INTO chapter (id, name, parent_path) VALUES(635, 'Cas des varargs dans les m??thodes', '/OCA Exam Objectives/Les Arrays en Java/Ma??triser les Varargs/');
INSERT INTO chapter (id, name, parent_path) VALUES(58, 'CH 1 Java Building Blocks', '/OCA/');
INSERT INTO chapter (id, name, parent_path) VALUES(59, 'CH 2 Operators and Statements', '/OCA/');
INSERT INTO chapter (id, name, parent_path) VALUES(60, 'CH 3 Core Java APIs', '/OCA/');
INSERT INTO chapter (id, name, parent_path) VALUES(61, 'CH 4 Methods and Encapsulation', '/OCA/');
INSERT INTO chapter (id, name, parent_path) VALUES(62, 'CH 5 Class Design', '/OCA/');
INSERT INTO chapter (id, name, parent_path) VALUES(63, 'CH 6 Exceptions', '/OCA/');
INSERT INTO chapter (id, name, parent_path) VALUES(56, 'CH 9 NIO.2', '/OCP/');
INSERT INTO chapter (id, name, parent_path) VALUES(9, 'CH1 Advanced Class Design', '/OCP/');
INSERT INTO chapter (id, name, parent_path) VALUES(57, 'CH10 JDBC', '/OCP/');
INSERT INTO chapter (id, name, parent_path) VALUES(10, 'CH2 Design Patterns and Principles', '/OCP/');
INSERT INTO chapter (id, name, parent_path) VALUES(11, 'CH3 Generics and Collections', '/OCP/');
INSERT INTO chapter (id, name, parent_path) VALUES(12, 'CH4 Functional Programming', '/OCP/');
INSERT INTO chapter (id, name, parent_path) VALUES(13, 'CH5 Dates, Strings, and Localization', '/OCP/');
INSERT INTO chapter (id, name, parent_path) VALUES(14, 'CH6 Exceptions and Assertions', '/OCP/');
INSERT INTO chapter (id, name, parent_path) VALUES(15, 'CH7 Concurrency', '/OCP/');
INSERT INTO chapter (id, name, parent_path) VALUES(16, 'CH8 IO', '/OCP/');
INSERT INTO chapter (id, name, parent_path) VALUES(802, 'Changer de branche - git checkout', '/Modifier un projet/Travailler avec les branches/');
INSERT INTO chapter (id, name, parent_path) VALUES(34, 'Chapitre 1 : Bienvenue dans Java', '/OCP 11/');
INSERT INTO chapter (id, name, parent_path) VALUES(72, 'CHAPITRE 1 : JAVA BUILDING BLOCKS', '/OCA EXAM ESSENTIALS/');
INSERT INTO chapter (id, name, parent_path) VALUES(43, 'Chapitre 10 : Exceptions', '/OCP 11/');
INSERT INTO chapter (id, name, parent_path) VALUES(44, 'Chapitre 11 : Modules', '/OCP 11/');
INSERT INTO chapter (id, name, parent_path) VALUES(45, 'Chapitre 12 : Fondamentaux de Java', '/OCP 11/');
INSERT INTO chapter (id, name, parent_path) VALUES(46, 'Chapitre 13 : Annotations', '/OCP 11/');
INSERT INTO chapter (id, name, parent_path) VALUES(47, 'Chapitre 14 : G??n??riques et Collections', '/OCP 11/');
INSERT INTO chapter (id, name, parent_path) VALUES(48, 'Chapitre 15 : Programmation fonctionnelle', '/OCP 11/');
INSERT INTO chapter (id, name, parent_path) VALUES(49, 'Chapitre 16 : Exceptions, Assertions et Localization', '/OCP 11/');
INSERT INTO chapter (id, name, parent_path) VALUES(50, 'Chapitre 17 : Applications modulaires', '/OCP 11/');
INSERT INTO chapter (id, name, parent_path) VALUES(51, 'Chapitre 18 : Concurrence', '/OCP 11/');
INSERT INTO chapter (id, name, parent_path) VALUES(52, 'Chapitre 19 : I/O', '/OCP 11/');
INSERT INTO chapter (id, name, parent_path) VALUES(35, 'Chapitre 2 : Les bases de Java', '/OCP 11/');
INSERT INTO chapter (id, name, parent_path) VALUES(74, 'CHAPITRE 2 : OPERATORS AND STATEMENTS', '/OCA EXAM ESSENTIALS/');
INSERT INTO chapter (id, name, parent_path) VALUES(53, 'Chapitre 20 : NIO.2', '/OCP 11/');
INSERT INTO chapter (id, name, parent_path) VALUES(54, 'Chapitre 21 : JDBC', '/OCP 11/');
INSERT INTO chapter (id, name, parent_path) VALUES(55, 'Chapitre 22 : S??curit??', '/OCP 11/');
INSERT INTO chapter (id, name, parent_path) VALUES(36, 'Chapitre 3 : Les op??rateurs', '/OCP 11/');
INSERT INTO chapter (id, name, parent_path) VALUES(82, 'CHAPITRE 3: CORE JAVA APIs', '/OCA EXAM ESSENTIALS/');
INSERT INTO chapter (id, name, parent_path) VALUES(89, 'CHAPITRE 4 : METHODS AND ENCAPSULATION', '/OCA EXAM ESSENTIALS/');
INSERT INTO chapter (id, name, parent_path) VALUES(37, 'Chapitre 4 : Prendre des d??cisions', '/OCP 11/');
INSERT INTO chapter (id, name, parent_path) VALUES(38, 'Chapitre 5 : APIs de base de Java', '/OCP 11/');
INSERT INTO chapter (id, name, parent_path) VALUES(97, 'CHAPITRE 5 : CLASS DESIGN', '/OCA EXAM ESSENTIALS/');
INSERT INTO chapter (id, name, parent_path) VALUES(107, 'CHAPITRE 6 : EXCEPTIONS', '/OCA EXAM ESSENTIALS/');
INSERT INTO chapter (id, name, parent_path) VALUES(39, 'Chapitre 6 : Lambda et interfaces fonctionnelles', '/OCP 11/');
INSERT INTO chapter (id, name, parent_path) VALUES(40, 'Chapitre 7 : M??thodes et encapsulation', '/OCP 11/');
INSERT INTO chapter (id, name, parent_path) VALUES(41, 'Chapitre 8 : Design d''une classe', '/OCP 11/');
INSERT INTO chapter (id, name, parent_path) VALUES(42, 'Chapitre 9 : Design avanc?? d''une classe', '/OCP 11/');
INSERT INTO chapter (id, name, parent_path) VALUES(714, 'Checked exceptions', '/OCA Exam Objectives/Les exceptions/Conna??tre les diff??rents types d''exceptions/');
INSERT INTO chapter (id, name, parent_path) VALUES(258, 'Chercher des donn??es avec les m??thodes allMatch(), anyMatch() et noneMatch()', '/OCP Exam Objectives/API Stream de Java/Utiliser les op??rations terminales/');
INSERT INTO chapter (id, name, parent_path) VALUES(256, 'Chercher des donn??es avec les m??thodes findAny() et findFirst()', '/OCP Exam Objectives/API Stream de Java/Utiliser les op??rations terminales/');
INSERT INTO chapter (id, name, parent_path) VALUES(255, 'Chercher des donn??es avec les m??thodes min() et max()', '/OCP Exam Objectives/API Stream de Java/Utiliser les op??rations terminales/');
INSERT INTO chapter (id, name, parent_path) VALUES(381, 'Chercher un dossier', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Naviguer dans les fichiers via des streams/');
INSERT INTO chapter (id, name, parent_path) VALUES(30, 'Child Process', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(723, 'ClassCastException', '/OCA Exam Objectives/Les exceptions/Conna??tre les exceptions communes/');
INSERT INTO chapter (id, name, parent_path) VALUES(733, 'Classes abstraites et interfaces', '/OCA Exam Objectives/L''h??ritage en Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(190, 'Classes imbriqu??es statiques', '/OCP Exam Objectives/Conception avanc??e de Classes Java/Cr??er des classes imbriqu??es/');
INSERT INTO chapter (id, name, parent_path) VALUES(189, 'Classes internes anonymes', '/OCP Exam Objectives/Conception avanc??e de Classes Java/Cr??er des classes imbriqu??es/');
INSERT INTO chapter (id, name, parent_path) VALUES(187, 'Classes internes locales', '/OCP Exam Objectives/Conception avanc??e de Classes Java/Cr??er des classes imbriqu??es/');
INSERT INTO chapter (id, name, parent_path) VALUES(184, 'Classes internes membres', '/OCP Exam Objectives/Conception avanc??e de Classes Java/Cr??er des classes imbriqu??es/');
INSERT INTO chapter (id, name, parent_path) VALUES(115, 'CLASSES VS. FICHIERS', '/OCA/CH 1 Java Building Blocks/Comprendre la structure d''une classe Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(131, 'CODE FORMATTING ON THE EXAM', '/OCA/CH 1 Java Building Blocks/UNDERSTANDING PACKAGE DECLARATIONS AND IMPORTS/');
INSERT INTO chapter (id, name, parent_path) VALUES(443, 'Combiner un r??sultat avec la m??thode collect()', '/OCP Exam Objectives/Concurrence en Java/Les streams parall??les/Les r??ductions parall??les/');
INSERT INTO chapter (id, name, parent_path) VALUES(442, 'Combiner un r??sultat avec la m??thode reduce()', '/OCP Exam Objectives/Concurrence en Java/Les streams parall??les/Les r??ductions parall??les/');
INSERT INTO chapter (id, name, parent_path) VALUES(852, 'Commencer un projet avec Vue CLI', '/Mettre en ligne une application avec Vue/');
INSERT INTO chapter (id, name, parent_path) VALUES(826, 'Comment cr??er une instance en Vue.JS ?', '/Notion de composant Vue.JS/');
INSERT INTO chapter (id, name, parent_path) VALUES(822, 'Comment ??viter les conflits', '/Bonnes pratiques/');
INSERT INTO chapter (id, name, parent_path) VALUES(756, 'Comment installer Git', '/Les bases/');
INSERT INTO chapter (id, name, parent_path) VALUES(823, 'Comment r??soudre les conflits', '/Bonnes pratiques/');
INSERT INTO chapter (id, name, parent_path) VALUES(114, 'COMMENTS', '/OCA/CH 1 Java Building Blocks/Comprendre la structure d''une classe Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(829, 'Communication entre les composants: ??mission', '/Notion de composant Vue.JS/');
INSERT INTO chapter (id, name, parent_path) VALUES(828, 'Communication entre les composants: props', '/Notion de composant Vue.JS/');
INSERT INTO chapter (id, name, parent_path) VALUES(740, 'Comparaison entre classe abstraite et interface', '/OCA Exam Objectives/L''h??ritage en Java/Classes abstraites et interfaces/');
INSERT INTO chapter (id, name, parent_path) VALUES(717, 'Comparaison entre les exceptions', '/OCA Exam Objectives/Les exceptions/Conna??tre les diff??rents types d''exceptions/');
INSERT INTO chapter (id, name, parent_path) VALUES(657, 'Comparaison String et StringBuilder', '/OCA Exam Objectives/Les API de base de Java/Stocker les donn??es et les manipuler avec des String et des StringBuilder/');
INSERT INTO chapter (id, name, parent_path) VALUES(222, 'Comparaisons entre Listes, Sets, Maps et Queues', '/OCP Exam Objectives/G??n??ricit?? et Collections/Cr??er et utiliser les objets de Collections/');
INSERT INTO chapter (id, name, parent_path) VALUES(487, 'Compiler un programme Java en ligne de commande', '/OCA Exam Objectives/L''ex??cution en Java/Comprendre le processus de compilation/');
INSERT INTO chapter (id, name, parent_path) VALUES(389, 'Comprendre ce qu''est un thread', '/OCP Exam Objectives/Concurrence en Java/Les threads/');
INSERT INTO chapter (id, name, parent_path) VALUES(484, 'Comprendre chaque ??l??ment constitutif de main', '/OCA Exam Objectives/L''ex??cution en Java/Conna??tre la m??thode main et sa syntaxe/');
INSERT INTO chapter (id, name, parent_path) VALUES(619, 'Comprendre l''??gibilit?? d''un objet au garbage collector', '/OCA Exam Objectives/Cycle de vie des objets/Le processus de suppression/');
INSERT INTO chapter (id, name, parent_path) VALUES(649, 'Comprendre l''int??r??t de l''h??ritage des m??thodes', '/OCA Exam Objectives/L''h??ritage en Java/La notion d''h??ritage/');
INSERT INTO chapter (id, name, parent_path) VALUES(597, 'Comprendre l''origine de la robustesse', '/OCA Exam Objectives/Avantages de Java/Conna??tre les sp??cificit??s de Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(599, 'Comprendre l''origine de la s??curit?? ', '/OCA Exam Objectives/Avantages de Java/Conna??tre les sp??cificit??s de Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(598, 'Comprendre l''origine de la simplicit??', '/OCA Exam Objectives/Avantages de Java/Conna??tre les sp??cificit??s de Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(588, 'Comprendre l''usage des noms de paquets', '/OCA Exam Objectives/L''organisation en paquets de Java/Cr??er un nouveau paquet /');
INSERT INTO chapter (id, name, parent_path) VALUES(726, 'Comprendre la diff??rence entre type de r??f??rence et type d''objet', '/OCA Exam Objectives/L''h??ritage en Java/H??ritage et polymorphisme/');
INSERT INTO chapter (id, name, parent_path) VALUES(736, 'Comprendre la notion d''interface', '/OCA Exam Objectives/L''h??ritage en Java/Classes abstraites et interfaces/');
INSERT INTO chapter (id, name, parent_path) VALUES(734, 'Comprendre la notion de classe abstraite', '/OCA Exam Objectives/L''h??ritage en Java/Classes abstraites et interfaces/');
INSERT INTO chapter (id, name, parent_path) VALUES(735, 'Comprendre la notion de classe concr??te', '/OCA Exam Objectives/L''h??ritage en Java/Classes abstraites et interfaces/');
INSERT INTO chapter (id, name, parent_path) VALUES(744, 'Comprendre la notion de polymorphisme', '/OCA Exam Objectives/L''h??ritage en Java/H??ritage et polymorphisme/');
INSERT INTO chapter (id, name, parent_path) VALUES(246, 'Comprendre la pipeline d''un Stream', '/OCP Exam Objectives/API Stream de Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(64, 'Comprendre la structure d''une classe Java', '/OCA/CH 1 Java Building Blocks/');
INSERT INTO chapter (id, name, parent_path) VALUES(621, 'Comprendre la suppression d''un objet', '/OCA Exam Objectives/Cycle de vie des objets/Le processus de suppression/');
INSERT INTO chapter (id, name, parent_path) VALUES(600, 'Comprendre le fonctionnement des blocs d''initialisation', '/OCA Exam Objectives/Cycle de vie des objets/Le processus d''initialisation/');
INSERT INTO chapter (id, name, parent_path) VALUES(601, 'Comprendre le fonctionnement des blocs d''initialisation statiques', '/OCA Exam Objectives/Cycle de vie des objets/Le processus d''initialisation/');
INSERT INTO chapter (id, name, parent_path) VALUES(565, 'Comprendre le fonctionnement du constructeur par d??faut', '/OCA Exam Objectives/Cycle de vie des objets/Les constructeurs/');
INSERT INTO chapter (id, name, parent_path) VALUES(486, 'Comprendre le fonctionnement et l''utilit?? de base de la JVM', '/OCA Exam Objectives/L''ex??cution en Java/Comprendre le processus de compilation/');
INSERT INTO chapter (id, name, parent_path) VALUES(646, 'Comprendre le principe d''h??ritage simple et multiple', '/OCA Exam Objectives/L''h??ritage en Java/La notion d''h??ritage/');
INSERT INTO chapter (id, name, parent_path) VALUES(489, 'Comprendre le processus d''ex??cution', '/OCA Exam Objectives/L''ex??cution en Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(606, 'Comprendre le processus d''initialisation d''un objet', '/OCA Exam Objectives/Cycle de vie des objets/Le processus d''initialisation/');
INSERT INTO chapter (id, name, parent_path) VALUES(485, 'Comprendre le processus de compilation', '/OCA Exam Objectives/L''ex??cution en Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(302, 'Comprendre le syst??me de fichier', '/OCP Exam Objectives/Les fondamentaux de Java IO/');
INSERT INTO chapter (id, name, parent_path) VALUES(350, 'Comprendre les attributs de fichier (metadata)', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/');
INSERT INTO chapter (id, name, parent_path) VALUES(713, 'Comprendre les cas o?? une m??thode est virtuelle', '/OCA Exam Objectives/L''h??ritage en Java/H??ritage et polymorphisme/');
INSERT INTO chapter (id, name, parent_path) VALUES(333, 'Comprendre les chemins symboliques', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Interactions entre Paths et Files/L''object Path/');
INSERT INTO chapter (id, name, parent_path) VALUES(609, 'Comprendre les diff??rences entre post unary et pre unary', '/OCA Exam Objectives/Utiliser les op??rateurs/Diff??rencier les diff??rents op??rateurs/');
INSERT INTO chapter (id, name, parent_path) VALUES(638, 'Comprendre les expressions conditionnelles', '/OCA Exam Objectives/Les structures de contr??le/');
INSERT INTO chapter (id, name, parent_path) VALUES(320, 'Comprendre les Stream IO', '/OCP Exam Objectives/Les fondamentaux de Java IO/Lire et ??crire des donn??es/');
INSERT INTO chapter (id, name, parent_path) VALUES(367, 'Comprendre les vues', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Comprendre les attributs de fichier (metadata)/Acc??s au m??tadonn??es via des vues/');
INSERT INTO chapter (id, name, parent_path) VALUES(175, 'Conception avanc??e de Classes Java', '/OCP Exam Objectives/');
INSERT INTO chapter (id, name, parent_path) VALUES(172, 'Conception de Classes Java', '/OCP Exam Objectives/');
INSERT INTO chapter (id, name, parent_path) VALUES(372, 'Concepts de navigation', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Naviguer dans les fichiers via des streams/');
INSERT INTO chapter (id, name, parent_path) VALUES(308, 'Conceptualiser le syst??me de fichier avec l''objet File', '/OCP Exam Objectives/Les fondamentaux de Java IO/');
INSERT INTO chapter (id, name, parent_path) VALUES(386, 'Concurrence en Java', '/OCP Exam Objectives/');
INSERT INTO chapter (id, name, parent_path) VALUES(824, 'Configuration', '/Les bases/');
INSERT INTO chapter (id, name, parent_path) VALUES(148, 'Configuration des beans', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(593, 'Conna??tre et comprendre l''encapsulation', '/OCA Exam Objectives/Avantages de Java/Conna??tre les caract??ristiques de la POO/');
INSERT INTO chapter (id, name, parent_path) VALUES(595, 'Conna??tre et comprendre l''organisation en classe', '/OCA Exam Objectives/Avantages de Java/Conna??tre les caract??ristiques de la POO/');
INSERT INTO chapter (id, name, parent_path) VALUES(669, 'Conna??tre et ma??triser les m??thodes des dates', '/OCA Exam Objectives/Les API de base de Java/Savoir modifier une date/');
INSERT INTO chapter (id, name, parent_path) VALUES(660, 'Conna??tre la LocalDate', '/OCA Exam Objectives/Les API de base de Java/Conna??tre les objets du package java.time/');
INSERT INTO chapter (id, name, parent_path) VALUES(662, 'Conna??tre la LocalDateTime', '/OCA Exam Objectives/Les API de base de Java/Conna??tre les objets du package java.time/');
INSERT INTO chapter (id, name, parent_path) VALUES(664, 'Conna??tre la LocalTime', '/OCA Exam Objectives/Les API de base de Java/Conna??tre les objets du package java.time/');
INSERT INTO chapter (id, name, parent_path) VALUES(482, 'Conna??tre la m??thode main et sa syntaxe', '/OCA Exam Objectives/L''ex??cution en Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(611, 'Conna??tre la notion de short circuit', '/OCA Exam Objectives/Utiliser les op??rateurs/Diff??rencier les diff??rents op??rateurs/');
INSERT INTO chapter (id, name, parent_path) VALUES(529, 'Conna??tre la port??e des variables selon leur type', '/OCA Exam Objectives/Port??e des variables/');
INSERT INTO chapter (id, name, parent_path) VALUES(614, 'conna??tre la priorit?? des op??rateurs', '/OCA Exam Objectives/Utiliser les op??rateurs/Ma??triser l''ordre des op??rations/');
INSERT INTO chapter (id, name, parent_path) VALUES(582, 'Connaitre la syntaxe d''un import', '/OCA Exam Objectives/L''organisation en paquets de Java/Importer des paquets externes/');
INSERT INTO chapter (id, name, parent_path) VALUES(483, 'Conna??tre la syntaxe de la m??thode main', '/OCA Exam Objectives/L''ex??cution en Java/Conna??tre la m??thode main et sa syntaxe/');
INSERT INTO chapter (id, name, parent_path) VALUES(745, 'Conna??tre la syntaxe et la r??alisation de l''h??ritage d''une classe', '/OCA Exam Objectives/L''h??ritage en Java/La mise en place de l''h??ritage en Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(666, 'Conna??tre la syntaxe et la r??alisation de l''h??ritage d''une m??thode', '/OCA Exam Objectives/L''h??ritage en Java/La mise en place de l''h??ritage en Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(671, 'Conna??tre la syntaxe et la r??alisation de l''h??ritage d''une variable', '/OCA Exam Objectives/L''h??ritage en Java/La mise en place de l''h??ritage en Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(652, 'Conna??tre le fonctionnement du StringPool', '/OCA Exam Objectives/Les API de base de Java/Stocker les donn??es et les manipuler avec des String et des StringBuilder/');
INSERT INTO chapter (id, name, parent_path) VALUES(596, 'Conna??tre le principe d''ind??pendance de plateforme', '/OCA Exam Objectives/Avantages de Java/Conna??tre les sp??cificit??s de Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(539, 'Conna??tre le principe de r??f??rencement', '/OCA Exam Objectives/Types r??f??rences/Ma??triser les types r??f??ren??ant un objet/');
INSERT INTO chapter (id, name, parent_path) VALUES(692, 'Conna??tre les am??liorations du compilateur pour le constructeur', '/OCA Exam Objectives/L''h??ritage en Java/H??ritage et polymorphisme/');
INSERT INTO chapter (id, name, parent_path) VALUES(708, 'Conna??tre les avantages de la gestion d''exception', '/OCA Exam Objectives/Les exceptions/');
INSERT INTO chapter (id, name, parent_path) VALUES(508, 'Conna??tre les bonnes pratiques de nommage', '/OCA Exam Objectives/R??gles g??n??riques de d??claration et initialisation des variables en Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(591, 'Conna??tre les caract??ristiques de la POO', '/OCA Exam Objectives/Avantages de Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(651, 'Conna??tre les caract??ristiques de String', '/OCA Exam Objectives/Les API de base de Java/Stocker les donn??es et les manipuler avec des String et des StringBuilder/');
INSERT INTO chapter (id, name, parent_path) VALUES(550, 'Conna??tre les char et les bool??ens', '/OCA Exam Objectives/Topologie des variables/Les types primitifs/');
INSERT INTO chapter (id, name, parent_path) VALUES(576, 'Conna??tre les cons??quence d''un passage par valeur', '/OCA Exam Objectives/Les m??thodes et l''encapsulation/Ma??triser le passage de param??tre par valeur/');
INSERT INTO chapter (id, name, parent_path) VALUES(685, 'Conna??tre les diff??rences avec les Arrays', '/OCA Exam Objectives/Les API de base de Java/Ma??triser les ArrayLists/');
INSERT INTO chapter (id, name, parent_path) VALUES(553, 'Conna??tre les diff??rences entre chaque type primitifs', '/OCA Exam Objectives/Topologie des variables/Les types primitifs/');
INSERT INTO chapter (id, name, parent_path) VALUES(665, 'Conna??tre les diff??rences entre les 3 classes', '/OCA Exam Objectives/Les API de base de Java/Conna??tre les objets du package java.time/');
INSERT INTO chapter (id, name, parent_path) VALUES(679, 'Conna??tre les diff??rences entre les boucles', '/OCA Exam Objectives/Les structures de contr??le/Utiliser les boucles/');
INSERT INTO chapter (id, name, parent_path) VALUES(573, 'Conna??tre les diff??rences entre les diff??rents modificateurs d''acc??s', '/OCA Exam Objectives/Les m??thodes et l''encapsulation/Appliquer des modificateurs d''acc??s/');
INSERT INTO chapter (id, name, parent_path) VALUES(705, 'Conna??tre les diff??rents types d''exceptions', '/OCA Exam Objectives/Les exceptions/');
INSERT INTO chapter (id, name, parent_path) VALUES(607, 'Conna??tre les diff??rents types d''op??rateurs', '/OCA Exam Objectives/Utiliser les op??rateurs/Diff??rencier les diff??rents op??rateurs/');
INSERT INTO chapter (id, name, parent_path) VALUES(707, 'Conna??tre les effets de try-catch et l''impact sur le flux du programme', '/OCA Exam Objectives/Les exceptions/');
INSERT INTO chapter (id, name, parent_path) VALUES(711, 'Conna??tre les exceptions communes', '/OCA Exam Objectives/Les exceptions/');
INSERT INTO chapter (id, name, parent_path) VALUES(629, 'Conna??tre les fa??ons de d??clarer un tableau ?? multiples dimensions', '/OCA Exam Objectives/Les Arrays en Java/Savoir cr??er un tableau ?? multiples dimensions/');
INSERT INTO chapter (id, name, parent_path) VALUES(626, 'Conna??tre les fa??ons de d??clarer un tableau ?? une dimension', '/OCA Exam Objectives/Les Arrays en Java/Savoir cr??er un tableau ?? une dimension/');
INSERT INTO chapter (id, name, parent_path) VALUES(543, 'Conna??tre les initialisations par d??faut', '/OCA Exam Objectives/Types r??f??rences/Savoir diff??rencier types r??f??rences et types primitifs/');
INSERT INTO chapter (id, name, parent_path) VALUES(674, 'Conna??tre les m??thode de formatage de date', '/OCA Exam Objectives/Les API de base de Java/Savoir formater une date/');
INSERT INTO chapter (id, name, parent_path) VALUES(680, 'Conna??tre les m??thodes ??l??mentaires des arraylist', '/OCA Exam Objectives/Les API de base de Java/Ma??triser les ArrayLists/');
INSERT INTO chapter (id, name, parent_path) VALUES(656, 'Conna??tre les m??thodes sur les StringBuilder', '/OCA Exam Objectives/Les API de base de Java/Stocker les donn??es et les manipuler avec des String et des StringBuilder/');
INSERT INTO chapter (id, name, parent_path) VALUES(653, 'Conna??tre les m??thodes sur les Strings', '/OCA Exam Objectives/Les API de base de Java/Stocker les donn??es et les manipuler avec des String et des StringBuilder/');
INSERT INTO chapter (id, name, parent_path) VALUES(639, 'Conna??tre les objets du package java.time', '/OCA Exam Objectives/Les API de base de Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(608, 'Conna??tre les op??rateurs arithm??tiques', '/OCA Exam Objectives/Utiliser les op??rateurs/Diff??rencier les diff??rents op??rateurs/');
INSERT INTO chapter (id, name, parent_path) VALUES(612, 'Conna??tre les op??rateurs d''assignation', '/OCA Exam Objectives/Utiliser les op??rateurs/Diff??rencier les diff??rents op??rateurs/');
INSERT INTO chapter (id, name, parent_path) VALUES(613, 'Conna??tre les op??rateurs de relation', '/OCA Exam Objectives/Utiliser les op??rateurs/Diff??rencier les diff??rents op??rateurs/');
INSERT INTO chapter (id, name, parent_path) VALUES(610, 'Conna??tre les op??rateurs logiques', '/OCA Exam Objectives/Utiliser les op??rateurs/Diff??rencier les diff??rents op??rateurs/');
INSERT INTO chapter (id, name, parent_path) VALUES(507, 'Conna??tre les r??gles de nommage', '/OCA Exam Objectives/R??gles g??n??riques de d??claration et initialisation des variables en Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(592, 'Conna??tre les sp??cificit??s de Java', '/OCA Exam Objectives/Avantages de Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(703, 'Conna??tre les structures autorisant chaque structure de contr??le avanc??e', '/OCA Exam Objectives/Les structures de contr??le/Utiliser les structures de contr??les avanc??es/');
INSERT INTO chapter (id, name, parent_path) VALUES(686, 'Conna??tre les types de donn??es support??s', '/OCA Exam Objectives/Les structures de contr??le/Utiliser une structure switch/');
INSERT INTO chapter (id, name, parent_path) VALUES(548, 'Conna??tre les types d??cimaux', '/OCA Exam Objectives/Topologie des variables/Les types primitifs/');
INSERT INTO chapter (id, name, parent_path) VALUES(545, 'Conna??tre les types entiers', '/OCA Exam Objectives/Topologie des variables/Les types primitifs/');
INSERT INTO chapter (id, name, parent_path) VALUES(459, 'Connexion', '/OCP Exam Objectives/Construire des applications de BDD avec JDBC/Les interfaces JDBC, leur utilit??s et relations/');
INSERT INTO chapter (id, name, parent_path) VALUES(132, 'CONSTRUCTORS', '/OCA/CH 1 Java Building Blocks/CREATING OBJECTS/');
INSERT INTO chapter (id, name, parent_path) VALUES(428, 'Construire des applications de BDD avec JDBC', '/OCP Exam Objectives/');
INSERT INTO chapter (id, name, parent_path) VALUES(300, 'Construire et charger un Resources Bundle pour chaque param??tre r??gional dans une application', '/OCP Exam Objectives/Localisation/');
INSERT INTO chapter (id, name, parent_path) VALUES(219, 'Consumer et BiConsumer', '/OCP Exam Objectives/Interfaces fonctionnelles int??gr??es ?? Java/Utiliser les interfaces int??gr??es dans le package java.util.fonction/');
INSERT INTO chapter (id, name, parent_path) VALUES(25, 'Control Flow', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(130, 'CREATING A NEW PACKAGE', '/OCA/CH 1 Java Building Blocks/UNDERSTANDING PACKAGE DECLARATIONS AND IMPORTS/');
INSERT INTO chapter (id, name, parent_path) VALUES(119, 'CREATING OBJECTS', '/OCA/CH 1 Java Building Blocks/');
INSERT INTO chapter (id, name, parent_path) VALUES(118, 'CREATING OBJECTS', '/OCA/CH 1 Java Building Blocks/Comprendre la structure d''une classe Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(182, 'Cr??er des classes imbriqu??es', '/OCP Exam Objectives/Conception avanc??e de Classes Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(251, 'Cr??er des exceptions personnalis??es', '/OCP Exam Objectives/Exceptions et Assertions/');
INSERT INTO chapter (id, name, parent_path) VALUES(259, 'Cr??er des ressources ?? fermeture automatique', '/OCP Exam Objectives/Exceptions et Assertions/Utiliser l''instruction try-with-resources/');
INSERT INTO chapter (id, name, parent_path) VALUES(287, 'Cr??er des streams manipulant des types primitifs', '/OCP Exam Objectives/API Stream de Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(434, 'Cr??er des streams parall??les', '/OCP Exam Objectives/Concurrence en Java/Les streams parall??les/');
INSERT INTO chapter (id, name, parent_path) VALUES(394, 'Cr??er des threads de travail pour ??xecuter des t??ches de mani??re concurrente', '/OCP Exam Objectives/Concurrence en Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(710, 'Cr??er et appeler une m??thode qui jette une exception', '/OCA Exam Objectives/Les exceptions/');
INSERT INTO chapter (id, name, parent_path) VALUES(301, 'Cr??er et lire un fichier Properties', '/OCP Exam Objectives/Localisation/Construire et charger un Resources Bundle pour chaque param??tre r??gional dans une application/');
INSERT INTO chapter (id, name, parent_path) VALUES(670, 'Cr??er et utiliser des boucles do while', '/OCA Exam Objectives/Les structures de contr??le/Utiliser les boucles/');
INSERT INTO chapter (id, name, parent_path) VALUES(676, 'Cr??er et utiliser des boucles for classique', '/OCA Exam Objectives/Les structures de contr??le/Utiliser les boucles/');
INSERT INTO chapter (id, name, parent_path) VALUES(673, 'Cr??er et utiliser des boucles for each', '/OCA Exam Objectives/Les structures de contr??le/Utiliser les boucles/');
INSERT INTO chapter (id, name, parent_path) VALUES(693, 'Cr??er et utiliser des boucles imbriqu??es', '/OCA Exam Objectives/Les structures de contr??le/Utiliser les structures de contr??les avanc??es/');
INSERT INTO chapter (id, name, parent_path) VALUES(198, 'Cr??er et utiliser des interfaces fonctionnelles', '/OCP Exam Objectives/Conception avanc??e de Classes Java/Cr??er et utiliser des interfaces fonctionnelles avec des Lambda/');
INSERT INTO chapter (id, name, parent_path) VALUES(197, 'Cr??er et utiliser des interfaces fonctionnelles avec des Lambda', '/OCP Exam Objectives/Conception avanc??e de Classes Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(298, 'Cr??er et utiliser l''objet Local', '/OCP Exam Objectives/Localisation/');
INSERT INTO chapter (id, name, parent_path) VALUES(663, 'Cr??er et utiliser les boucles while', '/OCA Exam Objectives/Les structures de contr??le/Utiliser les boucles/');
INSERT INTO chapter (id, name, parent_path) VALUES(206, 'Cr??er et utiliser les objets de Collections', '/OCP Exam Objectives/G??n??ricit?? et Collections/');
INSERT INTO chapter (id, name, parent_path) VALUES(202, 'Cr??er et utiliser une classe g??n??rique', '/OCP Exam Objectives/G??n??ricit?? et Collections/');
INSERT INTO chapter (id, name, parent_path) VALUES(549, 'Cr??er les m??thodes', '/OCA Exam Objectives/Les m??thodes et l''encapsulation/');
INSERT INTO chapter (id, name, parent_path) VALUES(334, 'Cr??er un chemin relatif entre deux fichiers avec la m??thode relativize()', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Interactions entre Paths et Files/L''object Path/');
INSERT INTO chapter (id, name, parent_path) VALUES(332, 'Cr??er un nouveau chemin avec subpath()', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Interactions entre Paths et Files/L''object Path/');
INSERT INTO chapter (id, name, parent_path) VALUES(580, 'Cr??er un nouveau paquet ', '/OCA Exam Objectives/L''organisation en paquets de Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(261, 'Cr??er un objet avec la m??thode reduce()', '/OCP Exam Objectives/API Stream de Java/Utiliser les op??rations terminales/');
INSERT INTO chapter (id, name, parent_path) VALUES(310, 'Cr??er un objet File', '/OCP Exam Objectives/Les fondamentaux de Java IO/Conceptualiser le syst??me de fichier avec l''objet File/');
INSERT INTO chapter (id, name, parent_path) VALUES(317, 'Cr??er un objet Path', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/La classe Path/');
INSERT INTO chapter (id, name, parent_path) VALUES(342, 'Cr??er un ou plusieurs dossier avec les m??thodes createDirectory() et createDirectories()', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Interactions entre Paths et Files/L''object Path/');
INSERT INTO chapter (id, name, parent_path) VALUES(750, 'Cr??er un projet', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(760, 'Cr??er un projet ?? partir de rien - git init', '/Cr??er un projet/');
INSERT INTO chapter (id, name, parent_path) VALUES(654, 'Cr??er un StringBuilder', '/OCA Exam Objectives/Les API de base de Java/Stocker les donn??es et les manipuler avec des String et des StringBuilder/');
INSERT INTO chapter (id, name, parent_path) VALUES(399, 'Cr??er un thread', '/OCP Exam Objectives/Concurrence en Java/Cr??er des threads de travail pour ??xecuter des t??ches de mani??re concurrente/');
INSERT INTO chapter (id, name, parent_path) VALUES(274, 'Cr??er une assertion', '/OCP Exam Objectives/Exceptions et Assertions/Tester l''invariance avec les assertions/');
INSERT INTO chapter (id, name, parent_path) VALUES(797, 'Cr??er une branche - git branch', '/Modifier un projet/Travailler avec les branches/');
INSERT INTO chapter (id, name, parent_path) VALUES(303, 'Cr??er une classe de configuration', '/OCP Exam Objectives/Localisation/Construire et charger un Resources Bundle pour chaque param??tre r??gional dans une application/');
INSERT INTO chapter (id, name, parent_path) VALUES(262, 'Cr??er une collection ?? partir d''un stream avec la m??thode collect()', '/OCP Exam Objectives/API Stream de Java/Utiliser les op??rations terminales/');
INSERT INTO chapter (id, name, parent_path) VALUES(743, 'Cr??er une constante avec le mot-cl?? final', '/OCA Exam Objectives/Topologie des variables/Les diff??rentes sortes de variables dans une classe/');
INSERT INTO chapter (id, name, parent_path) VALUES(286, 'Cr??er une date', '/OCP Exam Objectives/Utiliser l''API Date-Time de Java SE 8/');
INSERT INTO chapter (id, name, parent_path) VALUES(741, 'Cr??er une date avec la m??thode of()', '/OCA Exam Objectives/Les API de base de Java/Savoir cr??er un objet date/');
INSERT INTO chapter (id, name, parent_path) VALUES(150, 'Customisation des beans et des d??finitions', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(827, 'Cycle de vie d''un composant et hooks', '/Notion de composant Vue.JS/');
INSERT INTO chapter (id, name, parent_path) VALUES(499, 'Cycle de vie des objets', '/OCA Exam Objectives/');
INSERT INTO chapter (id, name, parent_path) VALUES(463, 'DataSource', '/OCP Exam Objectives/Construire des applications de BDD avec JDBC/Les interfaces JDBC, leur utilit??s et relations/Connexion/R??cup??rer un connexion ?? la base de donn??es/');
INSERT INTO chapter (id, name, parent_path) VALUES(453, 'DeadLock', '/OCP Exam Objectives/Concurrence en Java/Les probl??mes de concurrence potentiels/');
INSERT INTO chapter (id, name, parent_path) VALUES(850, 'D??claration du routage d''une application', '/Single Page : Vue Router/');
INSERT INTO chapter (id, name, parent_path) VALUES(111, 'DECLARE METHODS THAT DECLARE EXCEPTIONS', '/OCA EXAM ESSENTIALS/CHAPITRE 6 : EXCEPTIONS/');
INSERT INTO chapter (id, name, parent_path) VALUES(566, 'D??clarer une constante de classe (?? supprimer)', '/OCA Exam Objectives/Les m??thodes et l''encapsulation/Appliquer le mot cl?? static /');
INSERT INTO chapter (id, name, parent_path) VALUES(195, 'D??clarer, impl??menter et ??tendre des interfaces et utilisation de l''annotation @Override', '/OCP Exam Objectives/Conception avanc??e de Classes Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(121, 'DECLARING AND INITIALIZING VARIABLES', '/OCA/CH 1 Java Building Blocks/');
INSERT INTO chapter (id, name, parent_path) VALUES(140, 'DECLARING MULTIPLE VARIABLES', '/OCA/CH 1 Java Building Blocks/DECLARING AND INITIALIZING VARIABLES/');
INSERT INTO chapter (id, name, parent_path) VALUES(848, 'D??clenchement de mutation par les actions', '/Introduction ?? VueX/Les composants de VueX/');
INSERT INTO chapter (id, name, parent_path) VALUES(345, 'D??placer un ficher avec la m??thode move()', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Interactions entre Paths et Files/L''object Path/');
INSERT INTO chapter (id, name, parent_path) VALUES(851, 'D??ploiement d''une application en Vue.JS', '/Mettre en ligne une application avec Vue/');
INSERT INTO chapter (id, name, parent_path) VALUES(375, 'Depth-First Search', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Naviguer dans les fichiers via des streams/Concepts de navigation/');
INSERT INTO chapter (id, name, parent_path) VALUES(289, 'Depuis un autre stream avec les m??thodes de mapping primitives', '/OCP Exam Objectives/API Stream de Java/Cr??er des streams manipulant des types primitifs/');
INSERT INTO chapter (id, name, parent_path) VALUES(125, 'DESTROYING OBJECTS', '/OCA/CH 1 Java Building Blocks/');
INSERT INTO chapter (id, name, parent_path) VALUES(304, 'D??terminer la ressource utilis??e gr??ce ?? l''objet Local', '/OCP Exam Objectives/Localisation/');
INSERT INTO chapter (id, name, parent_path) VALUES(727, 'D??terminer quand le casting est n??cessaire', '/OCA Exam Objectives/L''h??ritage en Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(243, 'D??velopper avec la classe Optionnal', '/OCP Exam Objectives/API Stream de Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(242, 'D??velopper en utilisant les versions primitives des interfaces fonctionnelles', '/OCP Exam Objectives/Interfaces fonctionnelles int??gr??es ?? Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(29, 'Diagnostic', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(636, 'Diff??rence avec un Array', '/OCA Exam Objectives/Les Arrays en Java/Ma??triser les Varargs/');
INSERT INTO chapter (id, name, parent_path) VALUES(232, 'Diff??rence entre Comparable et Comparator', '/OCP Exam Objectives/G??n??ricit?? et Collections/Utiliser les interfaces de comparaison/');
INSERT INTO chapter (id, name, parent_path) VALUES(192, 'Diff??rencier les classes imbriqu??es', '/OCP Exam Objectives/Conception avanc??e de Classes Java/Cr??er des classes imbriqu??es/');
INSERT INTO chapter (id, name, parent_path) VALUES(602, 'Diff??rencier les diff??rents op??rateurs', '/OCA Exam Objectives/Utiliser les op??rateurs/');
INSERT INTO chapter (id, name, parent_path) VALUES(108, 'DIFFERENTIATE BETWEEN CHECKED AND UNCHECKED EXCEPTIONS', '/OCA EXAM ESSENTIALS/CHAPITRE 6 : EXCEPTIONS/');
INSERT INTO chapter (id, name, parent_path) VALUES(120, 'DISTINGUISHING BETWEEN OBJECT REFERENCES AND PRIMITIVES', '/OCA/CH 1 Java Building Blocks/');
INSERT INTO chapter (id, name, parent_path) VALUES(764, 'Dossier de travail', '/Les zones de travail/');
INSERT INTO chapter (id, name, parent_path) VALUES(462, 'Driver', '/OCP Exam Objectives/Construire des applications de BDD avec JDBC/Les interfaces JDBC, leur utilit??s et relations/Connexion/R??cup??rer un connexion ?? la base de donn??es/');
INSERT INTO chapter (id, name, parent_path) VALUES(344, 'Dupliquer un fichier avec les m??thodes copy(path, path), copy(in,path) et copy(path, out)', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Interactions entre Paths et Files/L''object Path/');
INSERT INTO chapter (id, name, parent_path) VALUES(647, 'Ecrire des expressions lambda simples', '/OCA Exam Objectives/Les API de base de Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(373, 'Ecrire et lire les donn??es entre la m??moire et le disque avec la S??rialisation', '/OCP Exam Objectives/Les fondamentaux de Java IO/Lire et ??crire des donn??es/');
INSERT INTO chapter (id, name, parent_path) VALUES(562, '??crire un constructeur valide', '/OCA Exam Objectives/Cycle de vie des objets/Les constructeurs/');
INSERT INTO chapter (id, name, parent_path) VALUES(348, 'Ecrire un fichier en cr??ant un object bufferedWritter() a partir d''un object path', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Interactions entre Paths et Files/L''object Path/');
INSERT INTO chapter (id, name, parent_path) VALUES(716, 'Error', '/OCA Exam Objectives/Les exceptions/Conna??tre les diff??rents types d''exceptions/');
INSERT INTO chapter (id, name, parent_path) VALUES(94, 'EVALUATE CODE INVOLVING CONSTRUCTORS', '/OCA EXAM ESSENTIALS/CHAPITRE 4 : METHODS AND ENCAPSULATION/');
INSERT INTO chapter (id, name, parent_path) VALUES(380, 'Eviter les chemins infinis', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Naviguer dans les fichiers via des streams/Naviguer avec la m??thode walk()/');
INSERT INTO chapter (id, name, parent_path) VALUES(439, 'Eviter les op??rations stateful', '/OCP Exam Objectives/Concurrence en Java/Les streams parall??les/Ex??cuter des t??ches en parall??le/');
INSERT INTO chapter (id, name, parent_path) VALUES(249, 'Exceptions et Assertions', '/OCP Exam Objectives/');
INSERT INTO chapter (id, name, parent_path) VALUES(408, 'Ex??cuter de nouvelles t??ches/Threads', '/OCP Exam Objectives/Concurrence en Java/Cr??er des threads de travail pour ??xecuter des t??ches de mani??re concurrente/Le ExecutorService/');
INSERT INTO chapter (id, name, parent_path) VALUES(435, 'Ex??cuter des t??ches en parall??le', '/OCP Exam Objectives/Concurrence en Java/Les streams parall??les/');
INSERT INTO chapter (id, name, parent_path) VALUES(490, 'Ex??cuter un programme Java en ligne de commande', '/OCA Exam Objectives/L''ex??cution en Java/Comprendre le processus d''ex??cution/');
INSERT INTO chapter (id, name, parent_path) VALUES(488, 'Ex??cuter un programme Java en ligne de commande [mauvais endroit, ?? supprimer]', '/OCA Exam Objectives/L''ex??cution en Java/Comprendre le processus de compilation/');
INSERT INTO chapter (id, name, parent_path) VALUES(466, 'Executer un statement', '/OCP Exam Objectives/Construire des applications de BDD avec JDBC/Les interfaces JDBC, leur utilit??s et relations/Statement/');
INSERT INTO chapter (id, name, parent_path) VALUES(406, 'Ex??cuter une nouvelle t??che/Thread', '/OCP Exam Objectives/Concurrence en Java/Cr??er des threads de travail pour ??xecuter des t??ches de mani??re concurrente/Le ExecutorService/');
INSERT INTO chapter (id, name, parent_path) VALUES(441, 'Executer une t??che bas??e sur un ordre pr??cis', '/OCP Exam Objectives/Concurrence en Java/Les streams parall??les/Les r??ductions parall??les/');
INSERT INTO chapter (id, name, parent_path) VALUES(659, 'expression ternaire', '/OCA Exam Objectives/Les structures de contr??le/Comprendre les expressions conditionnelles/');
INSERT INTO chapter (id, name, parent_path) VALUES(525, 'Faire et reconna??tre la Javadoc', '/OCA Exam Objectives/Structure d''une classe Java/Ma??triser les commentaires/');
INSERT INTO chapter (id, name, parent_path) VALUES(21, 'Features ES11', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(18, 'Features ES6', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(19, 'Features ES7 & ES8', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(20, 'Features ES9 - ES10', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(472, 'Fermer toutes les ressources', '/OCP Exam Objectives/Construire des applications de BDD avec JDBC/Les interfaces JDBC, leur utilit??s et relations/');
INSERT INTO chapter (id, name, parent_path) VALUES(330, 'Fermer un Stream avec la m??thode close()', '/OCP Exam Objectives/Les fondamentaux de Java IO/Lire et ??crire des donn??es/Manipuler un Stream/');
INSERT INTO chapter (id, name, parent_path) VALUES(113, 'FIELDS AND METHODS', '/OCA/CH 1 Java Building Blocks/Comprendre la structure d''une classe Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(26, 'File System', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(276, 'Filtrer avec la m??thode filter()', '/OCP Exam Objectives/API Stream de Java/Utiliser les op??rations interm??diaires/');
INSERT INTO chapter (id, name, parent_path) VALUES(719, 'finally', '/OCA Exam Objectives/Les exceptions/Conna??tre les effets de try-catch et l''impact sur le flux du programme/');
INSERT INTO chapter (id, name, parent_path) VALUES(384, 'Formatter des repr??sentations d''objets avec les classes PrintStream et PrintWriter', '/OCP Exam Objectives/Les fondamentaux de Java IO/Lire et ??crire des donn??es/');
INSERT INTO chapter (id, name, parent_path) VALUES(305, 'Formatter en fonction de la Locale', '/OCP Exam Objectives/Localisation/');
INSERT INTO chapter (id, name, parent_path) VALUES(407, 'Formatter l''affichage avec les m??thodes format() et printf()', '/OCP Exam Objectives/Les fondamentaux de Java IO/Lire et ??crire des donn??es depuis la console/');
INSERT INTO chapter (id, name, parent_path) VALUES(309, 'Formatter les Dates et Times', '/OCP Exam Objectives/Localisation/Formatter en fonction de la Locale/');
INSERT INTO chapter (id, name, parent_path) VALUES(306, 'Formatter les nombres', '/OCP Exam Objectives/Localisation/Formatter en fonction de la Locale/');
INSERT INTO chapter (id, name, parent_path) VALUES(224, 'Function et BiFunction', '/OCP Exam Objectives/Interfaces fonctionnelles int??gr??es ?? Java/Utiliser les interfaces int??gr??es dans le package java.util.fonction/');
INSERT INTO chapter (id, name, parent_path) VALUES(803, 'Fusionner deux branches', '/Modifier un projet/Travailler avec les branches/');
INSERT INTO chapter (id, name, parent_path) VALUES(336, 'Fusionner deux chemins avec la m??thode resolve()', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Interactions entre Paths et Files/L''object Path/');
INSERT INTO chapter (id, name, parent_path) VALUES(144, 'GARBAGE COLLECTION', '/OCA/CH 1 Java Building Blocks/DESTROYING OBJECTS/');
INSERT INTO chapter (id, name, parent_path) VALUES(200, 'G??n??ricit?? et Collections', '/OCP Exam Objectives/');
INSERT INTO chapter (id, name, parent_path) VALUES(364, 'G??rer le propri??taire du fichier avec les m??thodes getOwner() et setOwner()', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Comprendre les attributs de fichier (metadata)/');
INSERT INTO chapter (id, name, parent_path) VALUES(521, 'G??rer les classes dans un fichier', '/OCA Exam Objectives/Structure d''une classe Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(587, 'G??rer les conflits de nom multi import', '/OCA Exam Objectives/L''organisation en paquets de Java/Importer des paquets externes/');
INSERT INTO chapter (id, name, parent_path) VALUES(473, 'G??rer les exceptions', '/OCP Exam Objectives/Construire des applications de BDD avec JDBC/Les interfaces JDBC, leur utilit??s et relations/');
INSERT INTO chapter (id, name, parent_path) VALUES(363, 'G??rer les modifications de fichier avec les m??thodes getLastModifierTime() et setLastModifiedTime()', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Comprendre les attributs de fichier (metadata)/');
INSERT INTO chapter (id, name, parent_path) VALUES(17, 'Gestion de l''asynchrone', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(444, 'Gestion des processus simultan??s', '/OCP Exam Objectives/Concurrence en Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(818, 'git blame', '/R??cup??rer les modifications/Lister les modifications/');
INSERT INTO chapter (id, name, parent_path) VALUES(788, 'git checkout', '/Modifier un projet/Annuler mes modifications non valid??es/');
INSERT INTO chapter (id, name, parent_path) VALUES(815, 'git cherry-pick', '/R??cup??rer les modifications/');
INSERT INTO chapter (id, name, parent_path) VALUES(795, 'git commit --amend', '/Modifier un projet/Modifier des commits/');
INSERT INTO chapter (id, name, parent_path) VALUES(782, 'git diff', '/Modifier un projet/Voir mes modifications/');
INSERT INTO chapter (id, name, parent_path) VALUES(811, 'git fetch', '/R??cup??rer les modifications/');
INSERT INTO chapter (id, name, parent_path) VALUES(817, 'git log', '/R??cup??rer les modifications/Lister les modifications/');
INSERT INTO chapter (id, name, parent_path) VALUES(804, 'git merge', '/Modifier un projet/Travailler avec les branches/Fusionner deux branches/');
INSERT INTO chapter (id, name, parent_path) VALUES(813, 'git merge', '/R??cup??rer les modifications/');
INSERT INTO chapter (id, name, parent_path) VALUES(812, 'git pull', '/R??cup??rer les modifications/');
INSERT INTO chapter (id, name, parent_path) VALUES(805, 'git rebase', '/Modifier un projet/Travailler avec les branches/Fusionner deux branches/');
INSERT INTO chapter (id, name, parent_path) VALUES(814, 'git rebase', '/R??cup??rer les modifications/');
INSERT INTO chapter (id, name, parent_path) VALUES(796, 'git rebase -i', '/Modifier un projet/Modifier des commits/');
INSERT INTO chapter (id, name, parent_path) VALUES(790, 'git reset', '/Modifier un projet/Annuler mes modifications valid??es/');
INSERT INTO chapter (id, name, parent_path) VALUES(787, 'git restore', '/Modifier un projet/Annuler mes modifications non valid??es/');
INSERT INTO chapter (id, name, parent_path) VALUES(793, 'git revert', '/Modifier un projet/Annuler mes modifications valid??es/');
INSERT INTO chapter (id, name, parent_path) VALUES(783, 'git stash', '/Modifier un projet/Mettre mes modifications en attente/');
INSERT INTO chapter (id, name, parent_path) VALUES(781, 'git status', '/Modifier un projet/Voir mes modifications/');
INSERT INTO chapter (id, name, parent_path) VALUES(821, 'Gitflow', '/Bonnes pratiques/');
INSERT INTO chapter (id, name, parent_path) VALUES(792, 'hard', '/Modifier un projet/Annuler mes modifications valid??es/git reset/');
INSERT INTO chapter (id, name, parent_path) VALUES(768, 'HEAD', '/Les zones de travail/');
INSERT INTO chapter (id, name, parent_path) VALUES(684, 'H??ritage et polymorphisme', '/OCA Exam Objectives/L''h??ritage en Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(449, 'Identifier les bases de donn??es relatives', '/OCP Exam Objectives/Construire des applications de BDD avec JDBC/Bases de donn??es relatives/');
INSERT INTO chapter (id, name, parent_path) VALUES(240, 'Identifier les interfaces ?? utiliser', '/OCP Exam Objectives/Interfaces fonctionnelles int??gr??es ?? Java/Utiliser les interfaces int??gr??es dans le package java.util.fonction/');
INSERT INTO chapter (id, name, parent_path) VALUES(779, 'Identifier une version du projet', '/Modifier un projet/');
INSERT INTO chapter (id, name, parent_path) VALUES(141, 'IDENTIFIERS', '/OCA/CH 1 Java Building Blocks/DECLARING AND INITIALIZING VARIABLES/');
INSERT INTO chapter (id, name, parent_path) VALUES(91, 'IDENTIFY WHEN A METHOD OR FIELD IS ACCESSIBLE', '/OCA EXAM ESSENTIALS/CHAPITRE 4 : METHODS AND ENCAPSULATION/');
INSERT INTO chapter (id, name, parent_path) VALUES(110, 'IDENTIFY WHETHER AN EXCEPTION IS THROWN BY THE PROGRAMMER OR THE JVM', '/OCA EXAM ESSENTIALS/CHAPITRE 6 : EXCEPTIONS/');
INSERT INTO chapter (id, name, parent_path) VALUES(658, 'if - if/else', '/OCA Exam Objectives/Les structures de contr??le/Comprendre les expressions conditionnelles/');
INSERT INTO chapter (id, name, parent_path) VALUES(725, 'IllegalArgumentException', '/OCA Exam Objectives/Les exceptions/Conna??tre les exceptions communes/');
INSERT INTO chapter (id, name, parent_path) VALUES(737, 'Impl??mentation d''une interface', '/OCA Exam Objectives/L''h??ritage en Java/Classes abstraites et interfaces/');
INSERT INTO chapter (id, name, parent_path) VALUES(738, 'Impl??mentation de plusieurs interfaces', '/OCA Exam Objectives/L''h??ritage en Java/Classes abstraites et interfaces/');
INSERT INTO chapter (id, name, parent_path) VALUES(173, 'Impl??menter l''encapsulation', '/OCP Exam Objectives/Conception de Classes Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(174, 'Impl??menter l''h??ritage', '/OCP Exam Objectives/Conception de Classes Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(374, 'Impl??menter l''interface Serializable', '/OCP Exam Objectives/Les fondamentaux de Java IO/Lire et ??crire des donn??es/Ecrire et lire les donn??es entre la m??moire et le disque avec la S??rialisation/');
INSERT INTO chapter (id, name, parent_path) VALUES(177, 'Impl??menter la composition', '/OCP Exam Objectives/Conception de Classes Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(179, 'Impl??menter le polymorphisme', '/OCP Exam Objectives/Conception de Classes Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(183, 'Impl??menter les Design Patterns', '/OCP Exam Objectives/Conception de Classes Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(742, 'Impl??menter une interface fonctionnelle', '/OCA Exam Objectives/Les API de base de Java/Ecrire des expressions lambda simples/');
INSERT INTO chapter (id, name, parent_path) VALUES(579, 'Importer des paquets externes', '/OCA Exam Objectives/L''organisation en paquets de Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(149, 'Injection de d??pendances', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(143, 'INSTANCE AND CLASS VARIABLES', '/OCA/CH 1 Java Building Blocks/UNDERSTANDING DEFAULT INITIALIZATION OF VARIABLES/');
INSERT INTO chapter (id, name, parent_path) VALUES(134, 'INSTANCE INITIALIZER', '/OCA/CH 1 Java Building Blocks/CREATING OBJECTS/');
INSERT INTO chapter (id, name, parent_path) VALUES(135, 'INSTANCE INITIALIZER BLOCKS', '/OCA/CH 1 Java Building Blocks/CREATING OBJECTS/');
INSERT INTO chapter (id, name, parent_path) VALUES(321, 'Interactions entre Paths et Files', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/');
INSERT INTO chapter (id, name, parent_path) VALUES(210, 'Interfaces fonctionnelles int??gr??es ?? Java', '/OCP Exam Objectives/');
INSERT INTO chapter (id, name, parent_path) VALUES(423, 'Introduction', '/OCP Exam Objectives/Concurrence en Java/Les collections concurrentes/');
INSERT INTO chapter (id, name, parent_path) VALUES(452, 'Introduction', '/OCP Exam Objectives/Concurrence en Java/Les probl??mes de concurrence potentiels/');
INSERT INTO chapter (id, name, parent_path) VALUES(415, 'Introduction', '/OCP Exam Objectives/Concurrence en Java/Synchroniser les acc??s aux donn??es/');
INSERT INTO chapter (id, name, parent_path) VALUES(446, 'Introduction', '/OCP Exam Objectives/Construire des applications de BDD avec JDBC/Bases de donn??es relatives/');
INSERT INTO chapter (id, name, parent_path) VALUES(458, 'Introduction', '/OCP Exam Objectives/Construire des applications de BDD avec JDBC/Les interfaces JDBC, leur utilit??s et relations/');
INSERT INTO chapter (id, name, parent_path) VALUES(316, 'Introduction', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/La classe Path/');
INSERT INTO chapter (id, name, parent_path) VALUES(146, 'Introduction ?? Spring Framework', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(840, 'Introduction ?? VueX', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(426, 'Introduction et liste des types', '/OCP Exam Objectives/Concurrence en Java/Les collections concurrentes/Les types de collections concurrentes/');
INSERT INTO chapter (id, name, parent_path) VALUES(355, 'isDirectory()', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Comprendre les attributs de fichier (metadata)/Lire la nature de l''??lement point?? par le path/');
INSERT INTO chapter (id, name, parent_path) VALUES(358, 'isRegularFile()', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Comprendre les attributs de fichier (metadata)/Lire la nature de l''??lement point?? par le path/');
INSERT INTO chapter (id, name, parent_path) VALUES(359, 'isSymbolicLink()', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Comprendre les attributs de fichier (metadata)/Lire la nature de l''??lement point?? par le path/');
INSERT INTO chapter (id, name, parent_path) VALUES(239, 'It??rer avec forEach()', '/OCP Exam Objectives/G??n??ricit?? et Collections/Manipuler une collection avec les expressions Lambda/');
INSERT INTO chapter (id, name, parent_path) VALUES(260, 'It??rer dans un stream avec la m??thode forEach()', '/OCP Exam Objectives/API Stream de Java/Utiliser les op??rations terminales/');
INSERT INTO chapter (id, name, parent_path) VALUES(312, 'Java I-O de fichiers (NIO.2)', '/OCP Exam Objectives/');
INSERT INTO chapter (id, name, parent_path) VALUES(152, 'Java-based container configuration', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(460, 'JDBC URL', '/OCP Exam Objectives/Construire des applications de BDD avec JDBC/Les interfaces JDBC, leur utilit??s et relations/Connexion/');
INSERT INTO chapter (id, name, parent_path) VALUES(139, 'KEY DIFFERENCES', '/OCA/CH 1 Java Building Blocks/DISTINGUISHING BETWEEN OBJECT REFERENCES AND PRIMITIVES/');
INSERT INTO chapter (id, name, parent_path) VALUES(73, 'KNOW HOW TO IDENTIFY WHEN AN OBJECTIS ELIGIBLE FOR GARBAGE COLLECTION', '/OCA EXAM ESSENTIALS/CHAPITRE 1 : JAVA BUILDING BLOCKS/');
INSERT INTO chapter (id, name, parent_path) VALUES(481, 'L''ex??cution en Java', '/OCA Exam Objectives/');
INSERT INTO chapter (id, name, parent_path) VALUES(512, 'L''h??ritage en Java', '/OCA Exam Objectives/');
INSERT INTO chapter (id, name, parent_path) VALUES(398, 'L''interface Callable', '/OCP Exam Objectives/Concurrence en Java/Cr??er des threads de travail pour ??xecuter des t??ches de mani??re concurrente/');
INSERT INTO chapter (id, name, parent_path) VALUES(397, 'L''interface Runnable', '/OCP Exam Objectives/Concurrence en Java/Cr??er des threads de travail pour ??xecuter des t??ches de mani??re concurrente/');
INSERT INTO chapter (id, name, parent_path) VALUES(323, 'L''object Path', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Interactions entre Paths et Files/');
INSERT INTO chapter (id, name, parent_path) VALUES(500, 'L''organisation en paquets de Java', '/OCA Exam Objectives/');
INSERT INTO chapter (id, name, parent_path) VALUES(445, 'La classe CyclicBarrier', '/OCP Exam Objectives/Concurrence en Java/Gestion des processus simultan??s/');
INSERT INTO chapter (id, name, parent_path) VALUES(315, 'La classe Path', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/');
INSERT INTO chapter (id, name, parent_path) VALUES(448, 'La classe RecursiveTask', '/OCP Exam Objectives/Concurrence en Java/Gestion des processus simultan??s/');
INSERT INTO chapter (id, name, parent_path) VALUES(392, 'La concurence des threads', '/OCP Exam Objectives/Concurrence en Java/Les threads/');
INSERT INTO chapter (id, name, parent_path) VALUES(214, 'La m??thode merge()', '/OCP Exam Objectives/G??n??ricit?? et Collections/Cr??er et utiliser les objets de Collections/Maps/');
INSERT INTO chapter (id, name, parent_path) VALUES(213, 'La m??thode putIf()', '/OCP Exam Objectives/G??n??ricit?? et Collections/Cr??er et utiliser les objets de Collections/Maps/');
INSERT INTO chapter (id, name, parent_path) VALUES(378, 'La m??thode walk()', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Naviguer dans les fichiers via des streams/Naviguer avec la m??thode walk()/');
INSERT INTO chapter (id, name, parent_path) VALUES(661, 'La mise en place de l''h??ritage en Java', '/OCA Exam Objectives/L''h??ritage en Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(642, 'La notion d''h??ritage', '/OCA Exam Objectives/L''h??ritage en Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(268, 'Le collector toMap()', '/OCP Exam Objectives/API Stream de Java/Utiliser les op??rations terminales/Cr??er une collection ?? partir d''un stream avec la m??thode collect()/Utiliser collect() avec les Collectors/');
INSERT INTO chapter (id, name, parent_path) VALUES(557, 'Le corps d''une m??thode', '/OCA Exam Objectives/Les m??thodes et l''encapsulation/Cr??er les m??thodes/');
INSERT INTO chapter (id, name, parent_path) VALUES(420, 'Le co??t de la synchronisation', '/OCP Exam Objectives/Concurrence en Java/Synchroniser les acc??s aux donn??es/');
INSERT INTO chapter (id, name, parent_path) VALUES(402, 'Le ExecutorService', '/OCP Exam Objectives/Concurrence en Java/Cr??er des threads de travail pour ??xecuter des t??ches de mani??re concurrente/');
INSERT INTO chapter (id, name, parent_path) VALUES(447, 'Le framework Fork-Join', '/OCP Exam Objectives/Concurrence en Java/Gestion des processus simultan??s/');
INSERT INTO chapter (id, name, parent_path) VALUES(186, 'Le Pattern Immutabilit??', '/OCP Exam Objectives/Conception de Classes Java/Impl??menter les Design Patterns/');
INSERT INTO chapter (id, name, parent_path) VALUES(185, 'Le Pattern Singleton', '/OCP Exam Objectives/Conception de Classes Java/Impl??menter les Design Patterns/');
INSERT INTO chapter (id, name, parent_path) VALUES(594, 'Le processus d''initialisation', '/OCA Exam Objectives/Cycle de vie des objets/');
INSERT INTO chapter (id, name, parent_path) VALUES(615, 'Le processus de suppression', '/OCA Exam Objectives/Cycle de vie des objets/');
INSERT INTO chapter (id, name, parent_path) VALUES(833, 'Le rendu conditionnel v-if, v-else, v-else-if et v-show', '/Affichage de donn??es et directives/Les directives/');
INSERT INTO chapter (id, name, parent_path) VALUES(834, 'Le rendu multiple avec v-for', '/Affichage de donn??es et directives/Les directives/');
INSERT INTO chapter (id, name, parent_path) VALUES(836, 'Le rendu stylistique et dynamique avec v-bind', '/Affichage de donn??es et directives/Les directives/');
INSERT INTO chapter (id, name, parent_path) VALUES(846, 'Le store de VueX', '/Introduction ?? VueX/Les composants de VueX/');
INSERT INTO chapter (id, name, parent_path) VALUES(263, 'Le try-with-resources', '/OCP Exam Objectives/Exceptions et Assertions/Utiliser l''instruction try-with-resources/');
INSERT INTO chapter (id, name, parent_path) VALUES(509, 'Les API de base de Java', '/OCA Exam Objectives/');
INSERT INTO chapter (id, name, parent_path) VALUES(506, 'Les Arrays en Java', '/OCA Exam Objectives/');
INSERT INTO chapter (id, name, parent_path) VALUES(749, 'Les bases', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(244, 'Les bases', '/OCP Exam Objectives/API Stream de Java/D??velopper avec la classe Optionnal/');
INSERT INTO chapter (id, name, parent_path) VALUES(2, 'Les bases de Vue.JS', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(418, 'Les blocs synchronis??s', '/OCP Exam Objectives/Concurrence en Java/Synchroniser les acc??s aux donn??es/');
INSERT INTO chapter (id, name, parent_path) VALUES(245, 'Les chaines d''instruction', '/OCP Exam Objectives/API Stream de Java/D??velopper avec la classe Optionnal/');
INSERT INTO chapter (id, name, parent_path) VALUES(417, 'Les classes atomiques', '/OCP Exam Objectives/Concurrence en Java/Synchroniser les acc??s aux donn??es/');
INSERT INTO chapter (id, name, parent_path) VALUES(352, 'Les Classes de Stream', '/OCP Exam Objectives/Les fondamentaux de Java IO/Lire et ??crire des donn??es/');
INSERT INTO chapter (id, name, parent_path) VALUES(422, 'Les collections concurrentes', '/OCP Exam Objectives/Concurrence en Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(474, 'Les collections concurrentes', '/OCP Exam Objectives/Concurrence en Java/Les collections concurrentes/Les types de collections concurrentes/');
INSERT INTO chapter (id, name, parent_path) VALUES(430, 'Les collections CopyOnWrite', '/OCP Exam Objectives/Concurrence en Java/Les collections concurrentes/Les types de collections concurrentes/');
INSERT INTO chapter (id, name, parent_path) VALUES(429, 'Les collections skipList', '/OCP Exam Objectives/Concurrence en Java/Les collections concurrentes/Les types de collections concurrentes/');
INSERT INTO chapter (id, name, parent_path) VALUES(431, 'Les collections synchronis??es', '/OCP Exam Objectives/Concurrence en Java/Les collections concurrentes/Les types de collections concurrentes/');
INSERT INTO chapter (id, name, parent_path) VALUES(267, 'Les collectors basiques joining() et averaging()', '/OCP Exam Objectives/API Stream de Java/Utiliser les op??rations terminales/Cr??er une collection ?? partir d''un stream avec la m??thode collect()/Utiliser collect() avec les Collectors/');
INSERT INTO chapter (id, name, parent_path) VALUES(845, 'Les composants de VueX', '/Introduction ?? VueX/');
INSERT INTO chapter (id, name, parent_path) VALUES(559, 'Les constructeurs', '/OCA Exam Objectives/Cycle de vie des objets/');
INSERT INTO chapter (id, name, parent_path) VALUES(528, 'Les diff??rentes sortes de variables dans une classe', '/OCA Exam Objectives/Topologie des variables/');
INSERT INTO chapter (id, name, parent_path) VALUES(832, 'Les directives', '/Affichage de donn??es et directives/');
INSERT INTO chapter (id, name, parent_path) VALUES(830, 'Les ??l??ments d''une instance de Vue', '/Affichage de donn??es et directives/');
INSERT INTO chapter (id, name, parent_path) VALUES(424, 'Les erreurs de coh??rence dans la m??moire', '/OCP Exam Objectives/Concurrence en Java/Les collections concurrentes/');
INSERT INTO chapter (id, name, parent_path) VALUES(514, 'Les exceptions', '/OCA Exam Objectives/');
INSERT INTO chapter (id, name, parent_path) VALUES(265, 'Les exceptions supprim??es', '/OCP Exam Objectives/Exceptions et Assertions/Utiliser l''instruction try-with-resources/');
INSERT INTO chapter (id, name, parent_path) VALUES(299, 'Les fondamentaux de Java IO', '/OCP Exam Objectives/');
INSERT INTO chapter (id, name, parent_path) VALUES(837, 'Les formulaires et v-model', '/Affichage de donn??es et directives/Les directives/');
INSERT INTO chapter (id, name, parent_path) VALUES(455, 'Les interfaces JDBC, leur utilit??s et relations', '/OCP Exam Objectives/Construire des applications de BDD avec JDBC/');
INSERT INTO chapter (id, name, parent_path) VALUES(212, 'Les m??thode de base', '/OCP Exam Objectives/G??n??ricit?? et Collections/Cr??er et utiliser les objets de Collections/Maps/');
INSERT INTO chapter (id, name, parent_path) VALUES(216, 'Les m??thodes computeIfPresent() et computeIfAbsent()', '/OCP Exam Objectives/G??n??ricit?? et Collections/Cr??er et utiliser les objets de Collections/Maps/');
INSERT INTO chapter (id, name, parent_path) VALUES(498, 'Les m??thodes et l''encapsulation', '/OCA Exam Objectives/');
INSERT INTO chapter (id, name, parent_path) VALUES(270, 'Les m??thodes groupingBy(), partitioningBy() et mapping()', '/OCP Exam Objectives/API Stream de Java/Utiliser les op??rations terminales/Cr??er une collection ?? partir d''un stream avec la m??thode collect()/Utiliser collect() avec les Collectors/');
INSERT INTO chapter (id, name, parent_path) VALUES(419, 'Les m??thodes synchronis??es', '/OCP Exam Objectives/Concurrence en Java/Synchroniser les acc??s aux donn??es/');
INSERT INTO chapter (id, name, parent_path) VALUES(438, 'Les op??rations ind??pendantes', '/OCP Exam Objectives/Concurrence en Java/Les streams parall??les/Ex??cuter des t??ches en parall??le/');
INSERT INTO chapter (id, name, parent_path) VALUES(291, 'Les Optionals avec les streams primitifs', '/OCP Exam Objectives/API Stream de Java/Cr??er des streams manipulant des types primitifs/');
INSERT INTO chapter (id, name, parent_path) VALUES(556, 'Les param??tres d''une m??thode', '/OCA Exam Objectives/Les m??thodes et l''encapsulation/Cr??er les m??thodes/');
INSERT INTO chapter (id, name, parent_path) VALUES(450, 'Les probl??mes de concurrence potentiels', '/OCP Exam Objectives/Concurrence en Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(252, 'Les r??ductions', '/OCP Exam Objectives/API Stream de Java/Utiliser les op??rations terminales/');
INSERT INTO chapter (id, name, parent_path) VALUES(440, 'Les r??ductions parall??les', '/OCP Exam Objectives/Concurrence en Java/Les streams parall??les/');
INSERT INTO chapter (id, name, parent_path) VALUES(433, 'Les streams parall??les', '/OCP Exam Objectives/Concurrence en Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(503, 'Les structures de contr??le', '/OCA Exam Objectives/');
INSERT INTO chapter (id, name, parent_path) VALUES(388, 'Les threads', '/OCP Exam Objectives/Concurrence en Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(403, 'Les threads Executor simples', '/OCP Exam Objectives/Concurrence en Java/Cr??er des threads de travail pour ??xecuter des t??ches de mani??re concurrente/Le ExecutorService/');
INSERT INTO chapter (id, name, parent_path) VALUES(425, 'Les types de collections concurrentes', '/OCP Exam Objectives/Concurrence en Java/Les collections concurrentes/');
INSERT INTO chapter (id, name, parent_path) VALUES(390, 'Les types de thread', '/OCP Exam Objectives/Concurrence en Java/Les threads/');
INSERT INTO chapter (id, name, parent_path) VALUES(288, 'Les types et les m??thodes de base ', '/OCP Exam Objectives/API Stream de Java/Cr??er des streams manipulant des types primitifs/');
INSERT INTO chapter (id, name, parent_path) VALUES(542, 'Les types primitifs', '/OCA Exam Objectives/Topologie des variables/');
INSERT INTO chapter (id, name, parent_path) VALUES(751, 'Les zones de travail', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(757, 'Linux', '/Les bases/Comment installer Git/');
INSERT INTO chapter (id, name, parent_path) VALUES(400, 'Lire et ??crire avec les m??thodes reader() et writer()', '/OCP Exam Objectives/Les fondamentaux de Java IO/Lire et ??crire des donn??es depuis la console/');
INSERT INTO chapter (id, name, parent_path) VALUES(313, 'Lire et ??crire des donn??es', '/OCP Exam Objectives/Les fondamentaux de Java IO/');
INSERT INTO chapter (id, name, parent_path) VALUES(395, 'Lire et ??crire des donn??es depuis la console', '/OCP Exam Objectives/Les fondamentaux de Java IO/');
INSERT INTO chapter (id, name, parent_path) VALUES(353, 'Lire la nature de l''??lement point?? par le path', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Comprendre les attributs de fichier (metadata)/');
INSERT INTO chapter (id, name, parent_path) VALUES(362, 'Lire la taille d''un fichier avec la m??thode size()', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Comprendre les attributs de fichier (metadata)/');
INSERT INTO chapter (id, name, parent_path) VALUES(368, 'Lire les attributs', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Comprendre les attributs de fichier (metadata)/Acc??s au m??tadonn??es via des vues/');
INSERT INTO chapter (id, name, parent_path) VALUES(347, 'Lire un fichier en cr??ant un object bufferedReader() a partir d''un object path', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Interactions entre Paths et Files/L''object Path/');
INSERT INTO chapter (id, name, parent_path) VALUES(421, 'Lire un mot de passe ou donn??es confidentielles avec la m??thode readPassword()', '/OCP Exam Objectives/Les fondamentaux de Java IO/Lire et ??crire des donn??es depuis la console/');
INSERT INTO chapter (id, name, parent_path) VALUES(349, 'Lire un objet Files avec la m??thode readAllLines()', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Interactions entre Paths et Files/L''object Path/');
INSERT INTO chapter (id, name, parent_path) VALUES(416, 'Lire une simple ligne avec la m??thode readLine()', '/OCP Exam Objectives/Les fondamentaux de Java IO/Lire et ??crire des donn??es depuis la console/');
INSERT INTO chapter (id, name, parent_path) VALUES(382, 'Lister le contenu d''un dossier avec la m??thode List()', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Naviguer dans les fichiers via des streams/');
INSERT INTO chapter (id, name, parent_path) VALUES(816, 'Lister les modifications', '/R??cup??rer les modifications/');
INSERT INTO chapter (id, name, parent_path) VALUES(806, 'Lister les tags - git tag', '/Modifier un projet/Identifier une version du projet/');
INSERT INTO chapter (id, name, parent_path) VALUES(207, 'Listes', '/OCP Exam Objectives/G??n??ricit?? et Collections/Cr??er et utiliser les objets de Collections/');
INSERT INTO chapter (id, name, parent_path) VALUES(456, 'LiveLock', '/OCP Exam Objectives/Concurrence en Java/Les probl??mes de concurrence potentiels/');
INSERT INTO chapter (id, name, parent_path) VALUES(142, 'LOCAL VARIABLES', '/OCA/CH 1 Java Building Blocks/UNDERSTANDING DEFAULT INITIALIZATION OF VARIABLES/');
INSERT INTO chapter (id, name, parent_path) VALUES(296, 'Localisation', '/OCP Exam Objectives/');
INSERT INTO chapter (id, name, parent_path) VALUES(759, 'Mac', '/Les bases/Comment installer Git/');
INSERT INTO chapter (id, name, parent_path) VALUES(689, 'Ma??triser l''autoboxing', '/OCA Exam Objectives/Les API de base de Java/Wrapper Classes/');
INSERT INTO chapter (id, name, parent_path) VALUES(668, 'Ma??triser l''immuabilit?? des dates', '/OCA Exam Objectives/Les API de base de Java/Savoir modifier une date/');
INSERT INTO chapter (id, name, parent_path) VALUES(505, 'Ma??triser l''initialisation de variable locale', '/OCA Exam Objectives/R??gles g??n??riques de d??claration et initialisation des variables en Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(515, 'Ma??triser l''initialisation multiple', '/OCA Exam Objectives/R??gles g??n??riques de d??claration et initialisation des variables en Java/Ma??triser l''initialisation de variable locale/');
INSERT INTO chapter (id, name, parent_path) VALUES(513, 'Ma??triser l''initialisation simple', '/OCA Exam Objectives/R??gles g??n??riques de d??claration et initialisation des variables en Java/Ma??triser l''initialisation de variable locale/');
INSERT INTO chapter (id, name, parent_path) VALUES(581, 'Ma??triser l''ordre des ??l??ments dans un fichier', '/OCA Exam Objectives/L''organisation en paquets de Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(603, 'Ma??triser l''ordre des op??rations', '/OCA Exam Objectives/Utiliser les op??rateurs/');
INSERT INTO chapter (id, name, parent_path) VALUES(504, 'Ma??triser la d??claration de variable locale', '/OCA Exam Objectives/R??gles g??n??riques de d??claration et initialisation des variables en Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(511, 'Ma??triser la d??claration multiple', '/OCA Exam Objectives/R??gles g??n??riques de d??claration et initialisation des variables en Java/Ma??triser la d??claration de variable locale/');
INSERT INTO chapter (id, name, parent_path) VALUES(510, 'Ma??triser la d??claration simple', '/OCA Exam Objectives/R??gles g??n??riques de d??claration et initialisation des variables en Java/Ma??triser la d??claration de variable locale/');
INSERT INTO chapter (id, name, parent_path) VALUES(624, 'Ma??triser la m??thode finalize() et ses cons??quences', '/OCA Exam Objectives/Cycle de vie des objets/');
INSERT INTO chapter (id, name, parent_path) VALUES(672, 'Ma??triser la modification avec les p??riodes', '/OCA Exam Objectives/Les API de base de Java/Savoir modifier une date/');
INSERT INTO chapter (id, name, parent_path) VALUES(702, 'Ma??triser la notion de predicat et savoir l''appliquer', '/OCA Exam Objectives/Les API de base de Java/Ecrire des expressions lambda simples/');
INSERT INTO chapter (id, name, parent_path) VALUES(605, 'Ma??triser la promotion num??rique', '/OCA Exam Objectives/Utiliser les op??rateurs/');
INSERT INTO chapter (id, name, parent_path) VALUES(682, 'Ma??triser la recherche avec les ArrayList', '/OCA Exam Objectives/Les API de base de Java/Ma??triser les ArrayLists/');
INSERT INTO chapter (id, name, parent_path) VALUES(633, 'Ma??triser la recherche dans un Array', '/OCA Exam Objectives/Les Arrays en Java/Ma??triser les op??rations de base sur les Arrays/');
INSERT INTO chapter (id, name, parent_path) VALUES(518, 'Ma??triser le CamelCase pour les classes', '/OCA Exam Objectives/R??gles g??n??riques de d??claration et initialisation des variables en Java/Conna??tre les bonnes pratiques de nommage/');
INSERT INTO chapter (id, name, parent_path) VALUES(690, 'Ma??triser le fonctionnement de l''option default', '/OCA Exam Objectives/Les structures de contr??le/Utiliser une structure switch/');
INSERT INTO chapter (id, name, parent_path) VALUES(541, 'Ma??triser le null et son utilisation avec primitif/r??f??rence', '/OCA Exam Objectives/Types r??f??rences/Savoir diff??rencier types r??f??rences et types primitifs/');
INSERT INTO chapter (id, name, parent_path) VALUES(555, 'Ma??triser le passage de param??tre par valeur', '/OCA Exam Objectives/Les m??thodes et l''encapsulation/');
INSERT INTO chapter (id, name, parent_path) VALUES(688, 'Ma??triser le placement du mot cl?? break et les cons??quences de son absence', '/OCA Exam Objectives/Les structures de contr??le/Utiliser une structure switch/');
INSERT INTO chapter (id, name, parent_path) VALUES(681, 'Ma??triser le tri avec les ArrayList', '/OCA Exam Objectives/Les API de base de Java/Ma??triser les ArrayLists/');
INSERT INTO chapter (id, name, parent_path) VALUES(632, 'Ma??triser le tri d''un Array', '/OCA Exam Objectives/Les Arrays en Java/Ma??triser les op??rations de base sur les Arrays/');
INSERT INTO chapter (id, name, parent_path) VALUES(644, 'Ma??triser les ArrayLists', '/OCA Exam Objectives/Les API de base de Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(520, 'Ma??triser les commentaires', '/OCA Exam Objectives/Structure d''une classe Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(696, 'Ma??triser les conversions Array <-> ArrayList', '/OCA Exam Objectives/Les API de base de Java/Wrapper Classes/');
INSERT INTO chapter (id, name, parent_path) VALUES(691, 'Ma??triser les conversions String -> Primitives', '/OCA Exam Objectives/Les API de base de Java/Wrapper Classes/');
INSERT INTO chapter (id, name, parent_path) VALUES(694, 'Ma??triser les conversions String -> Wrapper class', '/OCA Exam Objectives/Les API de base de Java/Wrapper Classes/');
INSERT INTO chapter (id, name, parent_path) VALUES(699, 'Ma??triser les diff??rents types de syntaxe', '/OCA Exam Objectives/Les API de base de Java/Ecrire des expressions lambda simples/');
INSERT INTO chapter (id, name, parent_path) VALUES(712, 'Ma??triser les exceptions et l''h??ritage', '/OCA Exam Objectives/Les exceptions/');
INSERT INTO chapter (id, name, parent_path) VALUES(706, 'Ma??triser les m??thodes cach??es', '/OCA Exam Objectives/L''h??ritage en Java/H??ritage et polymorphisme/');
INSERT INTO chapter (id, name, parent_path) VALUES(704, 'Ma??triser les m??thodes finales', '/OCA Exam Objectives/L''h??ritage en Java/H??ritage et polymorphisme/');
INSERT INTO chapter (id, name, parent_path) VALUES(739, 'Ma??triser les m??thodes par d??faut des interfaces', '/OCA Exam Objectives/L''h??ritage en Java/Classes abstraites et interfaces/');
INSERT INTO chapter (id, name, parent_path) VALUES(709, 'Ma??triser les m??thodes statiques cach??es', '/OCA Exam Objectives/L''h??ritage en Java/H??ritage et polymorphisme/');
INSERT INTO chapter (id, name, parent_path) VALUES(623, 'Ma??triser les op??rations de base sur les Arrays', '/OCA Exam Objectives/Les Arrays en Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(535, 'Ma??triser les types r??f??ren??ant un objet', '/OCA Exam Objectives/Types r??f??rences/');
INSERT INTO chapter (id, name, parent_path) VALUES(625, 'Ma??triser les Varargs', '/OCA Exam Objectives/Les Arrays en Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(537, 'Manipuler les variables d''instance', '/OCA Exam Objectives/Types r??f??rences/');
INSERT INTO chapter (id, name, parent_path) VALUES(328, 'Manipuler un Stream', '/OCP Exam Objectives/Les fondamentaux de Java IO/Lire et ??crire des donn??es/');
INSERT INTO chapter (id, name, parent_path) VALUES(235, 'Manipuler une collection avec les expressions Lambda', '/OCP Exam Objectives/G??n??ricit?? et Collections/');
INSERT INTO chapter (id, name, parent_path) VALUES(290, 'Manipuler une date', '/OCP Exam Objectives/Utiliser l''API Date-Time de Java SE 8/');
INSERT INTO chapter (id, name, parent_path) VALUES(209, 'Maps', '/OCP Exam Objectives/G??n??ricit?? et Collections/Cr??er et utiliser les objets de Collections/');
INSERT INTO chapter (id, name, parent_path) VALUES(153, 'Messagerie, Emailing, ex??cution de m??thodes asynchrones et cache avec Spring', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(204, 'M??thode, classe et interface g??n??riques', '/OCP Exam Objectives/G??n??ricit?? et Collections/Cr??er et utiliser une classe g??n??rique/');
INSERT INTO chapter (id, name, parent_path) VALUES(841, 'Mettre en ligne une application avec Vue', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(772, 'Mettre mes modifications en attente', '/Modifier un projet/');
INSERT INTO chapter (id, name, parent_path) VALUES(282, 'Mettre tous les ??l??ments de plusieurs streams au m??me niveau avec la m??thode flatMap()', '/OCP Exam Objectives/API Stream de Java/Utiliser les op??rations interm??diaires/');
INSERT INTO chapter (id, name, parent_path) VALUES(401, 'Mettre un thread en pause', '/OCP Exam Objectives/Concurrence en Java/Cr??er des threads de travail pour ??xecuter des t??ches de mani??re concurrente/');
INSERT INTO chapter (id, name, parent_path) VALUES(238, 'Mise ?? jour des ??l??ments d''une liste avec replaceAll()', '/OCP Exam Objectives/G??n??ricit?? et Collections/Manipuler une collection avec les expressions Lambda/');
INSERT INTO chapter (id, name, parent_path) VALUES(4, 'Mod??le MVVM', '/Les bases de Vue.JS/');
INSERT INTO chapter (id, name, parent_path) VALUES(847, 'Modification du store avec les mutations', '/Introduction ?? VueX/Les composants de VueX/');
INSERT INTO chapter (id, name, parent_path) VALUES(777, 'Modifier des commits', '/Modifier un projet/');
INSERT INTO chapter (id, name, parent_path) VALUES(370, 'Modifier les attributs', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Comprendre les attributs de fichier (metadata)/Acc??s au m??tadonn??es via des vues/');
INSERT INTO chapter (id, name, parent_path) VALUES(280, 'Modifier les ??l??ments d''un stream avec la m??thode map()', '/OCP Exam Objectives/API Stream de Java/Utiliser les op??rations interm??diaires/');
INSERT INTO chapter (id, name, parent_path) VALUES(752, 'Modifier un projet', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(27, 'Module System', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(129, 'NAMING CONFLICTS', '/OCA/CH 1 Java Building Blocks/UNDERSTANDING PACKAGE DECLARATIONS AND IMPORTS/');
INSERT INTO chapter (id, name, parent_path) VALUES(377, 'Naviguer avec la m??thode walk()', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Naviguer dans les fichiers via des streams/');
INSERT INTO chapter (id, name, parent_path) VALUES(371, 'Naviguer dans les fichiers via des streams', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/');
INSERT INTO chapter (id, name, parent_path) VALUES(471, 'Naviguer dans un ResultSet', '/OCP Exam Objectives/Construire des applications de BDD avec JDBC/Les interfaces JDBC, leur utilit??s et relations/ResultSet/');
INSERT INTO chapter (id, name, parent_path) VALUES(339, 'Naviguer dans un Stream vec les m??thodes mark() et reset()', '/OCP Exam Objectives/Les fondamentaux de Java IO/Lire et ??crire des donn??es/Manipuler un Stream/');
INSERT INTO chapter (id, name, parent_path) VALUES(413, 'Nettoyer le Buffer avec la m??thode flush()', '/OCP Exam Objectives/Les fondamentaux de Java IO/Lire et ??crire des donn??es depuis la console/');
INSERT INTO chapter (id, name, parent_path) VALUES(785, 'Nettoyer ma file d''attente', '/Modifier un projet/Mettre mes modifications en attente/');
INSERT INTO chapter (id, name, parent_path) VALUES(335, 'Nettoyer un Stream avec la m??thode flush()', '/OCP Exam Objectives/Les fondamentaux de Java IO/Lire et ??crire des donn??es/Manipuler un Stream/');
INSERT INTO chapter (id, name, parent_path) VALUES(22, 'Node CLI', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(23, 'Node.JS Events & Event Loop', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(819, 'Nommage des commits', '/Bonnes pratiques/');
INSERT INTO chapter (id, name, parent_path) VALUES(747, 'Notion de composant Vue.JS', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(720, 'NullPointerException', '/OCA Exam Objectives/Les exceptions/Conna??tre les exceptions communes/');
INSERT INTO chapter (id, name, parent_path) VALUES(724, 'NumberFormatException', '/OCA Exam Objectives/Les exceptions/Conna??tre les exceptions communes/');
INSERT INTO chapter (id, name, parent_path) VALUES(254, 'Obtenir le nombre d''??l??ments avec la m??thode count()', '/OCP Exam Objectives/API Stream de Java/Utiliser les op??rations terminales/');
INSERT INTO chapter (id, name, parent_path) VALUES(5, 'OCA', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(65, 'OCA EXAM ESSENTIALS', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(480, 'OCA Exam Objectives', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(8, 'OCP', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(32, 'OCP 11', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(168, 'OCP Exam Objectives', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(136, 'ORDER OF INITIALIZATION', '/OCA/CH 1 Java Building Blocks/CREATING OBJECTS/');
INSERT INTO chapter (id, name, parent_path) VALUES(124, 'ORDERING ELEMENTS IN A CLASS', '/OCA/CH 1 Java Building Blocks/');
INSERT INTO chapter (id, name, parent_path) VALUES(307, 'Parser les nombres', '/OCP Exam Objectives/Localisation/Formatter en fonction de la Locale/');
INSERT INTO chapter (id, name, parent_path) VALUES(776, 'Partager mes modifications - git push', '/Modifier un projet/');
INSERT INTO chapter (id, name, parent_path) VALUES(810, 'Partager un tag - git push --tags', '/Modifier un projet/Identifier une version du projet/');
INSERT INTO chapter (id, name, parent_path) VALUES(351, 'Passer des octets avec la m??thode skip()', '/OCP Exam Objectives/Les fondamentaux de Java IO/Lire et ??crire des donn??es/Manipuler un Stream/');
INSERT INTO chapter (id, name, parent_path) VALUES(831, 'Passer des variables au template', '/Affichage de donn??es et directives/');
INSERT INTO chapter (id, name, parent_path) VALUES(748, 'Petits pas : Quelques connaissances en Javascript (ES6)', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(496, 'Port??e des variables', '/OCA Exam Objectives/');
INSERT INTO chapter (id, name, parent_path) VALUES(220, 'Predicate et BiPredicate', '/OCP Exam Objectives/Interfaces fonctionnelles int??gr??es ?? Java/Utiliser les interfaces int??gr??es dans le package java.util.fonction/');
INSERT INTO chapter (id, name, parent_path) VALUES(297, 'Prendre en compte les heures d''??t??', '/OCP Exam Objectives/Utiliser l''API Date-Time de Java SE 8/');
INSERT INTO chapter (id, name, parent_path) VALUES(411, 'Pr??voir le lancement d''un thread', '/OCP Exam Objectives/Concurrence en Java/Cr??er des threads de travail pour ??xecuter des t??ches de mani??re concurrente/Le ExecutorService/');
INSERT INTO chapter (id, name, parent_path) VALUES(137, 'PRIMITIVE TYPES', '/OCA/CH 1 Java Building Blocks/DISTINGUISHING BETWEEN OBJECT REFERENCES AND PRIMITIVES/');
INSERT INTO chapter (id, name, parent_path) VALUES(560, 'Principe de constructeur', '/OCA Exam Objectives/Les m??thodes et l''encapsulation/Cr??er les m??thodes/');
INSERT INTO chapter (id, name, parent_path) VALUES(28, 'Process/OS', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(820, 'Pull requests', '/Bonnes pratiques/');
INSERT INTO chapter (id, name, parent_path) VALUES(3, 'Qu''est-ce que Vue.JS ?', '/Les bases de Vue.JS/');
INSERT INTO chapter (id, name, parent_path) VALUES(844, 'Qu''est-ce que VueX ?', '/Introduction ?? VueX/');
INSERT INTO chapter (id, name, parent_path) VALUES(825, 'Quelle est la forme d''un composant Vue.JS ?', '/Notion de composant Vue.JS/');
INSERT INTO chapter (id, name, parent_path) VALUES(221, 'Queues', '/OCP Exam Objectives/G??n??ricit?? et Collections/Cr??er et utiliser les objets de Collections/');
INSERT INTO chapter (id, name, parent_path) VALUES(457, 'Race Conditions', '/OCP Exam Objectives/Concurrence en Java/Les probl??mes de concurrence potentiels/');
INSERT INTO chapter (id, name, parent_path) VALUES(133, 'READING AND WRITING OBJECT FIELDS', '/OCA/CH 1 Java Building Blocks/CREATING OBJECTS/');
INSERT INTO chapter (id, name, parent_path) VALUES(272, 'R??capitulatif des Collectors', '/OCP Exam Objectives/API Stream de Java/Utiliser les op??rations terminales/Cr??er une collection ?? partir d''un stream avec la m??thode collect()/Utiliser collect() avec les Collectors/');
INSERT INTO chapter (id, name, parent_path) VALUES(807, 'Recherche un tag - git tag -l "v1.0.*"', '/Modifier un projet/Identifier une version du projet/');
INSERT INTO chapter (id, name, parent_path) VALUES(230, 'Rechercher un ??l??ment dans une liste tri??e', '/OCP Exam Objectives/G??n??ricit?? et Collections/Utiliser les interfaces de comparaison/');
INSERT INTO chapter (id, name, parent_path) VALUES(88, 'RECOGNIZE INVALID USES OF DATES AND TIMES', '/OCA EXAM ESSENTIALS/CHAPITRE 3: CORE JAVA APIs/');
INSERT INTO chapter (id, name, parent_path) VALUES(101, 'RECOGNIZE THE DIFFERENCE BETWEEN METHOD OVERRIDING AND METHOD OVERLOADING', '/OCA EXAM ESSENTIALS/CHAPITRE 5 : CLASS DESIGN/');
INSERT INTO chapter (id, name, parent_path) VALUES(92, 'RECOGNIZE VALID AND INVALID USES OF STATIC IMPORTS', '/OCA EXAM ESSENTIALS/CHAPITRE 4 : METHODS AND ENCAPSULATION/');
INSERT INTO chapter (id, name, parent_path) VALUES(106, 'RECOGNIZE VALID REFERENCE CASTING', '/OCA EXAM ESSENTIALS/CHAPITRE 5 : CLASS DESIGN/');
INSERT INTO chapter (id, name, parent_path) VALUES(112, 'RECOGNIZE WHEN TO USE THROW VERSUS THROWS', '/OCA EXAM ESSENTIALS/CHAPITRE 6 : EXCEPTIONS/');
INSERT INTO chapter (id, name, parent_path) VALUES(585, 'Reconna??tre et supprimer les imports redondants', '/OCA Exam Objectives/L''organisation en paquets de Java/Importer des paquets externes/');
INSERT INTO chapter (id, name, parent_path) VALUES(586, 'Reconnaitre les conflits de nom multi import', '/OCA Exam Objectives/L''organisation en paquets de Java/Importer des paquets externes/');
INSERT INTO chapter (id, name, parent_path) VALUES(538, 'Reconna??tre les variables d''instance', '/OCA Exam Objectives/Topologie des variables/Les diff??rentes sortes de variables dans une classe/');
INSERT INTO chapter (id, name, parent_path) VALUES(534, 'Reconna??tre les variables de classe', '/OCA Exam Objectives/Topologie des variables/Les diff??rentes sortes de variables dans une classe/');
INSERT INTO chapter (id, name, parent_path) VALUES(533, 'Reconna??tre les variables locales', '/OCA Exam Objectives/Topologie des variables/Les diff??rentes sortes de variables dans une classe/');
INSERT INTO chapter (id, name, parent_path) VALUES(567, 'Reconna??tre un appel valide d''une m??thode statique et d''une m??thode d''instance', '/OCA Exam Objectives/Les m??thodes et l''encapsulation/Appliquer le mot cl?? static /');
INSERT INTO chapter (id, name, parent_path) VALUES(522, 'Reconnaitre une m??thode valide', '/OCA Exam Objectives/Structure d''une classe Java/Reconna??tre une structure valide/');
INSERT INTO chapter (id, name, parent_path) VALUES(519, 'Reconna??tre une structure valide', '/OCA Exam Objectives/Structure d''une classe Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(469, 'R??cup??rer et lire un ResultSet', '/OCP Exam Objectives/Construire des applications de BDD avec JDBC/Les interfaces JDBC, leur utilit??s et relations/ResultSet/');
INSERT INTO chapter (id, name, parent_path) VALUES(285, 'R??cup??rer les ??l??ments d''un stream pour le d??buggage avec la m??thode peek()', '/OCP Exam Objectives/API Stream de Java/Utiliser les op??rations interm??diaires/');
INSERT INTO chapter (id, name, parent_path) VALUES(753, 'R??cup??rer les modifications', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(784, 'R??cup??rer mes modifications en attente', '/Modifier un projet/Mettre mes modifications en attente/');
INSERT INTO chapter (id, name, parent_path) VALUES(461, 'R??cup??rer un connexion ?? la base de donn??es', '/OCP Exam Objectives/Construire des applications de BDD avec JDBC/Les interfaces JDBC, leur utilit??s et relations/Connexion/');
INSERT INTO chapter (id, name, parent_path) VALUES(279, 'R??cup??rer un intervalle avec les m??thodes limit() et skip()', '/OCP Exam Objectives/API Stream de Java/Utiliser les op??rations interm??diaires/');
INSERT INTO chapter (id, name, parent_path) VALUES(762, 'R??cup??rer un projet existant - git clone', '/Cr??er un projet/');
INSERT INTO chapter (id, name, parent_path) VALUES(465, 'R??cup??rer un statement', '/OCP Exam Objectives/Construire des applications de BDD avec JDBC/Les interfaces JDBC, leur utilit??s et relations/Statement/');
INSERT INTO chapter (id, name, parent_path) VALUES(470, 'R??cup??rer une donn??e dans un ResultSet', '/OCP Exam Objectives/Construire des applications de BDD avec JDBC/Les interfaces JDBC, leur utilit??s et relations/ResultSet/');
INSERT INTO chapter (id, name, parent_path) VALUES(196, 'Red??finir la m??thode equals()', '/OCP Exam Objectives/Conception de Classes Java/Red??finir les m??thodes de base de la classe Object/');
INSERT INTO chapter (id, name, parent_path) VALUES(201, 'Red??finir la m??thode hashCode()', '/OCP Exam Objectives/Conception de Classes Java/Red??finir les m??thodes de base de la classe Object/');
INSERT INTO chapter (id, name, parent_path) VALUES(203, 'Red??finir la m??thode toString()', '/OCP Exam Objectives/Conception de Classes Java/Red??finir les m??thodes de base de la classe Object/');
INSERT INTO chapter (id, name, parent_path) VALUES(193, 'Red??finir les m??thodes de base de la classe Object', '/OCP Exam Objectives/Conception de Classes Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(128, 'REDUNDANT IMPORTS', '/OCA/CH 1 Java Building Blocks/UNDERSTANDING PACKAGE DECLARATIONS AND IMPORTS/');
INSERT INTO chapter (id, name, parent_path) VALUES(138, 'REFERENCE TYPES', '/OCA/CH 1 Java Building Blocks/DISTINGUISHING BETWEEN OBJECT REFERENCES AND PRIMITIVES/');
INSERT INTO chapter (id, name, parent_path) VALUES(540, 'R??f??rencer un nouvel objet', '/OCA Exam Objectives/Types r??f??rences/Ma??triser les types r??f??ren??ant un objet/');
INSERT INTO chapter (id, name, parent_path) VALUES(493, 'R??gles g??n??riques de d??claration et initialisation des variables en Java', '/OCA Exam Objectives/');
INSERT INTO chapter (id, name, parent_path) VALUES(269, 'Relancer une exception', '/OCP Exam Objectives/Exceptions et Assertions/');
INSERT INTO chapter (id, name, parent_path) VALUES(479, 'Relation entre equals() et toString()', '/OCP Exam Objectives/Conception de Classes Java/Red??finir les m??thodes de base de la classe Object/');
INSERT INTO chapter (id, name, parent_path) VALUES(292, 'Remplacer l''utilisation de plusieurs m??thodes terminales basiques avec SummaryStatistics', '/OCP Exam Objectives/API Stream de Java/Cr??er des streams manipulant des types primitifs/');
INSERT INTO chapter (id, name, parent_path) VALUES(769, 'Repository central', '/Les zones de travail/');
INSERT INTO chapter (id, name, parent_path) VALUES(767, 'Repository local', '/Les zones de travail/');
INSERT INTO chapter (id, name, parent_path) VALUES(451, 'Requ??te SQL basique', '/OCP Exam Objectives/Construire des applications de BDD avec JDBC/Bases de donn??es relatives/');
INSERT INTO chapter (id, name, parent_path) VALUES(467, 'ResultSet', '/OCP Exam Objectives/Construire des applications de BDD avec JDBC/Les interfaces JDBC, leur utilit??s et relations/');
INSERT INTO chapter (id, name, parent_path) VALUES(695, 'Savoir ajouter un label', '/OCA Exam Objectives/Les structures de contr??le/Utiliser les structures de contr??les avanc??es/');
INSERT INTO chapter (id, name, parent_path) VALUES(698, 'Savoir alt??rer le fonctionnement avec break et un label', '/OCA Exam Objectives/Les structures de contr??le/Utiliser les structures de contr??les avanc??es/');
INSERT INTO chapter (id, name, parent_path) VALUES(700, 'Savoir alt??rer le fonctionnement avec continue et un label', '/OCA Exam Objectives/Les structures de contr??le/Utiliser les structures de contr??les avanc??es/');
INSERT INTO chapter (id, name, parent_path) VALUES(640, 'Savoir cr??er un objet date', '/OCA Exam Objectives/Les API de base de Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(622, 'Savoir cr??er un tableau ?? multiples dimensions', '/OCA Exam Objectives/Les Arrays en Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(620, 'Savoir cr??er un tableau ?? une dimension', '/OCA Exam Objectives/Les Arrays en Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(667, 'Savoir cr??er une date avec month', '/OCA Exam Objectives/Les API de base de Java/Savoir cr??er un objet date/');
INSERT INTO chapter (id, name, parent_path) VALUES(677, 'Savoir d??clarer un arraylist', '/OCA Exam Objectives/Les API de base de Java/Ma??triser les ArrayLists/');
INSERT INTO chapter (id, name, parent_path) VALUES(526, 'Savoir d??finir plusieurs classes dans un fichier', '/OCA Exam Objectives/Structure d''une classe Java/G??rer les classes dans un fichier/');
INSERT INTO chapter (id, name, parent_path) VALUES(536, 'Savoir diff??rencier types r??f??rences et types primitifs', '/OCA Exam Objectives/Types r??f??rences/');
INSERT INTO chapter (id, name, parent_path) VALUES(524, 'Savoir faire des commentaires multilignes', '/OCA Exam Objectives/Structure d''une classe Java/Ma??triser les commentaires/');
INSERT INTO chapter (id, name, parent_path) VALUES(523, 'Savoir faire des commentaires sur une ligne', '/OCA Exam Objectives/Structure d''une classe Java/Ma??triser les commentaires/');
INSERT INTO chapter (id, name, parent_path) VALUES(643, 'Savoir formater une date', '/OCA Exam Objectives/Les API de base de Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(630, 'Savoir initialiser un tableau ?? multiple dimension', '/OCA Exam Objectives/Les Arrays en Java/Savoir cr??er un tableau ?? multiples dimensions/');
INSERT INTO chapter (id, name, parent_path) VALUES(627, 'Savoir initialiser un tableau ?? une dimension', '/OCA Exam Objectives/Les Arrays en Java/Savoir cr??er un tableau ?? une dimension/');
INSERT INTO chapter (id, name, parent_path) VALUES(687, 'Savoir instancier une classe wrapper', '/OCA Exam Objectives/Les API de base de Java/Wrapper Classes/');
INSERT INTO chapter (id, name, parent_path) VALUES(547, 'Savoir lire une variable d''instance', '/OCA Exam Objectives/Types r??f??rences/Manipuler les variables d''instance/');
INSERT INTO chapter (id, name, parent_path) VALUES(583, 'Savoir ma??triser le caract??re *', '/OCA Exam Objectives/L''organisation en paquets de Java/Importer des paquets externes/');
INSERT INTO chapter (id, name, parent_path) VALUES(584, 'Savoir ma??triser les imports statiques', '/OCA Exam Objectives/L''organisation en paquets de Java/Importer des paquets externes/');
INSERT INTO chapter (id, name, parent_path) VALUES(577, 'Savoir modifier un objet pass?? en param??tre', '/OCA Exam Objectives/Les m??thodes et l''encapsulation/Ma??triser le passage de param??tre par valeur/');
INSERT INTO chapter (id, name, parent_path) VALUES(641, 'Savoir modifier une date', '/OCA Exam Objectives/Les API de base de Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(675, 'Savoir parser une date', '/OCA Exam Objectives/Les API de base de Java/Savoir formater une date/');
INSERT INTO chapter (id, name, parent_path) VALUES(572, 'Savoir quand ne pas utiliser de mot cl??', '/OCA Exam Objectives/Les m??thodes et l''encapsulation/Appliquer des modificateurs d''acc??s/');
INSERT INTO chapter (id, name, parent_path) VALUES(570, 'Savoir quand utiliser le mot cl?? private', '/OCA Exam Objectives/Les m??thodes et l''encapsulation/Appliquer des modificateurs d''acc??s/');
INSERT INTO chapter (id, name, parent_path) VALUES(571, 'Savoir quand utiliser le mot cl?? protected', '/OCA Exam Objectives/Les m??thodes et l''encapsulation/Appliquer des modificateurs d''acc??s/');
INSERT INTO chapter (id, name, parent_path) VALUES(569, 'Savoir quand utiliser le mot cl?? public', '/OCA Exam Objectives/Les m??thodes et l''encapsulation/Appliquer des modificateurs d''acc??s/');
INSERT INTO chapter (id, name, parent_path) VALUES(574, 'Savoir reconna??tre et ??crire un JavaBeans', '/OCA Exam Objectives/Les m??thodes et l''encapsulation/Appliquer les principes de l''encapsulation dans une classe/');
INSERT INTO chapter (id, name, parent_path) VALUES(575, 'Savoir reconna??tre et ??crire une classe immuable', '/OCA Exam Objectives/Les m??thodes et l''encapsulation/Appliquer les principes de l''encapsulation dans une classe/');
INSERT INTO chapter (id, name, parent_path) VALUES(697, 'Savoir r????crire une m??thode', '/OCA Exam Objectives/L''h??ritage en Java/H??ritage et polymorphisme/');
INSERT INTO chapter (id, name, parent_path) VALUES(701, 'Savoir surcharger une m??thode', '/OCA Exam Objectives/L''h??ritage en Java/H??ritage et polymorphisme/');
INSERT INTO chapter (id, name, parent_path) VALUES(683, 'Savoir utiliser final pour cr??er une constante locale (?? supprimer)', '/OCA Exam Objectives/Les structures de contr??le/Utiliser une structure switch/');
INSERT INTO chapter (id, name, parent_path) VALUES(678, 'Savoir utiliser un arraylist', '/OCA Exam Objectives/Les API de base de Java/Ma??triser les ArrayLists/');
INSERT INTO chapter (id, name, parent_path) VALUES(631, 'Savoir utiliser un tableau ?? multiple dimension', '/OCA Exam Objectives/Les Arrays en Java/Savoir cr??er un tableau ?? multiples dimensions/');
INSERT INTO chapter (id, name, parent_path) VALUES(628, 'Savoir utiliser un tableau ?? une dimension', '/OCA Exam Objectives/Les Arrays en Java/Savoir cr??er un tableau ?? une dimension/');
INSERT INTO chapter (id, name, parent_path) VALUES(379, 'S??rialiser et d??s??rialiser un objet avec les classes ObjectOutputStream et ObjectInputStream', '/OCP Exam Objectives/Les fondamentaux de Java IO/Lire et ??crire des donn??es/Ecrire et lire les donn??es entre la m??moire et le disque avec la S??rialisation/');
INSERT INTO chapter (id, name, parent_path) VALUES(208, 'Sets', '/OCP Exam Objectives/G??n??ricit?? et Collections/Cr??er et utiliser les objets de Collections/');
INSERT INTO chapter (id, name, parent_path) VALUES(835, 'Simuler un ??v??nement avec v-on', '/Affichage de donn??es et directives/Les directives/');
INSERT INTO chapter (id, name, parent_path) VALUES(838, 'Single Page : Vue Router', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(791, 'soft', '/Modifier un projet/Annuler mes modifications valid??es/git reset/');
INSERT INTO chapter (id, name, parent_path) VALUES(147, 'Spring Framework Basics', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(765, 'Staging area', '/Les zones de travail/');
INSERT INTO chapter (id, name, parent_path) VALUES(454, 'Starvation', '/OCP Exam Objectives/Concurrence en Java/Les probl??mes de concurrence potentiels/');
INSERT INTO chapter (id, name, parent_path) VALUES(766, 'Stash', '/Les zones de travail/');
INSERT INTO chapter (id, name, parent_path) VALUES(93, 'STATE THE OUPUT OF CODE INVOLVING METHODS', '/OCA EXAM ESSENTIALS/CHAPITRE 4 : METHODS AND ENCAPSULATION/');
INSERT INTO chapter (id, name, parent_path) VALUES(464, 'Statement', '/OCP Exam Objectives/Construire des applications de BDD avec JDBC/Les interfaces JDBC, leur utilit??s et relations/');
INSERT INTO chapter (id, name, parent_path) VALUES(637, 'Stocker les donn??es et les manipuler avec des String et des StringBuilder', '/OCA Exam Objectives/Les API de base de Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(494, 'Structure d''une classe Java', '/OCA Exam Objectives/');
INSERT INTO chapter (id, name, parent_path) VALUES(729, 'super', '/OCA Exam Objectives/L''h??ritage en Java/Utiliser super et this pour acc??der aux champs et constructeurs/');
INSERT INTO chapter (id, name, parent_path) VALUES(731, 'super()', '/OCA Exam Objectives/L''h??ritage en Java/Utiliser super et this pour acc??der aux champs et constructeurs/');
INSERT INTO chapter (id, name, parent_path) VALUES(217, 'Supplier', '/OCP Exam Objectives/Interfaces fonctionnelles int??gr??es ?? Java/Utiliser les interfaces int??gr??es dans le package java.util.fonction/');
INSERT INTO chapter (id, name, parent_path) VALUES(237, 'Suppression conditionnelle avec removeIf()', '/OCP Exam Objectives/G??n??ricit?? et Collections/Manipuler une collection avec les expressions Lambda/');
INSERT INTO chapter (id, name, parent_path) VALUES(278, 'Supprimer les doublons avec la m??thode distinct()', '/OCP Exam Objectives/API Stream de Java/Utiliser les op??rations interm??diaires/');
INSERT INTO chapter (id, name, parent_path) VALUES(346, 'Supprimer un fichier avec les m??thodes delete() et deleteIfExists()', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Interactions entre Paths et Files/L''object Path/');
INSERT INTO chapter (id, name, parent_path) VALUES(809, 'Supprimer un tag - git tag -d', '/Modifier un projet/Identifier une version du projet/');
INSERT INTO chapter (id, name, parent_path) VALUES(798, 'Supprimer une branche', '/Modifier un projet/Travailler avec les branches/');
INSERT INTO chapter (id, name, parent_path) VALUES(799, 'Supprimer une branche merg??e', '/Modifier un projet/Travailler avec les branches/Supprimer une branche/');
INSERT INTO chapter (id, name, parent_path) VALUES(800, 'Supprimer une branche non merg??e', '/Modifier un projet/Travailler avec les branches/Supprimer une branche/');
INSERT INTO chapter (id, name, parent_path) VALUES(801, 'Supprimer une branche sur le repository central', '/Modifier un projet/Travailler avec les branches/Supprimer une branche/');
INSERT INTO chapter (id, name, parent_path) VALUES(561, 'Surcharge de constructeur', '/OCA Exam Objectives/Les m??thodes et l''encapsulation/Cr??er les m??thodes/');
INSERT INTO chapter (id, name, parent_path) VALUES(414, 'Synchroniser les acc??s aux donn??es', '/OCP Exam Objectives/Concurrence en Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(475, 'Test', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(361, 'Tester l''acceccibilit?? d''un fichier avec la m??thode isReadable() et isExecutable()', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Comprendre les attributs de fichier (metadata)/');
INSERT INTO chapter (id, name, parent_path) VALUES(604, 'Tester l''??galit?? ', '/OCA Exam Objectives/Utiliser les op??rateurs/');
INSERT INTO chapter (id, name, parent_path) VALUES(271, 'Tester l''invariance avec les assertions', '/OCP Exam Objectives/Exceptions et Assertions/');
INSERT INTO chapter (id, name, parent_path) VALUES(730, 'this', '/OCA Exam Objectives/L''h??ritage en Java/Utiliser super et this pour acc??der aux champs et constructeurs/');
INSERT INTO chapter (id, name, parent_path) VALUES(732, 'this()', '/OCA Exam Objectives/L''h??ritage en Java/Utiliser super et this pour acc??der aux champs et constructeurs/');
INSERT INTO chapter (id, name, parent_path) VALUES(495, 'Topologie des variables', '/OCA Exam Objectives/');
INSERT INTO chapter (id, name, parent_path) VALUES(337, 'Trasforme un chemin relatif vers un chemin absolu avec normalize() ', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Interactions entre Paths et Files/L''object Path/');
INSERT INTO chapter (id, name, parent_path) VALUES(778, 'Travailler avec les branches', '/Modifier un projet/');
INSERT INTO chapter (id, name, parent_path) VALUES(283, 'Trier les ??l??ments d''un stream avec la m??thode sorted()', '/OCP Exam Objectives/API Stream de Java/Utiliser les op??rations interm??diaires/');
INSERT INTO chapter (id, name, parent_path) VALUES(229, 'Trier une liste', '/OCP Exam Objectives/G??n??ricit?? et Collections/Utiliser les interfaces de comparaison/');
INSERT INTO chapter (id, name, parent_path) VALUES(718, 'try-catch', '/OCA Exam Objectives/Les exceptions/Conna??tre les effets de try-catch et l''impact sur le flux du programme/');
INSERT INTO chapter (id, name, parent_path) VALUES(468, 'Type de ResultSet', '/OCP Exam Objectives/Construire des applications de BDD avec JDBC/Les interfaces JDBC, leur utilit??s et relations/ResultSet/');
INSERT INTO chapter (id, name, parent_path) VALUES(558, 'Type de retour', '/OCA Exam Objectives/Les m??thodes et l''encapsulation/Cr??er les m??thodes/');
INSERT INTO chapter (id, name, parent_path) VALUES(497, 'Types r??f??rences', '/OCA Exam Objectives/');
INSERT INTO chapter (id, name, parent_path) VALUES(226, 'UnaryOperator et BinaryOperator', '/OCP Exam Objectives/Interfaces fonctionnelles int??gr??es ?? Java/Utiliser les interfaces int??gr??es dans le package java.util.fonction/');
INSERT INTO chapter (id, name, parent_path) VALUES(715, 'Unchecked exceptions', '/OCA Exam Objectives/Les exceptions/Conna??tre les diff??rents types d''exceptions/');
INSERT INTO chapter (id, name, parent_path) VALUES(79, 'UNDERSTAND "IF" AND "SWITCH" DECISION CONTROL STATEMENTS', '/OCA EXAM ESSENTIALS/CHAPITRE 2 : OPERATORS AND STATEMENTS/');
INSERT INTO chapter (id, name, parent_path) VALUES(81, 'UNDERSTAND HOW "BREAK" AND "CONTINUE" CAN CHANGE FLOW CONTROL', '/OCA EXAM ESSENTIALS/CHAPITRE 2 : OPERATORS AND STATEMENTS/');
INSERT INTO chapter (id, name, parent_path) VALUES(77, 'UNDERSTAND JAVA OPERATOR PRECEDENCE', '/OCA EXAM ESSENTIALS/CHAPITRE 2 : OPERATORS AND STATEMENTS/');
INSERT INTO chapter (id, name, parent_path) VALUES(80, 'UNDERSTAND LOOP STATEMENTS', '/OCA EXAM ESSENTIALS/CHAPITRE 2 : OPERATORS AND STATEMENTS/');
INSERT INTO chapter (id, name, parent_path) VALUES(105, 'UNDERSTAND POLYMORPHISM', '/OCA EXAM ESSENTIALS/CHAPITRE 5 : CLASS DESIGN/');
INSERT INTO chapter (id, name, parent_path) VALUES(85, 'UNDERSTAND THE DIFFERENCE BETWEEN "==" AND "EQUALS"', '/OCA EXAM ESSENTIALS/CHAPITRE 3: CORE JAVA APIs/');
INSERT INTO chapter (id, name, parent_path) VALUES(67, 'UNDERSTAND THE EFFECT OF USING PACKAGES AND IMPORTS', '/OCA EXAM ESSENTIALS/');
INSERT INTO chapter (id, name, parent_path) VALUES(109, 'UNDERSTAND THE FLOW OF A "TRY" STATEMENT', '/OCA EXAM ESSENTIALS/CHAPITRE 6 : EXCEPTIONS/');
INSERT INTO chapter (id, name, parent_path) VALUES(100, 'UNDERSTAND THE RULES FOR HIDING METHODS AND VARIABLES', '/OCA EXAM ESSENTIALS/CHAPITRE 5 : CLASS DESIGN/');
INSERT INTO chapter (id, name, parent_path) VALUES(99, 'UNDERSTAND THE RULES FOR METHOD OVERRIDING', '/OCA EXAM ESSENTIALS/CHAPITRE 5 : CLASS DESIGN/');
INSERT INTO chapter (id, name, parent_path) VALUES(122, 'UNDERSTANDING DEFAULT INITIALIZATION OF VARIABLES', '/OCA/CH 1 Java Building Blocks/');
INSERT INTO chapter (id, name, parent_path) VALUES(117, 'UNDERSTANDING PACKAGE DECLARATIONS AND IMPORTS', '/OCA/CH 1 Java Building Blocks/');
INSERT INTO chapter (id, name, parent_path) VALUES(123, 'UNDERSTANDING VARIABLE SCOPE', '/OCA/CH 1 Java Building Blocks/');
INSERT INTO chapter (id, name, parent_path) VALUES(31, 'Unit Testing', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(436, 'Utilisation', '/OCP Exam Objectives/Concurrence en Java/Les streams parall??les/Ex??cuter des t??ches en parall??le/');
INSERT INTO chapter (id, name, parent_path) VALUES(634, 'Utilisation des varargs', '/OCA Exam Objectives/Les Arrays en Java/Ma??triser les Varargs/');
INSERT INTO chapter (id, name, parent_path) VALUES(264, 'Utiliser collect() ', '/OCP Exam Objectives/API Stream de Java/Utiliser les op??rations terminales/Cr??er une collection ?? partir d''un stream avec la m??thode collect()/');
INSERT INTO chapter (id, name, parent_path) VALUES(266, 'Utiliser collect() avec les Collectors', '/OCP Exam Objectives/API Stream de Java/Utiliser les op??rations terminales/Cr??er une collection ?? partir d''un stream avec la m??thode collect()/');
INSERT INTO chapter (id, name, parent_path) VALUES(211, 'Utiliser des variables dans les Lambdas', '/OCP Exam Objectives/Interfaces fonctionnelles int??gr??es ?? Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(477, 'Utiliser Fork-Join avec la classe RecursiveAction', '/OCP Exam Objectives/Concurrence en Java/Gestion des processus simultan??s/Le framework Fork-Join/');
INSERT INTO chapter (id, name, parent_path) VALUES(478, 'Utiliser Fork-Join avec la classe RecursiveTask', '/OCP Exam Objectives/Concurrence en Java/Gestion des processus simultan??s/Le framework Fork-Join/');
INSERT INTO chapter (id, name, parent_path) VALUES(409, 'Utiliser Future pour obtenir les r??sultats d''un thread', '/OCP Exam Objectives/Concurrence en Java/Cr??er des threads de travail pour ??xecuter des t??ches de mani??re concurrente/Le ExecutorService/');
INSERT INTO chapter (id, name, parent_path) VALUES(284, 'Utiliser l''API Date-Time de Java SE 8', '/OCP Exam Objectives/');
INSERT INTO chapter (id, name, parent_path) VALUES(257, 'Utiliser l''instruction try-with-resources', '/OCP Exam Objectives/Exceptions et Assertions/');
INSERT INTO chapter (id, name, parent_path) VALUES(227, 'Utiliser l''interface java.lang.Comparable', '/OCP Exam Objectives/G??n??ricit?? et Collections/Utiliser les interfaces de comparaison/');
INSERT INTO chapter (id, name, parent_path) VALUES(228, 'Utiliser l''interface java.lang.Comparator', '/OCP Exam Objectives/G??n??ricit?? et Collections/Utiliser les interfaces de comparaison/');
INSERT INTO chapter (id, name, parent_path) VALUES(314, 'Utiliser l''interface Path pour faire des op??rations sur les chemins de fichiers et de r??pertoires', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/');
INSERT INTO chapter (id, name, parent_path) VALUES(311, 'Utiliser l''objet File', '/OCP Exam Objectives/Les fondamentaux de Java IO/Conceptualiser le syst??me de fichier avec l''objet File/');
INSERT INTO chapter (id, name, parent_path) VALUES(617, 'Utiliser l''op??rateur ==', '/OCA Exam Objectives/Utiliser les op??rateurs/Tester l''??galit?? /');
INSERT INTO chapter (id, name, parent_path) VALUES(180, 'Utiliser l''op??rateur instanceOf', '/OCP Exam Objectives/Conception de Classes Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(253, 'Utiliser la clause multi-catch', '/OCP Exam Objectives/Exceptions et Assertions/');
INSERT INTO chapter (id, name, parent_path) VALUES(618, 'Utiliser la m??thode equals()', '/OCA Exam Objectives/Utiliser les op??rateurs/Tester l''??galit?? /');
INSERT INTO chapter (id, name, parent_path) VALUES(476, 'Utiliser la r??cursivit?? avec le framework Fork-Join', '/OCP Exam Objectives/Concurrence en Java/Gestion des processus simultan??s/Le framework Fork-Join/');
INSERT INTO chapter (id, name, parent_path) VALUES(277, 'Utiliser les assertions', '/OCP Exam Objectives/Exceptions et Assertions/Tester l''invariance avec les assertions/');
INSERT INTO chapter (id, name, parent_path) VALUES(648, 'Utiliser les boucles', '/OCA Exam Objectives/Les structures de contr??le/');
INSERT INTO chapter (id, name, parent_path) VALUES(357, 'Utiliser les classes BufferedInputStream et BufferedOutputStream', '/OCP Exam Objectives/Les fondamentaux de Java IO/Lire et ??crire des donn??es/Les Classes de Stream/');
INSERT INTO chapter (id, name, parent_path) VALUES(354, 'Utiliser les classes FileInputStream et FileOutputStream', '/OCP Exam Objectives/Les fondamentaux de Java IO/Lire et ??crire des donn??es/Les Classes de Stream/');
INSERT INTO chapter (id, name, parent_path) VALUES(366, 'Utiliser les classes FileReader et FileWriter et les classes de Buffer associ??es', '/OCP Exam Objectives/Les fondamentaux de Java IO/Lire et ??crire des donn??es/Les Classes de Stream/');
INSERT INTO chapter (id, name, parent_path) VALUES(294, 'Utiliser les Durations', '/OCP Exam Objectives/Utiliser l''API Date-Time de Java SE 8/');
INSERT INTO chapter (id, name, parent_path) VALUES(295, 'Utiliser les Instants', '/OCP Exam Objectives/Utiliser l''API Date-Time de Java SE 8/');
INSERT INTO chapter (id, name, parent_path) VALUES(225, 'Utiliser les interfaces de comparaison', '/OCP Exam Objectives/G??n??ricit?? et Collections/');
INSERT INTO chapter (id, name, parent_path) VALUES(199, 'Utiliser les interfaces fonctionnelles avec les Lambda', '/OCP Exam Objectives/Conception avanc??e de Classes Java/Cr??er et utiliser des interfaces fonctionnelles avec des Lambda/');
INSERT INTO chapter (id, name, parent_path) VALUES(215, 'Utiliser les interfaces int??gr??es dans le package java.util.fonction', '/OCP Exam Objectives/Interfaces fonctionnelles int??gr??es ?? Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(391, 'Utiliser les m??thodes format() et print()', '/OCP Exam Objectives/Les fondamentaux de Java IO/Lire et ??crire des donn??es/Formatter des repr??sentations d''objets avec les classes PrintStream et PrintWriter/');
INSERT INTO chapter (id, name, parent_path) VALUES(387, 'Utiliser les m??thodes print() et println()', '/OCP Exam Objectives/Les fondamentaux de Java IO/Lire et ??crire des donn??es/Formatter des repr??sentations d''objets avec les classes PrintStream et PrintWriter/');
INSERT INTO chapter (id, name, parent_path) VALUES(176, 'Utiliser les modificateurs de visibilit??', '/OCP Exam Objectives/Conception de Classes Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(746, 'Utiliser les mots-cl?? throw et throws', '/OCA Exam Objectives/Les exceptions/Conna??tre les effets de try-catch et l''impact sur le flux du programme/');
INSERT INTO chapter (id, name, parent_path) VALUES(502, 'Utiliser les op??rateurs', '/OCA Exam Objectives/');
INSERT INTO chapter (id, name, parent_path) VALUES(250, 'Utiliser les op??rations interm??diaires', '/OCP Exam Objectives/API Stream de Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(247, 'Utiliser les op??rations sources', '/OCP Exam Objectives/API Stream de Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(248, 'Utiliser les op??rations terminales', '/OCP Exam Objectives/API Stream de Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(616, 'utiliser les parenth??ses pour r????crire l''ordre d''execution des op??rations', '/OCA Exam Objectives/Utiliser les op??rateurs/Ma??triser l''ordre des op??rations/');
INSERT INTO chapter (id, name, parent_path) VALUES(293, 'Utiliser les Period', '/OCP Exam Objectives/Utiliser l''API Date-Time de Java SE 8/');
INSERT INTO chapter (id, name, parent_path) VALUES(236, 'Utiliser les r??f??rences de m??thodes', '/OCP Exam Objectives/G??n??ricit?? et Collections/');
INSERT INTO chapter (id, name, parent_path) VALUES(655, 'Utiliser les structures de contr??les avanc??es', '/OCA Exam Objectives/Les structures de contr??le/');
INSERT INTO chapter (id, name, parent_path) VALUES(194, 'Utiliser les types ??num??r??s avec m??thodes et constructeurs', '/OCP Exam Objectives/Conception avanc??e de Classes Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(728, 'Utiliser super et this pour acc??der aux champs et constructeurs', '/OCA Exam Objectives/L''h??ritage en Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(564, 'Utiliser un champ statique', '/OCA Exam Objectives/Les m??thodes et l''encapsulation/Appliquer le mot cl?? static /');
INSERT INTO chapter (id, name, parent_path) VALUES(404, 'Utiliser un thread Executor simple', '/OCP Exam Objectives/Concurrence en Java/Cr??er des threads de travail pour ??xecuter des t??ches de mani??re concurrente/Le ExecutorService/Les threads Executor simples/');
INSERT INTO chapter (id, name, parent_path) VALUES(650, 'Utiliser une structure switch', '/OCA Exam Objectives/Les structures de contr??le/');
INSERT INTO chapter (id, name, parent_path) VALUES(774, 'Valider mes modifications - git commit', '/Modifier un projet/');
INSERT INTO chapter (id, name, parent_path) VALUES(340, 'V??rifier l''existence d''un chemin avec la m??thode exists()', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Interactions entre Paths et Files/L''object Path/');
INSERT INTO chapter (id, name, parent_path) VALUES(338, 'V??rifier l''existence d''un fichier avec la m??thode toRealPath()', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Interactions entre Paths et Files/L''object Path/');
INSERT INTO chapter (id, name, parent_path) VALUES(360, 'V??rifier la visibilit?? dd''un fichier avec la m??thode isHidden()', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Comprendre les attributs de fichier (metadata)/');
INSERT INTO chapter (id, name, parent_path) VALUES(331, 'V??rifier le type de chemin avec les m??thode isAbsolute() et toAbsolutePath()', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Interactions entre Paths et Files/L''object Path/');
INSERT INTO chapter (id, name, parent_path) VALUES(341, 'V??rifier si deux chemins pointent vers le m??me fichier avec isSameFile()', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Interactions entre Paths et Files/L''object Path/');
INSERT INTO chapter (id, name, parent_path) VALUES(319, 'Via la class FileSystem', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/La classe Path/Cr??er un objet Path/');
INSERT INTO chapter (id, name, parent_path) VALUES(318, 'Via la m??thode get()', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/La classe Path/Cr??er un objet Path/');
INSERT INTO chapter (id, name, parent_path) VALUES(329, 'Visionner le chemin racine avec getRoot()', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Interactions entre Paths et Files/L''object Path/');
INSERT INTO chapter (id, name, parent_path) VALUES(326, 'Visionner le nom du fichier avec la m??thode getFileName()', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Interactions entre Paths et Files/L''object Path/');
INSERT INTO chapter (id, name, parent_path) VALUES(324, 'Visionner le path avec les m??thodes toString(), getNameCount() et getName()', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Interactions entre Paths et Files/L''object Path/');
INSERT INTO chapter (id, name, parent_path) VALUES(327, 'Visionner les chemins parent avec getParent()', '/OCP Exam Objectives/Java I-O de fichiers (NIO.2)/Interactions entre Paths et Files/L''object Path/');
INSERT INTO chapter (id, name, parent_path) VALUES(771, 'Voir mes modifications', '/Modifier un projet/');
INSERT INTO chapter (id, name, parent_path) VALUES(842, 'Vue.JS version 3', '/');
INSERT INTO chapter (id, name, parent_path) VALUES(849, 'VueX en pratique', '/Introduction ?? VueX/');
INSERT INTO chapter (id, name, parent_path) VALUES(127, 'WILDCARDS', '/OCA/CH 1 Java Building Blocks/UNDERSTANDING PACKAGE DECLARATIONS AND IMPORTS/');
INSERT INTO chapter (id, name, parent_path) VALUES(205, 'Wildcards', '/OCP Exam Objectives/G??n??ricit?? et Collections/Cr??er et utiliser une classe g??n??rique/');
INSERT INTO chapter (id, name, parent_path) VALUES(758, 'Windows', '/Les bases/Comment installer Git/');
INSERT INTO chapter (id, name, parent_path) VALUES(645, 'Wrapper Classes', '/OCA Exam Objectives/Les API de base de Java/');
INSERT INTO chapter (id, name, parent_path) VALUES(96, 'WRITE SIMPLE LAMBDA EXPRESSIONS', '/OCA EXAM ESSENTIALS/CHAPITRE 4 : METHODS AND ENCAPSULATION/');
INSERT INTO chapter (id, name, parent_path) VALUES(116, 'WRITING A "MAIN()" METHOD', '/OCA/CH 1 Java Building Blocks/');

INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (314,'OCA - Chapter 2 - Derni??re question','Sens tu &agrave; l&#39;aise avec ce chapitre ?',59),
	 (364,'OCA Final Exam - 1','<p>What is the output if this class is run with java Indexing cars carts?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">public class Indexing { 
	public static void main(String... books) { 
		StringBuilder sb = new StringBuilder(); 
		for (String book : books) 
			sb.insert(sb.indexOf("c"), book); 
		System.out.println(sb); 
	} 
}</code></pre>',5),
	 (365,'OCA Final Exam - 2','Fill in the blanks: The operators +=,__________ ,__________ ,__________ ,__________ , and ++ are listed in increasing or the same level of operator precedence. (Choose two.)',5),
	 (366,'OCA Final Exam - 3','<p>Which of the following are valid JavaBean signatures? (Choose three.)</p>',5),
	 (367,'OCA Final Exam - 4','<p>Which of the following are true? (Choose two.)&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">20: int[] crossword [] = new int[10][20]; 
21: for (int i = 0; i &lt; crossword.length; i++) 
22: for (int j = 0; j &lt; crossword.length; j++) 
23: crossword[i][j] = ''x''; 
24: System.out.println(crossword.size());</code></pre>',5),
	 (368,'OCA Final Exam - 5','<p>Which of the following statements about java.lang.Error are most accurate? (Choose two.)</p>',5),
	 (369,'OCA Final Exam - 6','<p>Given a class that uses the following import statements, which class would be automatically accessible without using its full package name? (Choose three.)&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">import forest.Bird; 
import jungle.tree.*; 
import savana.*;</code></pre>',5),
	 (370,'OCA Final Exam - 7','<p>How many of the following variables represent immutable objects?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">ArrayList l = new ArrayList(); 
String s = new String(); 
StringBuilder sb = new StringBuilder(); 
LocalDateTime t = LocalDateTime.now();</code></pre>',5),
	 (371,'OCA Final Exam - 8','<p>What is the output of the following?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">StringBuilder builder = new StringBuilder("Leaves growing"); 
do { builder.delete(0, 5); } 
while (builder.length() &gt; 5); 
System.out.println(builder);</code></pre>',5),
	 (372,'OCA Final Exam - 9','<p>What is the output of the following application?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package reality; 
public class Equivalency { 
	public static void main(String[] edges) { 
		final String ceiling = "up"; 
		String floor = new String("up"); 
		final String wall = new String(floor); 
		System.out.print((ceiling==wall) +" "+(floor==wall) +" "+ceiling.equals(wall)); 
	} 
}</code></pre>',5);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (373,'OCA Final Exam - 10','<p>How many times does the following code print true?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">1: public class Giggles { 
2: public static void main(String[] args) { 
3: String lol = "lol"; 
4: System.out.println(lol.toUpperCase() == lol); 
5: System.out.println(lol.toUpperCase() == lol.toUpperCase()); 
6: System.out.println(lol.toUpperCase().equals(lol)); 
7: System.out.println(lol.toUpperCase().equals(lol.toUpperCase())); 
8: System.out.println(lol.toUpperCase().equalsIgnoreCase(lol)); 
9: System.out.println(lol.toUpperCase() 
10: .equalsIgnoreCase(lol.toUpperCase())); 
11: } }</code></pre>',5),
	 (374,'OCA Final Exam - 11','<p>Which lines can be removed together without stopping the code from compiling and while printing the same output? (Choose three.)&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">14: String race = ""; 
15: outer: 
16: do { 
17: inner: 
18: do { 
19: race += "x"; 
20: } while (race.length() &lt;= 4); 
21: } while (race.length() &lt; 4); 
22: System.out.println(race);</code></pre>',5),
	 (375,'OCA Final Exam - 12','<p>Which of the following do not compile when filling in the blank? (Choose two.)&nbsp;</p><p>&nbsp;</p><p>long bigNum = ____________;</p>',5),
	 (376,'OCA Final Exam - 13','<p>How many lines does this program print?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">import java.time.*; 
public class OnePlusOne { 
	public static void main(String... nums) { 
		LocalTime time = LocalTime.of(1, 11); 
		while (time.getHour() &lt; 1) { 
			time.plusHours(1); 
			System.out.println("in loop"); 
		} 
	} 
}</code></pre>',5),
	 (377,'OCA Final Exam - 14','<p>What is the result of running the following program?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">1: package fun; 
2: public class Sudoku { 
3: static int[][] game; 
4: 
5: public static void main(String args[]) { 
6: game[3][3] = 6; 
7: Object[] obj = game; 
8: obj[3] = ''X''; 
9: System.out.println(game[3][3]); 
10: } 
11: }</code></pre>',5),
	 (378,'OCA Final Exam - 15','<p>Which of the following use generics and compile without warnings? (Choose two.)</p>',5),
	 (379,'OCA Final Exam - 16','<p>Which of the following are true right before the main() method ends? (Choose two.)</p><p>&nbsp;</p><pre><code class="language-java">public static void main(String[] args) { 
	String shoe1 = new String("sandal"); 
	String shoe2 = new String("flip flop"); 
	String shoe3 = new String("croc"); 
	shoe1 = shoe2; 
	shoe2 = shoe3; 
	shoe3 = shoe1; 
}</code></pre>',5),
	 (380,'OCA Final Exam - 17','<p>How many lines of the following application do not compile?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package ocean; 
class BubbleException extends Exception {} 
class Fish { 
	Fish getFish() throws BubbleException { 
		throw new RuntimeException("fish!"); 
	} 
} 
public final class Clownfish extends Fish { 
	public final Clownfish getFish() { 
		throw new RuntimeException("clown!"); 
	} 
	public static void main(String[] bubbles) { 
		final Fish f = new Clownfish(); 
		f.getFish(); 
		System.out.println("swim!"); 
	} 
}</code></pre>',5),
	 (381,'OCA Final Exam - 18','<p>How many lines does this code output?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">import java.util.*; 
import java.util.function.*; 
public class PrintNegative { 
	public static void main(String[] args) { 
		List list= new ArrayList&lt;&gt;(); 
		list.add(-5); 
		list.add(0); 
		list.add(5); 
		print(list, e -&gt; e &lt; 0); 
	} 
	public static void print(List list, Predicate p) { 
		for (Integer num : list) 
			if (p.test(num)) 
				System.out.println(num); 
	} 
}</code></pre>',5),
	 (382,'OCA Final Exam - 19','<p>Which keywords are required with a try statement?&nbsp;</p><p>&nbsp;</p><p>I. finalize&nbsp;</p><p>II. catch&nbsp;</p><p>III. throws&nbsp;</p><p>IV. finally</p>',5);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (383,'OCA Final Exam - 20','<p>What is the output of the following?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">12: int result = 8; 
13: loop: while (result &gt; 7) { 
14: result++; 
15: do { 
16: result--; 
17: } while (result &gt; 5); 
18: break loop; 
19: } 
20: System.out.println(result);</code></pre>',5),
	 (384,'OCA Final Exam - 21','<p>What is the result of compiling and executing the following application?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package reptile; 
public class Alligator { 
	static int teeth; 
	double scaleToughness; 
	public Alligator() { teeth++; } 
	public void snap(int teeth) { 
		System.out.print(teeth+" "); 
		teeth--; 
	} 
	public static void main(String[] unused) { 
		new Alligator().snap(teeth); 
		new Alligator().snap(teeth); 
	} 
}</code></pre>',5),
	 (385,'OCA Final Exam - 22','<p>What is the output of the following?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">public class Costume { 
	public static void main(String[] black) { 
		String witch = "b"; 
		String tail = "lack"; 
		witch.concat(tail); 
		System.out.println(witch); 
	} 
}</code></pre>',5),
	 (386,'OCA Final Exam - 23','<p>Which modifiers can be independently applied to an interface method? (Choose three.)</p>',5),
	 (387,'OCA Final Exam - 24','<p>What is the output of the following?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">public class Shoelaces { 
	public static void main(String[] args) { 
		String tie = null; 
		while (tie = null) 
			tie = "shoelace"; 
		System.out.print(tie); 
	} 
}</code></pre>',5),
	 (388,'OCA Final Exam - 25','<p>What statements are true about compiling a Java class file? (Choose two.)</p>',5),
	 (389,'OCA Final Exam - 26','<p>What is the output of the following application?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package woods; 
interface Plant { 
	default String grow() { 
		return "Grow!"; 
	} 
} 
interface Living { 
	public default String grow() { 
		return "Growing!"; 
	} 
} 
public class Tree implements Plant, Living { // m1 
	public String grow(int height) { 
		return "Super Growing!"; 
	} 
	public static void main(String[] leaves) { 
		Plant p = new Tree(); // m2 
		System.out.print(((Living)p).grow()); // m3 
	} 
}</code></pre>',5),
	 (390,'OCA Final Exam - 27','<p>What is the result of the following?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">public static void main(String... args) { 
	String name = "Desiree"; 
	int _number = 694; 
	boolean profit$$$; 
	System.out.println(name + " won. " + _number + " profit? " + profit$$$); 
}</code></pre>',5),
	 (391,'OCA Final Exam - 28','<p>Fill in the blanks: Given a variable x, __________ decreases the value of x by 1 and returns the original value, while __________ increases the value of x by 1 and returns the new value.</p>',5),
	 (392,'OCA Final Exam - 29','<p>Given the following two classes in the same package, which constructors contain compiler errors? (Choose three.)</p><p>&nbsp;</p><pre><code class="language-java">public class Big { 
	public Big(boolean stillIn) { 
		super(); 
	} 
} 
public class Trouble extends Big { 
	public Trouble() {} 
	public Trouble(int deep) { 
		super(false); 
		this(); 
	} 
	public Trouble(String now, int... deep) { 
		this(3); 
	} 
	public Trouble(long deep) { 
		this("check",deep); 
	} 
	public Trouble(double test) { 
		super(test&gt;5 ? true : false); 
	} 
}</code></pre>',5);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (393,'OCA Final Exam - 30','<p>Which of the following can replace the comment so this code outputs 100? (Choose two.)&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">public class Stats { 
	// INSERT CODE 
	public static void main(String[] math) { 
		System.out.println(max - min); 
	} 
}</code></pre>',5),
	 (394,'OCA Final Exam - 31','<p>Which of the following statements are true about Java operators and statements? (Choose two.)</p>',5),
	 (395,'OCA Final Exam - 32','<p>What is the output of the following?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">1: public class Legos { 
2: 	public static void main(String[] args) { 
3: 		StringBuilder sb = new StringBuilder(); 
4: 		sb.append("red"); 
5: 		sb.deleteCharAt(0); 
6: 		sb.delete(1, 1); 
7: 		System.out.println(sb); 
8: 	} 
9: }</code></pre>',5),
	 (396,'OCA Final Exam - 33','<p>Which of the following is a valid method name in Java? (Choose two.)</p>',5),
	 (397,'OCA Final Exam - 34','<p>Which of the following statements about inheritance are true? (Choose two.)</p>',5),
	 (398,'OCA Final Exam - 35','<p>Which of the following statements about Java are true?&nbsp;</p><p>I. The java command uses . to separate packages.&nbsp;</p><p>II. Java supports functional programming.&nbsp;</p><p>III. Java is object oriented.&nbsp;</p><p>IV. Java supports polymorphism.</p>',5),
	 (399,'OCA Final Exam - 36','<p>What is the output of the following?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">String[][] listing = new String[][] { { "Book", "34.99" }, { "Game", "29.99" }, { "Pen", ".99" } }; 
System.out.println(listing.length + " " + listing[0].length);</code></pre>',5),
	 (400,'OCA Final Exam - 37','<p>Which of the following variable types is permitted in a switch statement? (Choose three.)</p>',5),
	 (401,'OCA Final Exam - 38','<p>What does the following do?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">public class Shoot { 
	interface Target { 
		boolean needToAim(double angle); 
	} 
	static void prepare(double angle, Target t) { 
		boolean ready = t.needToAim(angle); // k1 
		System.out.println(ready); 
	} 
	public static void main(String[] args) { 
		prepare(45, d =&gt; d &gt; 5 || d &lt; -5); // k2 
	} 
}</code></pre>',5),
	 (402,'OCA Final Exam - 39','<p>Which of the following is a valid code comment in Java? (Choose three.)</p>',5);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (403,'OCA Final Exam - 40','<p>Given the following two classes, each in a different package, which lines allow the second class to compile when inserted independently? (Choose two.)&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package food; 
public class Grass { 
	public static int seeds = 10; 
	public static Grass getGrass() {return new Grass();} 
} 
package woods; 
// INSERT CODE HERE 
public class Deer { 
	public void eat() { 
		getGrass(); 
		System.out.print(seeds); 
	} 
}</code></pre>',5),
	 (404,'OCA Final Exam - 41','<p>What is the result of the following?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">import java.util.*; 
public class Museums { 
	public static void main(String[] args) { 
		String[] array = {"Natural History", "Science", "Art"}; 
		List museums = Arrays.asList(array); 
		museums.remove(2); 
		System.out.println(museums); 
	} 
}</code></pre>',5),
	 (405,'OCA Final Exam - 42','<p>Which of the following substitutions will compile? (Choose two.)&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">public class Underscores { 
	public String name = "Sherrin"; 
	public void massage() { int zip = 10017; } 
}</code></pre>',5),
	 (406,'OCA Final Exam - 43','<p>What is the result of the following when called as java counting.Binary?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package counting; 
import java.util.*; 
public class Binary { 
	public static void main(String[] args) { 
		args = new String[] {"0", "1", "01", "10" }; 
		Arrays.sort(args); 
		System.out.println(Arrays.toString(args)); 
	} 
}</code></pre>',5),
	 (407,'OCA Final Exam - 44','<p>Fill in the blanks: Using the _____________ and _____________ modifiers together allows a variable to be accessed from any class, without requiring an instance variable.</p>',5),
	 (408,'OCA Final Exam - 45','<p>How many lines does the following code output?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">import java.util.*; 
public class Exams { 
	public static void main(String[] args) { 
		List exams = Arrays.asList("OCA", "OCP"); 
		for (String e1 : exams) 
			for (String e2 : exams) 
				System.out.print(e1 + " " + e2); 
			System.out.println(); 
	} 
}</code></pre>',5),
	 (409,'OCA Final Exam - 46','<p>Which of the following are true statements? (Choose two.)</p>',5),
	 (410,'OCA Final Exam - 47','<p>How many of the following lines of code compile?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">char one = Integer.parseInt("1"); 
Character two = Integer.parseInt("2"); 
int three = Integer.parseInt("3"); 
Integer four = Integer.parseInt("4");
short five = Integer.parseInt("5"); 
Short six = Integer.parseInt("6");</code></pre>',5),
	 (411,'OCA Final Exam - 48','<p>Given the application below, what data types can be inserted into the blank that would allow the code to print 3? (Choose three.)&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">public class Highway { 
	public int drive(long car) { 
		return 2; 
	} 
	public int drive(double car) { 
		return 3; 
	} 
	public int drive(int car) { 
		return 5; 
	} 
	public int drive(short car) { 
		return 3; 
	} 
	public static void main(String[] gears) { 
		____________ value = 5; 
		System.out.print(new Highway().drive(value)); 
	} 
}</code></pre>',5),
	 (412,'OCA Final Exam - 49','<p>How many times does this code print true?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">import java.time.*; 
public class Equality { 
	public void main(String[] args) { 
		System.out.println(new StringBuilder("zelda") == new StringBuilder("zelda")); 
		System.out.println(3 == 3); 
		System.out.println("bart" == "bart"); 
		System.out.println(new int[0] == new int[0]); 
		System.out.println(LocalTime.now() == LocalTime.now()); 
	} 
}</code></pre>',5);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (413,'OCA Final Exam - 50','<p>What is the output of the following application?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package ballroom; 
public class Dance { 
	public static void swing(int... beats) throws ClassCastException { 
		try { 
			System.out.print("1"+beats[2]); // p1 
		} catch (RuntimeException e) { 
			System.out.print("2"); 
		} catch (Exception e) { 
			System.out.print("3"); 
		} finally { 
			System.out.print("4"); 
		} 
	} 
	public static void main(String... music) { 
		new Dance().swing(0,0); // p2 
		System.out.print("5"); 
	} 
}</code></pre>',5),
	 (414,'OCA Final Exam - 51','<p>What is the output of the following?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">List drinks = Arrays.asList("can", "cup"); 
for (int container = drinks.size(); container &gt; 0; container++) { 
	System.out.print(drinks.get(container-1) + ","); 
}</code></pre>',5),
	 (415,'OCA Final Exam - 52','<p>Which of the following method signatures are valid declarations of an entry point in a Java application? (Choose three.)</p>',5),
	 (416,'OCA Final Exam - 53','<p>Given the application below and the choices available, which lines must all be removed to allow the code to compile? (Choose three.)&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">1: package year; 
2: public class Seasons { 
3: public static void main(String[] time) { 
4: final long winter = 10; 
5: final byte season = 2; 
6: int fall = 4; 
7: final short summer = 3; 
8: switch(season) { 
9: case 1: 
10: case winter: System.out.print("winter"); 
11: default: 
12: case fall: System.out.print("fall"); 
13: case summer: System.out.print("summer"); 
14: default: 
15: } 
16: } 
17: }</code></pre>',5),
	 (417,'OCA Final Exam - 54','<p>Given the application below, which lines do not compile? (Choose three.)&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package furryfriends; 
interface Friend { 
	protected String getName(); // h1 
} 
class Cat implements Friend { 
	String getName() { // h2 
		return "Kitty"; 
	} 
} 
public class Dog implements Friend { 
	String getName() throws RuntimeException { // h3 
		return "Doggy"; 
	} 
	public static void main(String[] adoption) { 
		Friend friend = new Dog(); // h4 
		System.out.print(((Cat)friend).getName()); // h5 
		System.out.print(((Dog)null).getName()); // h6 
	} 
}</code></pre>',5),
	 (418,'OCA Final Exam - 55','<p>Which of the following are unchecked exceptions? (Choose three.)</p>',5),
	 (419,'OCA Final Exam - 56','<p>What is the result of compiling and executing the following application?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package ranch; 
public class Cowboy { 
	private int space = 5; 
	private double ship = space &lt; 2 ? 1 : 10; // g1 
	public void printMessage() { 
		if(ship&gt;1) { 
			System.out.println("Goodbye"); 
		} 
		if(ship&lt;10 &amp;&amp; space&gt;=2) System.out.println("Hello"); // g2 
		else System.out.println("See you again"); 
	} 
	public static final void main(String... stars) { 
		new Cowboy().printMessage(); 
	} 
}</code></pre>',5),
	 (420,'OCA Final Exam - 57','<p>Given the following three class declarations, which sets of access modifiers can be inserted, in order, into the blank lines below that would allow all of the classes to compile? (Choose three.)&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package wake; 
public class Alarm { 
	____________static int clock; 
	____________long getTime() {return clock;} 
} 
package wake; 
public class Coffee { 
	private boolean bringCoffee() { 
		return new Alarm().clock&lt;10;
	} 
} 
package sleep; 
public class Snooze extends wake.Alarm { 
	private boolean checkTime() { 
		return getTime()&gt;10;
	} 
}</code></pre>',5),
	 (421,'OCA Final Exam - 58','<p>Given that FileNotFoundException is a subclass of IOException and Long is a subclass of Number, what is the output of the following application?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package materials; 
import java.io.*; 
class CarbonStructure { 
	protected long count; 
	public abstract Number getCount() throws IOException; // q1 
	public CarbonStructure(int count) { 
		this.count = count; 
	} 
} 
public class Diamond extends CarbonStructure { 
	public Diamond() { 
		super(15); 
	} 
	public Long getCount() throws FileNotFoundException { // q2 
		return count; 
	} 
	public static void main(String[] cost) { 
		try { 
			final CarbonStructure ring = new Diamond(); // q3 
			System.out.print(ring.getCount()); // q4 
		} catch (IOException e) { 
			e.printStackTrace(); 
		} 
	} 
}</code></pre>',5),
	 (422,'OCA Final Exam - 59','<p>How many lines contain a compile error?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">1: import java.time.*; 
2: import java.time.format.*; 
3: 
4: public class HowLong { 
5: public void main(String h) { 
6: LocalDate newYears = new LocalDate(2017, 1, 1); 
7: Period period = Period.ofYears(1).ofDays(1); 
8: DateTimeFormat format = DateTimeFormat.ofPattern("MM-dd-yyyy"); 
9: System.out.print(format.format(newYears.minus(period))); 
10: } 
11: }</code></pre>',5);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (423,'OCA Final Exam - 60','<p>Which of the following statements about try-catch blocks are correct? (Choose two.)</p>',5),
	 (424,'OCA Final Exam - 61','<p>What is printed by the following code snippet?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">int fish = 1 + 2 * 5&gt;=2 ? 4 : 2; 
int mammals = 3 &lt; 3 ? 1 : 5&gt;=5 ? 9 : 7; 
System.out.print(fish+mammals+"");</code></pre>',5),
	 (425,'OCA Final Exam - 62','<p>Which of the following statements about objects, reference types, and casting are correct? (Choose three.)</p>',5),
	 (426,'OCA Final Exam - 63','<p>What is the output of the following when run as java EchoFirst seed flower plant?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package unix; 
import java.util.*; 
public class EchoFirst { 
	public static void main(String[] args) { 
		int result = Arrays.binarySearch(args, args[0]); 
		System.out.println(result); 
	} 
}</code></pre>',5),
	 (427,'OCA Final Exam - 64','<p>How many objects are eligible for garbage collection at the end of the main() method?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package store; 
public class Shoes { 
	static String shoe1 = new String("sandal"); 
	static String shoe2 = new String("flip flop"); 
	public static void shopping() { 
		String shoe3 = new String("croc"); 
		shoe2 = shoe1; shoe1 = shoe3; 
	} 
	public static void main(String... args) { 
		shopping(); 
	} 
}</code></pre>',5),
	 (428,'OCA Final Exam - 65','<p>Fill in the blanks: The ____________keyword is used in method declarations, the ____________keyword is used to guarantee a statement will execute even if an exception is thrown, and the ____________keyword is used to throw an exception to the surrounding process.</p>',5),
	 (429,'OCA Final Exam - 66','<p>Which statements best describe the result of this code? (Choose two.)&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package nyc; 
public class TouristBus { 
	public static void main(String... args) { 
		String[] nycTourLoops = new String[] { "Downtown", "Uptown", "Brooklyn" }; 
		String[] times = new String[] { "Day", "Night" }; 
		for (int i = 0, j = 0; i &lt; nycTourLoops.length; i++, j++) 
			System.out.println(nycTourLoops[i] + " " + times[j]); 
	} 
}</code></pre>',5),
	 (430,'OCA Final Exam - 67','<p>Fill in the blanks: Because of____________ , it is possible to ____________a method, which allows Java to support____________ .</p>',5),
	 (431,'OCA Final Exam - 68','<p>What is the result of the following?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package calendar; 
public class Seasons { 
	public static void seasons(String... names) { 
		int l = names[1].length(); // s1 
		System.out.println(names[l]); // s2 
	} 
	public static void main(String[] args) { 
		seasons("Summer", "Fall", "Winter", "Spring"); 
	} 
}</code></pre>',5),
	 (432,'OCA Final Exam - 69','<p>How many lines of the following application contain compilation errors?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">1: package percussion; 
2: 
3: interface MakesNoise {} 
4: abstract class Instrument implements MakesNoise { 
5: public Instrument(int beats) {} 
6: public void play() {} 
7: } 
8: public class Drum extends Instrument { 
9: public void play(int count) {} 
10: public void concert() { 
11: super.play(5); 
12: } 
13: public static void main(String[] beats) { 
14: MakesNoise mn = new Drum(); 
15: mn.concert(); 
16: } 
17: }</code></pre>',5);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (433,'OCA Final Exam - 70','<p>What is the output of the following application?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package fly; 
public class Helicopter { 
	public int adjustPropellers(int length, String[] type) { 
		length++; 
		type[0] = "LONG"; 
		return length; 
	} 
	public static void main(String[] climb) { 
		final Helicopter h = new Helicopter(); 
		int length = 5; 
		String[] type = new String[1]; 
		length = h.adjustPropellers(length, type); 
		System.out.print(length+","+type[0]); 
	} 
}</code></pre>',5),
	 (434,'OCA Final Exam - 71','<p>How many lines of the following application do not compile?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package castles; 
class OpenDoorException extends Exception {} 
class CableSnapException extends OpenDoorException {} 
public class Palace { 
	public void openDrawbridge() throws Exception { 
		try { 
			throw new Exception("Problem"); 
		} catch (OpenDoorException e) { 
			throw new OpenDoorException(); 
		} catch (CableSnapException ex) { 
			try { 
				throw new OpenDoorException(); 
			} catch (Exception ex) { } 
			finally { 
				System.out.println("Almost done"); 
			} 
		} finally { 
			throw new RuntimeException("Unending problem"); 
		} 
	} 
	public static void main(String[] moat) throws IllegalArgumentException { 
		new Palace().openDrawbridge(); 
	} 
}</code></pre>',5),
	 (435,'OCA Final Exam - 72','<p>Choose the best answer: ____________and ____________are two properties that go hand in hand to improve class design by structuring a class with related attributes and actions while protecting the underlying data from access by other classes</p>',5),
	 (436,'OCA Final Exam - 73','<p>What is the output of the following?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">string bike1 = "speedy"; 
string bike2 = new String("speedy"); 
boolean test1 = bike1 == bike2; 
boolean test2 = bike1.equals(bike2); 
System.out.println(test1 + " " + test2);</code></pre>',5),
	 (437,'OCA Final Exam - 74','<p>What is the output of the following when run as java unix.EchoFirst seed flower plant?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package unix; 
import java.util.*; 
public class EchoFirst { 
	public static void main(String[] args) { 
		Arrays.sort(args); 
		int result = Arrays.binarySearch(args, args[0]); 
		System.out.println(result); 
	} 
}</code></pre>',5),
	 (438,'OCA Final Exam - 75','<p>Which are true statements? (Choose three.)</p>',5),
	 (439,'OCA Final Exam - 76','<p>How many lines does this program print?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">import java.time.*; 
public class OnePlusOne { 
	public static void main(String... nums) { 	
		LocalDate time = LocalDate.of(1, 11); 
		while (time.getHour() &lt; 1) { 
			time.plusHours(1); 
			System.out.println("in loop"); 
		} 
	} 
}</code></pre>',5),
	 (440,'OCA Final Exam - 77','<p>How many objects are eligible for garbage collection immediately before the end of the main() method?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">public class Tennis { 
	public static void main(String[] game) { 
		String[] balls = new String[1]; 
		int[] scores = new int[1]; 
		balls = null; 
		scores = null; 
	} 
}</code></pre>',5),
	 (441,'OCA Final Exam - 78','<p>What is the output of the following?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">14: int count = 0; 
15: LocalDate date = LocalDate.of(2017, Month.JANUARY, 1); 
16: while (date.getMonth() != Month.APRIL) 
17: date = date.minusMonths(1); 
18: count++; 
19: System.out.println(count);</code></pre>',5),
	 (442,'OCA Final Exam - 79','<p>How many lines of the following class do not compile?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">1: package arctic; 
2: abstract class Bear { 
3: protected int sing; 
4: protected abstract int grunt(); 
5: int sing() { 
6: return sing; 
7: } 
8: } 
9: public class PolarBear extends Bear { 
10: int grunt() { 
11: sing() += 10; 
12: return super.grunt()+1; 
13: return 10; 
14: } 
15: }</code></pre>',5);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (443,'OCA Final Exam - 80','<p>In which places is the default keyword permitted to be used? (Choose two.)</p>',5),
	 (447,'OCP - Chapter 11 - 4','<p>What is the output of this code?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">class Laptop extends Computer { 
	public void startup() { 
		System.out.print("laptop-"); 
	} 
} 
public class Computer { 
	public void startup() { 
		System.out.print("computer-"); 
	} 
	public static void main(String[] args) { 
		Computer computer = new Laptop(); 
		Laptop laptop = new Laptop(); 
		computer.startup(); 
		laptop.startup(); 
	} 
}</code></pre>',174),
	 (458,'OCP - Chapter 11 - 15','<p>Which methods compile?&nbsp;</p><pre><code class="language-java">private static int numShovels; 
private int numRakes; 
public int getNumShovels() { 
	return numShovels; 
} 
public int getNumRakes() { 
	return numRakes; 
}</code></pre>',176),
	 (471,'OCP - Chapter 11 - 30','<p>Which variable declaration is the first line not to compile?&nbsp;</p><pre><code class="language-java">30: class Building {} 
31: class House extends Building{} 
32: 
33: public void convert() { 
34:     Building b = new Building(); 
35:     House h = new House(); 
36:     Building bh = new House(); 
37:     House p = (House) b; 
38:     House q = (House) h; 
39:     House r = (House) bh; 
40: }</code></pre>',174),
	 (475,'OCP - Chapter 11 - 34','<p>How many of the following pairs of values can fill in the blanks to comply with the contract of the hashCode() and equals() methods?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">class Sticker { 
    public int hashCode() { 
        return _____________; 
    } 
    public boolean equals(Object o) { 
        return _____________; 
    } 
} 

I. 1, false 
II. 1, true 
III. new Random().nextInt(), false 
IV. new Random().nextInt(), true</code></pre>',196),
	 (483,'OCP - Chapter 13 - Q2','<p>Which method is available on both List and Stream implementations?</p>',248),
	 (507,'OCP - Chapter 13 - Q26','<p>Which type allows inserting a null value?</p>',222),
	 (562,'OCP - Chapter 15 - Q4','<p>How many of the following can fill in the blank to have the code print 44?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">Stream&lt;String&gt; stream = Stream.of("base", "ball"); 
stream._____________(s -&gt; s.length()).forEach(System.out::print);</code></pre><p>&nbsp;</p><p>&nbsp;I. map&nbsp;</p><p>II. mapToInt&nbsp;</p><p>III. mapToObject</p>',289),
	 (592,'OCP - Chapter 15 - Q36','<p>When working with a Stream&lt;String&gt;,, which of these types can be returned from the collect() terminal operator by passing arguments to Collectors.groupingBy()?&nbsp;</p><p>&nbsp;</p><p>I. Map&lt;Integer, List&lt;String&gt;&gt;<br>II. Map&lt;Boolean, HashSet&lt;String&gt;&gt;<br>III. List&lt;String&gt;</p>',270);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (749,'OCP - Chapter 15 - Q40','<p>A developer tries to rewrite a method that uses flatMap() without using that intermediate operator. Which pair of method calls shows the withoutFlatMap() method is not equivalent to the withFlatMap() method?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">public static void main(String[] args) { 
	List list = new LinkedList&lt;&gt;(); 
	Deque queue = new ArrayDeque&lt;&gt;(); 
	queue.push("all queued up"); 
	queue.push("last"); 
} 
private static void withFlatMap(Collection coll) { 
	Stream.of(coll) 
		.flatMap(x -&gt; x.stream()) 
		.forEach(System.out::print); 
	System.out.println(); 
} 
private static void withoutFlatMap(Collection coll) { 
	Stream.of(coll) 
		.filter(x -&gt; !x.isEmpty()) 
		.map(x -&gt; x) 
		.forEach(System.out::print); 
	System.out.println(); 
}</code></pre>',8),
	 (849,'OCP - Chapter 16 - q31','<p>What is the output of the following application?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package vortex;
class TimeException extends Exception {}
class TimeMachine implements AutoCloseable {
    int v;
    public TimeMachine(int v) { this.v = v; }
    public void close() throws Exception {
        System.out.print(v);
    }
}
public class TimeTraveler {
    public static void main(String[] twelve) {
        try (TimeMachine timeSled = new TimeMachine(1);
            TimeMachine delorean = new TimeMachine(2);
            TimeMachine tardis = new TimeMachine(3)) { } catch (TimeException e) {
            System.out.print(4);
        } finally {
            System.out.print(5);
        }
    }
}</code></pre>',263),
	 (870,'OCP - Chapter 17 - Q12','<p>What is the result of running this code?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">12: LocalDate pieDay = LocalDate.of(2017, Month.JANUARY, 23);
13: LocalTime midnight = LocalTime.of(0, 0);
14: LocalDateTime pieTime = LocalDateTime.of(pieDay, midnight);
15: 
16: DateTimeFormatter f = DateTimeFormatter.ofLocalizedDate(FormatStyle.SHORT);
17: f.format(pieDay);
18: f.format(pieTime);
29: f.format(midnight);</code></pre>',290),
	 (917,'OCP - Chapter 18 - 21','<p>Assume the file referenced in the StudentManager class exists and contains data. Which statement about the following class is correct?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package school;
import java.io.*;

class Student implements Serializable {}
public class StudentManager {
    public static void main(String[] grades) {
        try(ObjectInputStream ios = new ObjectInputStream(new FileInputStream(new File("C://students.data")))) {
            Student record;
            while((record = (Student)ios.readObject()) != null) {
                System.out.print(record);
            }
        } catch (EOFException e) { }
        catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}</code></pre>',352),
	 (928,'OCP - Chapter 18 - 32','<p>Assuming the working directory is accessible, empty, and able to be written, how many file system objects does the following class create?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java"> 1: package kitchen; 
 2: import java.io.*; 
 3
 4: public class Bakers { 
 5:     public static void main(String... tooMany) throws IOException { 
 6:         File cake = new File("cake.txt"); 
 7:         Writer pie = new FileWriter("pie.txt"); 
 8:         pie.flush(); 
 9:         new File("fudge.txt").mkdirs(); 
10: } }</code></pre>',299),
	 (930,'OCP - Chapter 18 - 34','<p>Which statement best describes the following two methods?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">public String getNameQuick() throws IOException { 
	final BufferedReader r = new BufferedReader(new FileReader("saved.name")); 
	final String name = r.readLine(); 
	r.flush();
	return name; 
} 
public String getNameSafely() throws IOException { 
	try(final BufferedReader r = new BufferedReader(new FileReader("saved.name"))) { 
		final String name = r.readLine(); 
		r.flush(); 
		return name; 
	}
}</code></pre>',313),
	 (937,'OCP - Chapter 19 - Q1','<p>Fill in the blanks: A(n)__________ is a file that contains a reference to another file or directory, while a(n)__________ is a file that contains content.</p>',316),
	 (971,'OCP - Chapter 19 - Q36','<p>Assuming the directory /eclipse/projects exists and its contents are accessible, which statement about the following code snippet is correct?</p><pre><code class="language-java">Path p = Paths.get("/eclipse/projects");
Files.walk(p)
    .map(z -&gt; z.toAbsolutePath().toString()).filter(s -&gt; s.endsWith(".java"))
    .collect(Collectors.toList()).forEach(System.out::println);
Files.find(p,Integer.MAX_VALUE, (w,a) -&gt; w.toAbsolutePath().toString().endsWith(".java"))
    .collect(Collectors.toList()).forEach(System.out::println);</code></pre>',371),
	 (980,'OCP - Chapter 20 - 5','<p>Given the original array, how many of the following for statements result in an exception at runtime, assuming each is executed independently?</p><pre><code class="language-java">List&lt;Integer&gt; original = new ArrayList&lt;&gt;(Arrays.asList(1,2,3,4,5));

List&lt;Integer&gt; copy1 = new CopyOnWriteArrayList&lt;&gt;(original);
for(Integer w : copy1)
	copy1.remove(w);

List&lt;Integer&gt; copy2 = Collections.synchronizedList(original);
for(Integer w : copy2)
	copy2.remove(w);
	
List&lt;Integer&gt; copy3 = new ArrayList&lt;&gt;(original);
for(Integer w : copy3)
	copy3.remove(w);

Queue&lt;Integer&gt; copy4 = new ConcurrentLinkedQueue&lt;&gt;(original);
for(Integer w : copy4) 
	copy4.remove(w);</code></pre>',425),
	 (997,'OCP - Chapter 20 - 23','<p>What is the output of the following application?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package farm; 
import java.util.concurrent.*; 

public class CountSheep extends RecursiveAction {
	static int[] sheep = new int[] {1,2,3,4};
	final int start; final int end;
	int count = 0;
	public CountSheep(int start, int end) {
		this.start = start;
		this.end = end;
	}
	public void compute() {
		if(end-start&lt;2) {
			count+=sheep[start];
			return;
		} else {
			int middle = start + (end-start)/2;
			invokeAll(new CountSheep(start,middle), new CountSheep(middle,end));
		}
	}
	public static void main(String[] night) {
		ForkJoinPool pool = new ForkJoinPool();
		CountSheep action = new CountSheep(0,sheep.length);
		pool.invoke(action);
		pool.shutdown();
		System.out.print(action.count);
	}
}</code></pre>',8);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (999,'OCP - Chapter 20 - 25','<p>What is a possible output of the following application?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package salvage;
import java.util.*;
import java.util.concurrent.*;
import java.util.stream.*;

public class Car {
    private String model;
    private int year;
    public Car(String name, int year) {
        this.model = name; this.year = year;
    }
    public int getYear() {return year;}

    @Override
    public String toString() {return model;}

    public static void main(String... make) {
        List&lt;Car&gt; cars = new ArrayList&lt;&gt;();
        cars.add(new Car("Mustang",1967));
        cars.add(new Car("Thunderbird",1967));
        cars.add(new Car("Escort",1975));
        ConcurrentMap map = cars
                    .stream()
                    .collect(Collectors.groupingByConcurrent(Car::getYear));
        System.out.print(map);
    }
}</code></pre>',443),
	 (1000,'OCP - Chapter 20 - 26','<p>What is the output of the following application?</p><p>&nbsp;</p><pre><code class="language-java">package exercise; 
import java.util.*; 

public class Concat { 
	public String concat1(List&lt;String&gt; values) { 
		return values.parallelStream() 
				.reduce("a", (x,y)-&gt;x+y, String::concat); 
	} 
	public String concat2(List&lt;String&gt; values) { 
		return values.parallelStream() 
					.reduce((w,z)-&gt;z+w).get(); 
	} 
	public static void main(String... questions) { 
		Concat c = new Concat(); 
		List&lt;String&gt; list = Arrays.asList("Cat","Hat"); 
		String x = c.concat1(list); 
		String y = c.concat2(list); 
		System.out.print(x+" "+y); 
	} 
}</code></pre>',442),
	 (1004,'OCP - Chapter 20 - 30','<p>How many times does the following application print 1 at runtime?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package crew; 
import java.util.concurrent.*; 
import java.util.stream.*; 

public class Boat { 
	private void waitTillFinished(CyclicBarrier c) { 
		try { 
			c.await(); 
			System.out.print("1"); 
		} catch (Exception e) {} 
	} 
	public void row(ExecutorService service) { 
		final CyclicBarrier cb = new CyclicBarrier(5); 
		IntStream.iterate(1, i-&gt; i+1) 
					.limit(12) 
					.forEach(i -&gt; service.submit(() -&gt; waitTillFinished(cb))); 
	} 
	public static void main(String[] oars) { 
		ExecutorService service = null; 
		try { 
			service = Executors.newCachedThreadPool(); 
			new Boat().row(service); 
		} finally { service.isShutdown(); } 
	} 
}</code></pre>',445),
	 (1014,'OCP - Chapter 20 - 40','<p>How many lines of the following code snippet contain compilation errors?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">11: ScheduledExecutorService t = Executors 
12:     .newSingleThreadScheduledExecutor(); 
13: Future result = t.execute(System.out::println); 
14: t.invokeAll(null); 
15: t.scheduleAtFixedRate(() -&gt; {return;}, 5, TimeUnit.MINUTES);</code></pre>',402),
	 (1030,'OCP - Chapter 21 - Q16','<p>Assuming the clowns database exists and contains one empty table named clowns, what is the output of the following when run using a JDBC 4.0 driver?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">import java.sql.*;

public class EmptyTable {
    public static void main(String[] args) throws SQLException { // s1
        String url = "jdbc:derby:clowns";
        try (Connection conn = new Connection(url); // s2
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("select * from clowns")) {
            if (rs.next()) System.out.println(rs.getString(1));
        }
    }
}</code></pre>',461),
	 (1032,'OCP - Chapter 21 - Q19','<p>Table books:</p><p>---------------------------------------------------------------</p><p>| <strong>title</strong> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| <strong>num_pages </strong>|</p><p>| <i>character varying(255)</i> &nbsp;| <i>integer &nbsp; &nbsp;</i> &nbsp; &nbsp; &nbsp;|</p><p>---------------------------------------------------------------</p><p>| OCA &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 379 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |</p><p>| OCP &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 669 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |</p><p>---------------------------------------------------------------<br>&nbsp;</p><p>Given the table books and a ResultSet created by running this SQL statement, which option prints OCP?</p><pre><code class="language-plaintext">SELECT title FROM cert WHERE num_pages &gt; 500;</code></pre>',470),
	 (1033,'OCP - Chapter 21 - Q20','<p>Assume the database exists with all referenced table and column names. Which is a true statement when a JDBC 4.0 driver is used?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">String url = "jdbc:derby:precipitation"; 
try (Connection conn = DriverManager.getConnection(url); 
    Statement stmt = conn.createStatement( ResultSet.CONCUR_READ_ONLY, ResultSet.TYPE_SCROLL_INSENSITIVE);
    ResultSet rs = stmt.execute( "select total from precip where type = ''rain''")) {
        System.out.println(rs.getString("total")); 
}</code></pre>',466),
	 (1040,'OCP - Chapter 21 - Q28','<p>Which is true if the clowns database exists and contains an empty clowns table?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">String url = "jdbc:derby:clowns"; 
try (Connection conn = DriverManager.getConnection(url);
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("select count(*) from clowns")) { 
    rs.next(); // r1 
    System.out.println(rs.getInt(1)); // r2 
}</code></pre>',470),
	 (1045,'OCP - Chapter 21 - Q33','<p>Assuming the clowns database exists and contains one empty table named clowns, what is the output of the following when run using a JDBC 4.0 driver?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">import java.sql.*;

public class EmptyTable {
    public static void main (String[] args) throws SQLException { // s1
        String url = "jdbc:derby:clowns";
        try (Connection conn = DriverManager.getConnection(url); // s2
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from clowns")) {
            if (rs.next()) System.out.println(rs.getString(1));
        }
    }
}</code></pre>',470),
	 (1046,'OCP - Chapter 21 - Q35','<p>Given the following code snippet and the table in question 34, what is the output of the following when using a driver that supports a scroll sensitive ResultSet?&nbsp;</p><pre><code class="language-java">try (Connection conn = DriverManager.getConnection(url);
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet rs = stmt.executeQuery( "select * from people order by last_name asc")) {
    rs.absolute(-1);
    System.out.print(rs.getString(1));
    System.out.print(" ");
    rs.absolute(1);
    System.out.print(rs.getString(1));
}</code></pre>',471);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (1068,'OCP - Chapter 22 - Q17','<p>Which filename extension can hold a LocalDateTime property key in a resource bundle? (1 answer required)</p>',303),
	 (1075,'OCP - Chapter 22 - Q25','<p>Given the four properties files in question 24, what does this code print?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">Locale.setDefault(new Locale("en", "US")); 
ResourceBundle rb = ResourceBundle.getBundle("Cars", new Locale("fr", "CA"));
System.out.println(rb.getString("engine") + " "+ rb.getString("horses"));</code></pre>',8),
	 (1076,'OCP - Chapter 22 - Q26','<p>Given the four properties files in question 24, what does this code print?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">Locale.setDefault(new Locale("fr", "CA")); 
ResourceBundle rb = ResourceBundle.getBundle( "Cars", new Locale("en", "CA")); 
System.out.println(rb.getString("engine") + " " + rb.getString("horses"));</code></pre>',8),
	 (1081,'OCP - Chapter 22 - Q32','<p>Given the snippets of resource bundles in question 31 from when we compiled the application, what is the result of the following?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">Locale.setDefault(new Locale("en")); 
ResourceBundle rb = ResourceBundle.getBundle("Buggy"); 
System.out.println(rb.getString("color"));</code></pre>',8),
	 (1082,'OCP - Chapter 22 - Q33','<p>Given the snippets of resource bundles in question 31 from when we compiled the application, what is the result of the following?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">Locale.setDefault(new Locale("zh")); 
ResourceBundle rb = ResourceBundle.getBundle("Buggy"); 
System.out.println(rb.getString("wheels"));</code></pre>',8),
	 (1087,'OCP - Chapter 22 - Q38','<p>What is the output of the following?&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">package counter; 
import java.util.*; 

public class CountResource extends ListResourceBundle { 
	private int count = 0; 
	@Override 
	protected Object[][] getContents() { 
		return new Object[][] { { "count", count++ } }; 
	} 
	public static void main(String[] args) { 
		ResourceBundle rb = new ResourceBundle("counter.CountResource"); 
		System.out.println(rb.getObject("count") + " " + rb.getObject("count")); 
	} 
}</code></pre>',303),
	 (1110,'OCP - Chapter 12 - Q21','<p>What is the output of the following application?&nbsp;</p><pre><code class="language-java"> 1: package fruit;
 2: 
 3: interface Edible { void eat(); }
 4: public class ApplePicking {
 5:     public static void main(String[] food) {
 6:          Edible apple = new Edible() {
 7:              @Override
 8:              void eat() {
 9:                  System.out.print("Yummy!");
10:              }
11:          }
12:     }
13: }</code></pre>',189),
	 (1116,'OCP - Chapter 12 - Q27','<p>Fill in the blank: The primary reason default interface methods were added to Java is to support____________ .</p>',8),
	 (1159,'OCP_Sybex_Chapitre2_Q5','<p>Parmi les propositions suivantes, lesquelles sont des concept du design pattern singleton ?</p>',185),
	 (1214,'VueJS_bases_Q2','<p>Quel est le mod??le utilis?? par Vue.js ?</p>',2);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (1217,'VueJS_bases_Q3','<p>Qu''est ce qu''une instance d''un composant en Vue.JS ?</p>',825),
	 (1230,'VueJS_CLI_Q2','<p>Pourquoi on utilise des composants et pas des instances ?</p>',826),
	 (1231,'VueJS_CLI_Q3','<p>Comment faire pour passer des donn??es d''un composant parent ?? un composant enfant ?</p>',828),
	 (1232,'VueJS_lifecycle_Q1','<p>A quoi servent les "lifecyle hooks" ou "lifecycle methods" ?</p>',827),
	 (1233,'VueJS_directives_Q1','<p>Si on a envie de faire une boucle, qu''utilise t-on ?</p>',834),
	 (1234,'VueJS_directives_Q2','<p>Est-ce que l''on peut faire des rendus conditionnels avec Vue ?</p>',833),
	 (1235,'VueJS_directives_Q3','<p>Si un utilisateur doit fr??quemment afficher ou cacher un ??l??ment de la page, quelle est la meilleure directive ?? utiliser ?</p>',832),
	 (1237,'VueJS_lifecycle_Q2','<p>Parmi les hooks de cycle de vie suivants, lequel est le plus pertinent pour lancer des m??thodes asynchrones, afin de r??cup??rer des donn??es depuis une API ?</p>',827),
	 (1257,'SPRING_Conteneur_7','<p>Quels sont les objets inject??s dans les Spring containers ?</p>',148),
	 (1283,'VueJS_bases_Q1','<p>Qu''est-ce que Vue.js ?</p>',3);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (1294,'SPRING_DI_IOC_8','Que signifie AOP pour Spring ?',154),
	 (1298,'ECMAScript_async_1','<p>En Javascript, quels sont les outils pour r??cup??rer le r??sultat d''un appel asynchrone?</p>',17),
	 (1300,'ECMAScript_async_2','<p>ma_fonction execute du code asynchrone et utilise le mot cl?? await pour se faire. Comment peut-on d??clarer la fonction?</p>',17),
	 (1304,'ECMAScript_async_3','<p>ma_fonction execute du code asynchrone mais n''utilise PAS le mot cl?? await. Comment peut-on d??clarer la fonction?</p>',17),
	 (1306,'ECMAScript_async_4','<p>Pour g??rer des appels asynchrones, quels m??thodes sont a privil??gier?</p>',17),
	 (1317,'ECMAScript_async_6','<p>Quelle est l''API fourni de base par javascript pour effectuer des appels asynchrones ?? une adresse distante?</p>',17),
	 (1318,'ECMAScript_ES6Features_1','<p>Quel mot cl?? introduit par ES6 permet de d??finir une variable comme une constante?</p>',18),
	 (1319,'ECMAScript_ES6Features_2','<p>Quel mot cl?? introduit par ES6 permet de d??finir une variable?</p>',18),
	 (1320,'ECMAScript_ES6Features_3','<p>ma_fonction est une fonction avec deux param??tres, a et b. Comment peut-on faire avec ES6 ?? la d??claration pour garantir une valeur par d??faut pour b de 12?</p>',18),
	 (1321,'ECMAScript_ES6Features_4','<p>Avec ES6, que permet l''op??rateur ... ?</p>',18);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (1322,'ECMAScript_ES6Features_5','<p>ES6 a introduit une nouvelle fa??on d''??crire les fonctions. Quelles sont les syntaxes correctes</p>',18),
	 (1323,'ECMAScript_ES6Features_6','<p>Qu''est ce que le hoisting, ou hissage en fran??ais?</p>',18),
	 (1324,'ECMAScript_ES6Features_7','<p>Les classes introduites dans ES6 sont-elles concern??s par le principe de hoisting (ou hissage)?</p>',18),
	 (1325,'ECMAScript_ES6Features_8','<p>Avant l''introduction des classes avec ES6, on ne pouvait pas faire de la POO avec Javascript/ECMAScript</p>',18),
	 (1326,'ECMAScript_ES6Features_9','<p>Depuis ES6, name ??tant une variable, comment peut on ??crire "My name is " + name + " !" avec une seule paire de guillemet?</p>',18),
	 (1327,'ECMAScript_ES6Features_10','<p>Dans cette liste, s??lectionniez les exemples de destructuring</p>',18),
	 (1328,'VueJS_CLI_Q5','<p>Quelles sont les 3 parties d??finissant un fichier .vue ?</p>',825),
	 (1334,'VueJS_CLI_Q6','<p>Quelle est la syntaxe pour passer une valeur dynamique "kiwi" ?? une prop ?</p>',836),
	 (1338,'VueJS_directives_Q4','<p>Quel est l''attribut n??cessaire lorsqu''on cr??e une boucle avec v-for ?</p>',834),
	 (1341,'VueJS_directives_Q5','<p>Quelle directive associe un champ input ?? une donn??e de composant (data) ?</p>',837);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (1371,'VueJS_bases_Q5','<p>Comment initialiser une nouvelle instance de vue.js?</p>',826),
	 (1372,'VueJS_bases_Q6','<p>Quelle interpolation de liaison de donn??es est aussi connue comme la syntaxe ???Mustache????</p>',831),
	 (1373,'VueJS_bases_Q7','<p>Pourquoi la propri??t?? data d''un composant doit ??tre une fonction qui renvoie un nouvel objet ?</p>',830),
	 (1374,'VueJS_bases_Q8','<p>Comment peut-on surveiller un changement de valeur dans les donn??es pour d??clencher une action ?</p>',830),
	 (1375,'VueJS_directives_Q6','<p>La directive v-show ne supporte pas l''??l??ment &lt;template&gt;.</p>',833),
	 (1381,'VueJS_directives_Q7','<p>Qu''est-ce qui est utilis?? pour lier dynamiquement un ou plusieurs attributs, ou une propri??t?? de composant ?? une expression?</p>',853),
	 (1388,'OCP11_CHAP1_Fichier','<p>Le code ci-dessous est-il valide ?</p><pre><code class="language-java">1: public class Humain { 
2: } 
3: 
4: public class Homme extends Humain { 
5: } 
6: 
7: public class Femme extends Humain { 
8: }&nbsp;</code></pre>',8),
	 (1389,'OCP11_CHAP1_Fichier_2','<p>Le code ci-dessous est-il valide ?</p><pre><code class="language-java">1: public class Humain { 
2: } 
3: 
4: class Homme extends Humain { 
5: } 
6: 
7: class Femme extends Humain { 
8: }&nbsp;</code></pre>',8),
	 (1390,'OCP11_CHAP1_Main','<p>Quelles d??finitions de m??thodes main() sont valides ?</p>',8),
	 (1391,'OCP11_CHAP1_Main_2','<p>En ex??cutant la commande suivante : `javac Main.java; java Main caillou 18 "Je suis ton p??re !"` Quel sera le r??sultat de l''ex??cution du code suivant ?</p><pre><code class="language-java">1: public class Main { 
2:   public void main(String[] args) { 
3:     for (int i = 0; i &lt; args.length; i++) { 
4:       System.out.print(args[i] + " "); 
5:     } 
6:   } 
7: }&nbsp;</code></pre>',8);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (1392,'OCP11_CHAP1_Parametres','<p>En ex??cutant la commande suivante : `javac Main.java; java Main caillou 18 "Je suis ton p??re !"` Quel sera le r??sultat de l''ex??cution du code suivant ?</p><pre><code class="language-java">1: public class Main { 
2:   public static void main(String[] args) { 
3:     for (int i = 0; i &lt; args.length; i++) { 
4:       System.out.print(args[i] + " "); 
5:     } 
6:   } 
7: }&nbsp;</code></pre>',8),
	 (1393,'OCP11_CHAP1_Commande','<p>D''apr??s le code suivant, quelles sont les lignes commandes valides qui permettront d''afficher "Bonjour monsieur le ministre" ?</p><pre><code class="language-java">1: public class Main { 
2:   public static void main(String... args) { 
3:     System.out.println("Bonjour " + args[0]); 
4:   } 
5: } </code></pre>',8),
	 (1404,'ECMAScript_ES6Features_11','<p>Quel protocole d''it??ration introduit par ES6 permet de personnaliser la fa??on dont les valeurs d''un objet JS sont parcouru?</p>',18),
	 (1407,'ECMAScript_ES6Features_12','<p>Que doit contenir un objet pour que celui-ci soit conforme au protocole it??rateur?</p>',18),
	 (1416,'ECMAScript_ES6Features_13','<p>Dans quels fonctions peut-on trouver le mot-cl?? yield ?</p>',18),
	 (1417,'ECMAScript_ES6Features_14','<p>Dans un g??n??rateur, comment peut on retourner une valeur?</p>',18),
	 (1418,'ECMAScript_ES6Features_15','<p>Comment d??finit-on un g??n??rateur?</p>',18),
	 (1428,'ECMAScript_ES6Features_16','<p>Quel est la diff??rence entre les export nomm??s et les export par d??faut?</p>',18),
	 (1435,'ECMAScript_ES6Features_17','<p>Quels sont les trois termes cl??s utilis?? dans le design pattern Proxy?</p>',18),
	 (1438,'OCP11_CHAP1_Review_13','<p>Quelles options sont valides avec la commande java (hors modules) ?</p>',8);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (1439,'OCP11_CHAP1_Review_14','<p>Quelles options sont valides avec la commande jar (hors modules) ?</p>',8),
	 (1440,'ECMAScript_ES6Features_18','<p>Quels sont les use-cases principaux de l''objet Proxy de ES6?</p>',18),
	 (1441,'ECMAScript_ES6Features_19','<p>Quel autre objet rajout?? par ES6 est souvent utilis?? en conjonction des proxy?</p>',18),
	 (1442,'SPRING_AOP_1','<p>AOP fait partie de Core Container dans le Framework Spring?</p>',154),
	 (1443,'SPRING_AOP_2','<p>Qu???est ce qu???un AOP proxy ?</p>',154),
	 (1444,'SPRING_AOP_3','<p>Dans le Spring framework, le proxy AOP est __</p>',154),
	 (1445,'SPRING_AOP_4','<p>Par d??faut Spring AOP utilise pour son AOP proxy:</p>',154),
	 (1446,'SPRING_AOP_5','<p>Quelle signifie l''abr??viation AOP?</p>',154),
	 (1447,'SPRING_AOP_6','Remplissez. ______ est un point dans l''ex??cution d''un programme auquel un comportement suppl??mentaire peut ??tre ins??r?? ?? l''aide d''AOP.',154),
	 (1449,'SPRING_AOP_8','Parmis les choix suivants, lesquels sont corrects ?? propos du proxy AOP?',154);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (1451,'SPRING_AOP_10','Parmi les choix suivants, lequel est correct ?? propos du support Spring AOP?',154),
	 (1455,'SPRING_AOP_14','En utilisant le framework Spring AOP, quel est la visibilit?? des m??thodes qui correspondent au join point: 
@Pointcut(???execution(* *(..))???)
private void anyOperation() {}; 
',154),
	 (1456,'SPRING_AOP_15','Si on utilise le framework Spring AOP, quelles sont les m??thodes join point des expressions point cut suivant ?
execution(public * *(..))',154),
	 (1485,'VueJS_lifecycle_Q3','<p>Quel est le bon ordre d''ex??cution de ces hooks de composant ?</p>',827),
	 (1486,'VueJS_directives_Q8','<p>Quelle directive est utilis??e pour ??tablir une liaison bidirectionnelle ?</p>',837),
	 (1487,'VueJS_directives_Q9','<p>Une image est-elle charg??e par le navigateur lorsqu''elle est "masqu??e" par v-show ?</p>',833),
	 (1488,'VueJS_directives_Q10','<p>Quelle directive est utilis??e pour attacher des ??couteurs d''??v??nement qui invoquent des m??thodes ?</p>',832),
	 (1489,'VueJS_directives_Q11','<p>La directive v-model est utilis??e en ... ?</p>',837),
	 (1498,'VueJS_directives_Q12','<p>Peut-on utiliser la directive v-if dans un ??l??ment &lt;template&gt;</p>',833),
	 (1500,'VueJS_directives_Q13','<p>Que doit-on utiliser si on a besoin de permuter quelque chose tr??s souvent ?</p>',833);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (1501,'VueJS_directives_Q14','<p>Que doit-on utiliser si la condition ne change probablement pas ?? l''ex??cution ?</p>',833),
	 (1506,'VueJS_directives_Q15','<p>Peut-on utiliser v-else avec v-show ?</p>',833),
	 (1511,'VueJS_directives_Q16','<p>Est-ce une bonne pratique d''utiliser v-for et v-if ensemble ?</p>',834),
	 (1521,'ECMAScript_ES7+Features_1','<p>Soit base et exponent deux nombres. Comment peut-on ??crire en JS depuis ES7 (ES2016) base^exponent</p>',19),
	 (1522,'ECMAScript_ES7+Features_2','<p>Quel est le r??sultat du code suivant: let c = 2; c **=3</p>',19),
	 (1523,'ECMAScript_ES7+Features_3','<p>Soit array un tableau de variable. Depuis ES7, comment peut-on v??rifier qu''une valeur val appartient ?? ce tableau?</p>',19),
	 (1524,'ECMAScript_ES7+Features_4','<p>Quel code retourne true suite ?? la d??finition suivante: const array = [0, 1]</p>',19),
	 (1525,'ECMAScript_ES7+Features_5','<p>Dans quelle version d''ECMAScript a ??t?? introduit la syntaxe async/await ?</p>',19),
	 (1528,'ECMAScript_ES7+Features_6','<p>Quel est l''int??r??t d''utiliser la syntaxe async await par rapport aux promesses?</p>',19),
	 (1530,'ECMAScript_ES7+Features_7','<p>Soit ma_fonction une fonction asynchrone. Quelle est la diff??rence entre: return ma_fonction(); et return await ma_fonction();</p>',19);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (1534,'ECMAScript_ES7+Features_8','<p>Quelle est la bonne pratique pour g??rer les erreurs d''une fonction asynchrone qui utilise async await?</p>',19),
	 (1535,'ECMAScript_ES7+Features_9','<p>Si maFonction est une fonction asynchrone, et retourne un objet apr??s une seconde, que vaut c ?? l''execution: const c = maFonction();</p>',19),
	 (1584,'VueJS_directives_Q17','<p>Dans quels cas peut-on utiliser la directive v-for ? (plusieurs r??ponses possibles)</p>',834),
	 (1588,'VueJS_directives_Q18','<p>Quelle est la bonne mani??re d''??crire une boucle for en Vue sachant que items est un tableau de donn??es ?</p>',834),
	 (1589,'VueJS_directives_Q19','<p>Quelle est la bonne mani??re d''??crire une boucle for en Vue sachant que object est un objet ?</p>',834),
	 (1590,'VueJS_directives_Q20','<p>Que va afficher : {{ n }} ?</p>',834),
	 (1603,'VueJS_bases_Q9','<p>Qui a cr???? Vue.js ?</p>',3),
	 (1604,'ECMAScript_ES7+Features_10','<p>Quelle API introduite par ES8 permet d''obtenir un array des valeurs d''un objet?</p>',19),
	 (1605,'ECMAScript_ES7+Features_11','<p>Quelle API introduite par ES8 permet d''obtenir un array ?? la fois des cl??s et des valeurs d''un objet?</p>',19),
	 (1606,'VueJS_bases_Q10','<p>Est-ce que Vue.js utilise le DOM virtuel ?</p>',3);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (1607,'VueJS_directives_Q34','<p>Quel est la technique pour envoyer des ??v??nements ?? des composants qui n''ont pas de lien de parent?? ?</p>',829),
	 (1608,'ECMAScript_ES7+Features_12','<p>Quelles sont les propri??t??s list??s par l''API getOwnPropertyDescriptors pour chaque propri??t?? d''un objet?</p>',19),
	 (1609,'VueJS_CLI_Q8','<p>Quelle instruction permet de restreindre la port??e des styles au composant lui-m??me ?</p>',747),
	 (1610,'ECMAScript_ES7+Features_13','<p>Quelle propri??t?? accessible via l''API getOwnPropertyDescriptors est accessible plus facilement?</p>',19),
	 (1611,'ECMAScript_ES7+Features_14','<p>Pour que le descripteur writable fonctionne et envoie une erreur si l''on essaie d''??diter une propri??t?? qui a writable ?? false, il faut utiliser le mode strict</p>',19),
	 (1612,'ECMAScript_ES7+Features_15','<p>Quels descripteurs peuvent ??tre chang?? sur une propri??t?? si configurable est ?? false avec defineProperty?</p>',19),
	 (1613,'ECMAScript_ES9+Features_1','<p>Dans quel version d''ES Promise.prototype.finally() a-t''il ??t?? introduit?</p>',20),
	 (1618,'ECMAScript_ES9+Features_2','<p>Soit asyncFunction() une fonction asynchrone qui throw une erreur avant de se r??soudre. Sur le code suivant, dans quelle ordre apparait les lettres?&nbsp;</p><pre><code class="language-javascript">asyncFunction()
	.then(() =&gt; console.log("A"))
	.catch(() =&gt; console.log("B"))
	.finally(() =&gt; console.log("C"))</code></pre>',20),
	 (1637,'VueJS_directives_Q21','<p>Quelle variable sp??ciale contient l''??v??nement natif attrap?? par v-on ?</p>',835),
	 (1638,'VueJS_directives_Q22','<p>Quel modificateur peut-on utiliser sur une directive v-on pour ne d??clencher que si l''??v??nement provient du composant lui-m??me ?</p>',832);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (1639,'VueJS_directives_Q23','<p>Quel modificateur d''??v??nement sera utilis?? si nous voulons ex??cuter l''??v??nement click uniquement une fois ?</p>',832),
	 (1640,'VueJS_directives_Q24','<p>Quel modificateur d''??v??nement est utilis?? pour emp??cher uniquement les clics sur l''??l??ment lui-m??me ?</p>',832),
	 (1691,'ECMAScript_ES9+Features_3','<p>Quel type d''objet peut ??tre iterableObject dans ce code?</p><pre><code class="language-plaintext">    for await (const chunk of iterableObject) {
      console.log(chunk)
    }</code></pre>',20),
	 (1692,'ECMAScript_ES9+Features_4','<p>Quels sont les propri??t??s d''un objet it??rable asynchrone?</p>',20),
	 (1693,'ECMAScript_ES9+Features_5','<p>Quels sont les propri??t??s d''un objet it??rable synchrone?</p>',20),
	 (1694,'ECMAScript_ES9+Features_6','<p>Compl??ter la phrase suivante:</p><p>&nbsp;</p><p>Les it??rateurs [???] peuvent ??tre it??r?? via for???of et for await???of tandis que les it??rateurs [???] ne peuvent ??tre it??r?? que via for await???of</p>',20),
	 (1695,'ECMAScript_ES9+Features_7','<p>Quelle fonction native ?? javascript introduite par ES10 permet de cr??er un tableau contenant la concat??nation des ??l??ments des sous-tableaux du tableau pass???</p>',20),
	 (1696,'ECMAScript_ES9+Features_8','<p>Comment utiliser flat une seule fois pour supprimer les sous-tableaux du tableau suivant?</p><p>&nbsp;</p><pre><code class="language-javascript">[1, 2, [3, 4, [5, 6]]]</code></pre>',20),
	 (1697,'ECMAScript_ES9+Features_9','<p>Que retourne le code suivant?&nbsp;</p><p>&nbsp;</p><pre><code class="language-javascript">const entries = new Map([
  [''foo'', ''bar''],
  [''baz'', 42]
]);

const obj = Object.fromEntries(entries);

console.log(obj)</code></pre>',20),
	 (1698,'ECMAScript_ES9+Features_10','<p>Quel types de param??tres peut on donner ?? Object.fromEntries pour obtenir un objet?</p>',20);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (1699,'ECMAScript_ES9+Features_11','<p>Depuis ES10, lesquels de ces propositions sont corrects?</p>',20),
	 (1746,'VueJS_router_Q1','<p>Est-ce que Vue-router est inclus lors de l''installation de Vue ?</p>',850),
	 (1762,'VueJS_router_Q2','<p>Quelle instruction permet de router vers une autre vue ?</p>',850),
	 (1766,'VueJS_router_Q3','<p>L''application doit pouvoir rendre le nom d''un utilisateur sur la base de l''URL. Mais ??a ne fonctionne pas comme souhait?? actuellement. Pourquoi ?</p>',850),
	 (1767,'VueJS_router_Q4','<p>Lorsque l''utilisateur clique sur le lien "?? propos", cela d??clenche un rafra??chissement de la page enti??re. Quel ??l??ment du Vue Router devrait ??tre utilis?? ?? la place pour ??viter ce comportement ?</p>',850),
	 (1768,'VueJS_router_Q5','<p>Comment peut-on r??cup??rer le param??tre "id" d''une URL interpr??t??e par le routing "document/:id" ?</p>',850),
	 (1769,'ECMAScript_ES9+Features_12','<p>Que retourne le code suivant?</p><pre><code class="language-javascript">function sayHello(text){
  const name = text;
  //print name
  console.log(`Hello ${name}`)
}

console.log(sayHello.toString());</code></pre>',20),
	 (1770,'ECMAScript_ES9+Features_13','<p>Que retourne le code suivant?</p><p>&nbsp;</p><pre><code class="language-javascript">class A { a(){return 1} }

console.log(A.toString())</code></pre>',20),
	 (1771,'ES11Features_1','<p>Que vaut duration?</p><p>&nbsp;</p><pre><code class="language-javascript">const a = { duration: 50 };

a.duration ??= 10;</code></pre>',21),
	 (1772,'ES11Features_2','<p>Que vaut speed?</p><p>&nbsp;</p><pre><code class="language-javascript">const a = { duration: 50 };

a.speed ??= 25;
</code></pre>',21);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (1773,'ES11Features_3','<p>Que vaut speed?</p><p>&nbsp;</p><pre><code class="language-javascript">const a = { duration: 50, speed: null };

a.speed ??= 25;
</code></pre>',21),
	 (1774,'ES11Features_4','<p>Comment modifier la derni??re ligne de ce code pour qu''il n''y ait pas d''erreurs et ?</p><p>&nbsp;</p><pre><code class="language-javascript">const adventurer = {
  name: ''Alice'',
  cat: {
    name: ''Dinah''
  }
};

console.log(adventurer.dog.name);</code></pre>',21),
	 (1775,'ES11Features_5','<p>Peut-on cr??er des variables priv??s en Javascript?</p>',21),
	 (1779,'OCP11_CHAP_17_Review_4','<p>Quelles propositions sont correctes ?</p>',8),
	 (1813,'OCP_CHAP9_5','<p>Admettons que /kang existe en tant que lien symbolique pour le r??pertoire /mammal/kangaroo dans le syst??me de fichiers. Quelles affirmations ?? propos du code suivant sont correctes ? (Plusieurs r??ponses possibles)&nbsp;</p><p>&nbsp;</p><pre><code class="language-plaintext">Path path = Paths.get("/kang");
if(Files.isDirectory(path) &amp;&amp; Files.isSymbolicLink(path))
Files.createDirectory(path.resolve("joey"));</code></pre>',333),
	 (1834,'ES11Features_6','<p>Quelle est la diff??rence entre Promise.all et Promise.allSettled?</p>',21),
	 (1845,'ES11Features_7','<p>Que s''affichera dans la console apr??s l''execution du code suivant?</p><p>&nbsp;</p><pre><code class="language-javascript">const promise1 = Promise.resolve(3);
const promise2 = new Promise((resolve, reject) =&gt; setTimeout(reject, 100, ''foo''));

Promise.allSettled([promise1, promise2]).then(console.dir).catch(console.log);</code></pre>',21),
	 (1848,'VueJS_router_Q6','<p>Quel est le mode par d??faut de Vue router ?</p>',850),
	 (1850,'ES11Features_8','<p>Dans un module, quel sera le r??sultat de l''execution du code suivant?</p><p>&nbsp;</p><pre><code class="language-javascript">await Promise.resolve(console.log(''finished waiting''));</code></pre>',21),
	 (1851,'ES11Features_9','<p>Dans un code type commonJS, quel sera le r??sultat de l''execution du code suivant?</p><p>&nbsp;</p><pre><code class="language-javascript">await Promise.resolve(console.log(''finished waiting''));</code></pre>',21);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (2008,'OCA - Chapter 1 - 1','<p>Which of the following method signatures is a valid declaration of an entry point in a<br>Java application?</p>',483),
	 (2009,'OCA - Chapter 1 - 2','<p>What is the proper filename extension for a Java bytecode compiled file?</p>',487),
	 (2010,'OCA - Chapter 1 - 4','<p>Given that a Date class exists in both the java.util and java.sql packages, what is the<br>result of compiling the following class?<br>&nbsp;</p><pre><code class="language-java">1: import java.util.*;
2: import java.sql.*;
3: public class BirthdayManager {
4: private Date rob = new Date();
5: private java.util.Date sharon = new java.util.Date();
6: }</code></pre>',586),
	 (2011,'OCA - Chapter 1 - 5','<p>Which of the following is not a facet of traditional object-oriented programming languages?</p>',591),
	 (2012,'OCA - Chapter 1 - 6','<p>Which variables have a scope limited to a method?</p>',529),
	 (2013,'OCA - Chapter 1 - 7','<p>Which package is imported into every Java class by default?</p>',585),
	 (2014,'OCA - Chapter 1 - 8','<p>Which of the following is not a valid code comment in Java?</p>',523),
	 (2015,'OCA - Chapter 1 - 9','<p>Which statement about a valid .java file is true?</p>',526),
	 (2016,'OCA - Chapter 1 - 10','<p>Given the following application, fill in the missing values in the table starting from the<br>top and going downward.</p><p>&nbsp;</p><pre><code class="language-java">package competition;
public class Robot {
	static String weight = "A lot";
	/* default */ double ageMonths = 5, ageDays = 2;
	private static boolean success = true;
	public void main(String[] args) {
		final String retries = "1";
		// P1
	}
}</code></pre><p>Variable Type &nbsp;| Number of Variables Accessible at P1, without instantiating a Robot object<br>Class | _______<br>Instance | _______<br>Local | _______</p><p>&nbsp;</p>',529),
	 (2017,'OCA - Chapter 1 - 11','<p>Which statement about import statements is true?</p>',579);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (2018,'OCA - Chapter 1 - 12','<p>What is the result of compiling and executing the following class?<br>&nbsp;</p><pre><code class="language-java">1: public class ParkRanger {
2:   int birds = 10;
3:   public static void main(String[] data) {
4:     int trees = 5;
5:     System.out.print(trees+birds);
6:   }
7: }</code></pre>',551),
	 (2019,'OCA - Chapter 1 - 13','<p>Which statements about Java are true?<br>I. The java command can execute .java and .class files.<br>II. Java is not object oriented.<br>III. The javac command compiles directly into native machine code.</p>',501),
	 (2020,'OCA - Chapter 1 - 14','<p>Which of the following lines of code is not allowed as the first line of a Java class file?</p>',581),
	 (2021,'OCA - Chapter 1 - 15','<p>Which one of the following statements is true about using packages to organize your code in Java?</p>',580),
	 (2022,'OCA - Chapter 1 - 16','<p>Given that the current directory is /user/home, with an application Java file in /user/home/Manager.java that uses the default package, which are the correct commands to compile and run the application in Java?</p>',481),
	 (2023,'OCA - Chapter 1 - 17','<p>Structuring a Java class such that only methods within the class can access its instance variables is referred to as _______.</p>',591),
	 (2024,'OCA - Chapter 1 - 18','<p>What is the output of the following code snippet?</p><pre><code class="language-java">String tree = "pine";
int count = 0;
if (tree.equals("pine")) {
	int height = 55;
	count = count + 1;
}
System.out.print(height + count);</code></pre>',529),
	 (2025,'OCA - Chapter 1 - 19','<p>Which of the following is true of a Java bytecode file ?</p>',596),
	 (2026,'OCA - Chapter 1 - 20','<p>What is the correct character for terminating a statement in Java?</p>',493),
	 (2027,'OCA - Chapter 1 - 21','<p>What is the result of compiling and executing the following class?</p><pre><code class="language-java">1: public class Tolls {
2:     private static int yesterday = 1;
3:     int tomorrow = 10;
4:     public static void main(String[] args) {
5:         Tolls tolls = new Tolls();
6:         int today=20, tomorrow = 40;
7:         System.out.print(today + tolls.tomorrow + tolls.yesterday);
8:     }
9: }</code></pre>',564);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (2028,'OCA - Chapter 1 - 22','<p>Given the following class definition, which is the only line that does not contain a compilation error?</p><pre><code class="language-java">1: public ThisClassDoesNotCompile {
2:   double int count;
3:   void errors() {}
4:   static void private limit; }</code></pre>',557),
	 (2029,'OCA - Chapter 1 - 23','<p>Which of the following features allows a Java class to be run on a wide variety of computers and devices?</p>',592),
	 (2030,'OCA - Chapter 1 - 24','<p>Which of the following is not a property of a JVM?</p>',486),
	 (2031,'OCA - Chapter 1 - 25','<p>Which of the following variables are always in scope for the entire program?</p>',529),
	 (2032,'OCA - Chapter 1 - 26','<p>Given the following wildcard import statements, which class would be included in the import?</p><p>&nbsp;</p><pre><code class="language-java">import television.actor.*;
import movie.director.*;</code></pre>',583),
	 (2033,'OCA - Chapter 1 - 27','<p>Which is the correct order of statements for a Java class file?</p>',581),
	 (2034,'OCA - Chapter 1 - 28','<p>Given the following class definition, what is the maximum number of import statements that can be discarded and still have the code compile? For this question, assume that the Blackhole class is defined only in the stars package.</p><pre><code class="language-java">package planetarium;
import java.lang.*;
import stars.*;
import java.lang.Object;
import stars.Blackhole;

public class Observer {
	public void find(Blackhole blackhole) {}
}</code></pre>',585),
	 (2035,'OCA - Chapter 1 - 29','<p>Given the following class definition, which command will cause the application to output the message White-tailed?</p><pre><code class="language-java">package forest;
public class Deer {
	public static void main(String... deerParams) {
		System.out.print(theInput[2]);
	}
}</code></pre>',492),
	 (2036,'OCA - Chapter 1 - 30','<p>Which of the following is a true statement?</p>',481),
	 (2037,'OCA - Chapter 1 - 31','<p>Which of the following statements about Java is true?</p>',591);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (2038,'OCA - Chapter 1 - 32','<p>Given the following code, what values inserted in order into the blank lines, allow the code to compile?</p><pre><code class="language-java">_______agent;
public _______Banker {
	private static _______getMaxWithdrawal() {
		return 10;
	}
}</code></pre>',581),
	 (2039,'OCA - Chapter 1 - 33','<p>What is the output of the following application?</p><pre><code class="language-java">public class Airplane {
	static int start = 2;
	final int end;
	public Airplane(int x) {
		x = 4;
		end = x;
	}
	public void fly(int distance) {
		System.out.print(end-start+" ");
		System.out.print(distance);
	}
	public static void main(String... start) {
		new Airplane(10).fly(5);
	}
}</code></pre>',549),
	 (2040,'OCA - Chapter 1 - 34','<p>What is one of the most important reasons that Java supports extending classes via inheritance?</p>',595),
	 (2041,'OCA - Chapter 1 - 35','<p>Which of the following is a valid code comment in Java?</p>',523),
	 (2042,'OCA - Chapter 1 - 36','<p>Which of the following method signatures is not a valid declaration of an entry point in a Java application?</p>',483),
	 (2043,'OCA - Chapter 1 - 37','<p>Given the file Magnet.java below, which of the marked lines can you independently insert the line public String color; into and still have the code compile?</p><pre><code class="language-java">// line a1
public class Magnet {
	// line a2
	public void attach() {
		// line a3
	}
	// line a4
}</code></pre>',529),
	 (2044,'OCA - Chapter 1 - 38','<p>What is required to define a valid Java class file?</p>',581),
	 (2045,'OCA - Chapter 1 - 39','<p>What is the proper filename extension for a Java source file?</p>',485),
	 (2046,'OCA - Chapter 1 - 40','<p>Given that a Math class exists in both the java.lang and pocket.complex packages, what is the result of compiling the following class?</p><pre><code class="language-java">1: package pocket;
2: import pocket.complex.*;
3: import java.util.*;
4: public class Calculator {
5:   public static void main(String[] args) {
6:     System.out.print(Math.floor(5));
7:   }
8: }</code></pre>',586),
	 (2047,'OCA - Chapter 1 - 41','<p>Given a class that uses the following import statements, which class would not be automatically accessible within the class without using its full package name?</p><pre><code class="language-java">import dog.*;
import dog.puppy.*;</code></pre>',583);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (2048,'OCA - Chapter 1 - 42','<p>_______is the technique of structuring programming data as a unit consisting of attributes, with actions defined on the unit.</p>',591),
	 (2049,'OCA - Chapter 1 - 43','<p>Given the following class definition, what is the maximum number of import statements that can be discarded and still have the code compile? For this question, assume that the Broccoli class is in the food.vegetables package, and the Apple class is the food.fruit package.</p><pre><code class="language-java">package food;
import food.vegetables.*;
import food.fruit.*;
import java.util.Date;
public class Grocery {
  Apple a; Broccoli b; Date c;
}</code></pre>',585),
	 (2050,'OCA - Chapter 1 - 44','<p>Given the following application, what is the expected output?</p><pre><code class="language-java">public class Keyboard {
	private boolean numLock = true;
	static boolean capLock = false;
	public static void main(String... shortcuts) {
		System.out.print(numLock+" "+capLock);
	}
}</code></pre>',564),
	 (2051,'OCA - Chapter 1 - 45','<p>What is the result of compiling and executing the following class?<br>&nbsp;</p><pre><code class="language-java">public class RollerSkates {
	static int wheels = 1;
	int tracks = 5;
	public static void main(String[] arguments) {
		RollerSkates s = new RollerSkates();
		int feet=4, tracks = 15;
		System.out.print(feet + tracks + s.wheels);
	}
}</code></pre>',529),
	 (2052,'OCA - Chapter 1 - 46','<p>What is the result of compiling and executing the following class?</p><pre><code class="language-java">package sports;
public class Bicycle {
	String color = "red";
	private void printColor(String color) {
		color = "purple";
		System.out.print(color);
	}
	public static void main(String[] rider) {
		new Bicycle().printColor("blue");
	}
}</code></pre>',565),
	 (2053,'OCA - Chapter 1 - 47','<p>Which statements about calling the compilation command javac and the execution command java are true?</p><p><br>I. java may use a period . to separate packages.<br>II. javac takes a .java file and returns a .class file.<br>III. java may use a slash (/) to separate packages.</p>',485),
	 (2054,'OCA - Chapter 1 - 48','<p>What is the result of compiling and executing the following application?</p><pre><code class="language-java">package forecast;
public class Weather {
	private static boolean heatWave = true;
	public static void main() {
		boolean heatWave = false;
		System.out.print(heatWave);
	}
}</code></pre>',483),
	 (2055,'OCA - Chapter 1 - 50','<p>Which statement about the JVM is true?</p>',486),
	 (2119,'VueJS_directives_Q25','<p>Quelle ligne doit-on utiliser pour que rawHtml soit interpr??t?? en tant que HTML ?</p><p>&nbsp;</p><pre><code class="language-plaintext">rawHtml: ''&lt;span style="color:red"&gt;Rouge&lt;/span&gt;''</code></pre>',832),
	 (2120,'VueJS_directives_Q26','<p>Quelle ligne doit-on utiliser pour que rawHtml soit interpr??t?? en tant que texte brut et non en tant que HTML ?</p><p>&nbsp;</p><pre><code class="language-plaintext">rawHtml: ''&lt;span style="color:red"&gt;Rouge&lt;/span&gt;''</code></pre>',832);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (2154,'VueJS_directives_Q27','<p>Qu''est-ce qui est affich?? suite ?? l''ex??cution de ce code ?</p><p>&nbsp;</p><pre><code class="language-plaintext">new Vue({
	el: ''#app'',
  	data: {
		movieTitle: ''The Matrix''
  	}
});</code></pre><pre><code class="language-plaintext">&lt;div id="app"&gt;
  &lt;h1 v-once&gt;{{ movieTitle }}&lt;/h1&gt;
  
  &lt;button v-on:click="movieTitle = ''The Matrix Reloaded''"&gt;Change Movie Title&lt;/button&gt;
&lt;/div&gt;</code></pre><p>&nbsp;</p>',835),
	 (2220,'OCA - Chapter 6 - Custom Question 6','<p>What is the result of the following code?</p><pre><code class="language-java">public class Modem {
	private String host;
	private int port;
	public Modem(String host, int port) {
		this.host = host;
		this.port = port;
	}
	public static void dial() {
		Modem m = new Modem("excilys.com",443);
		m.connect();
		System.out.println("Connected to Oxyl");
	}
	public void connect() throws IOException {
		Socket soc = new Socket();
		try {
			soc.connect(new InetSocketAddress(host, port), 1518);
		} catch( IOException exc ) {
			System.out.println("Z");
		} finally {
			soc.close();
			System.out.println("A");
		}
} }</code></pre>',63),
	 (2233,'OCA - Chapter 6 - Question 8','<p>What can be done to get the following code to compile and run? (Assume that the options are independent of each other. Choose all that apply)</p><pre><code class="language-java">public float parseFloat( String s ){
	float f = 0.0f; // 1
	try{
		f = Float.valueOf( s ).floatValue(); // 2
		return f ; // 3
	} catch(NumberFormatException nfe){
		f = Float.NaN ; // 4
		return f; // 5
	} finally {
		return f; // 6
	}
	return f ; // 7
}</code></pre>',63),
	 (2303,'OCP - Chapter 4 - enthuware.ocpjp.v8.2.1791','<p>Identify correct statements about the following code: (select 1 responce)&nbsp;</p><pre><code class="language-java">List&lt;String&gt; vals = Arrays.asList("a", "b");
String join = vals.parallelStream().reduce("_", (a, b)-&gt;a.concat(b));
System.out.println(join);</code></pre>',12),
	 (2563,'OCP - Chapter 8 - Q_5','<p>Given the following code:</p><pre><code class="language-java">public class Data implements java.io.Serializable{
	public static String f1;
	public static transient int f2;
	public transient boolean f3;
	public final static String f4 = "4";
	public String f5 = "5";
	
	public static void main(String[] args) {
		Data d = new Data();
		d.f1 = "f1";
		d.f2 = 2;
		d.f3 = true;
	}
}</code></pre><p>Which fields of the above class will have the same values when the object referred to by the variable ''d'' is serialized and deserialized in another JVM?</p>',16),
	 (2707,'OCA - Chapter 4 - Custom3','<p>What is the output of the following code?</p><pre><code class="language-java">import java.util.*;
import java.util.function.*;
public class Employee {
	private static String name;
	public Employee(String name) { this.name = name; }
	public Boolean canBePromoted() {
		return this.name.equals("Jean-Charles");
	}
}

class EmployeePromoted {
	private static void print(List employees, Predicate checker) {
		for (Employee employee : employees) {
			System.out.print(checker.test(employee));
		}
	}
	public static void main(String[] args) {
		List employees = new ArrayList&lt;&gt;();
		employees.add(new Employee("Jean-Charles"));
		employees.add(new Employee("Jean-Eudes"));
		print(employees, e -&gt; e.canBePromoted());
	}
}</code></pre>',61),
	 (2711,'OCA - Chapter 4 - Q18 : Creating Constructors','<p>Which of the following are true?</p>',61),
	 (2713,'OCA - Chapter 4 - Q20 : New object and This()','<p>Which code can be inserted to have the code print 2?</p><pre><code class="language-java">public class BirdSeed {
	private int numberBags;
	boolean call;
	public BirdSeed() {
		// LINE 1
		call = false;
		// LINE 2
	}
	public BirdSeed(int numberBags) { this.numberBags = numberBags; }
	public static void main(String[] args) {
		BirdSeed seed = new BirdSeed();
		System.out.println(seed.numberBags);
	}
}</code></pre>',61),
	 (2742,'OCP - Chapter 6 - Question 1','<p>Which of the following pairs fills in the blanks to make this code compile?</p><pre><code class="language-java">5: public void read() ___________ SQLException {
6: ___________ new SQLException();
7: }</code></pre>',14);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (2775,'OCP - Chapter 6 - Question 6','<p>What is the output of the following code?</p><pre><code class="language-java">import java.io.*;
public class AutocloseableFlow {
	static class Door implements AutoCloseable {
		public void close() {
			System.out.print("D");
			throw new RuntimeException();
		}
	}
	static class Window implements Closeable {
		public void close() {
			System.out.print("W");
			throw new RuntimeException();
		}
	}
	public static void main(String[] args) {
		try { Door d = new Door(); Window w = new Window() } {
			System.out.print("T");
		} catch (Exception e) {
			System.out.print("E");
		} finally { System.out.print("F"); }
} }</code></pre>',14),
	 (2791,'OCP - Chapter 6 - E1Q27 (Red : 6S0GG106173)','<p>What is the output of the following code?</p><pre><code class="language-java">import java.io.*;
public class AutocloseableFlow {
	static class Door implements AutoCloseable {
		public void close() { System.out.print("D"); }
	}
	static class Window implements Closeable {
		public void close() { System.out.print("W"); }
	}
	public static void main(String[] args) {
		try (Door d = new Door(); Window w = new Window()) {
			System.out.print("T");
		} catch (Exception e) {
			System.out.print("E");
		} finally { System.out.print("F"); }
} }</code></pre>',14),
	 (2795,'OCP - Chapter 6 - E3Q14 (Ref : 6S0GG106280)','<p>What is the output of the following code?</p><pre><code class="language-java">import java.io.*;
public class AutocloseableFlow {
	static class Door{
		public void close() { System.out.print("D"); }
	}
	static class Window {
		public void close() { System.out.print("W"); }
	}
	public static void main(String[] args) {
		try (Door d = new Door(); Window w = new Window()) {
			System.out.print("T");
			throw new RuntimeException();
		} catch (Exception e) {
			System.out.print("E");
		} finally { System.out.print("F"); }
} }</code></pre>',14),
	 (2813,'OCP - Chapter 6 - Q20 (Ref : 6S0GG106166)','<p>What is the output of the following code?</p><pre><code class="language-java">import java.io.*;
public class AutocloseableFlow {
	static class Door implements AutoCloseable {
		public void close() {
			System.out.print("D");
			throw new RuntimeException();
		}
	}
	static class Window implements Closeable {
		public void close() {
			System.out.print("W");
			throw new RuntimeException();
		}
	}
	public static void main(String[] args) {
		try (Door d = new Door(); Window w = new Window()) {
			System.out.print("T");
			throw new RuntimeException();
		} catch (Exception e) {
			System.out.print("E");
		} finally { System.out.print("F"); }
} }</code></pre>',14),
	 (2814,'OCP - Chapter 6 - Q27 (Red : 6S0GG106173)','<p>What is the output of the following code?</p><pre><code class="language-java">import java.io.*;
public class AutocloseableFlow {
	static class Door implements AutoCloseable {
		public void close() { System.out.print("D"); }
	}
	static class Window implements Closeable {
		public void close() { System.out.print("W"); }
	}
	public static void main(String[] args) {
		try (Door d = new Door(); Window w = new Window()) {
			System.out.print("T");
		} catch (Exception e) {
			System.out.print("E");
		} finally { System.out.print("F"); }
} }</code></pre>',14),
	 (2836,'OCA - Chapter 3 - JavaDataTypes_Q1','Which of the following declarations does not compile?',60),
	 (2837,'OCA - Chapter 3 - JavaDataTypes_Q2','<p>Which of the following is not a valid class declaration ?</p>',60),
	 (2838,'OCA - Chapter 3 - JavaDataTypes_Q3','<p>Which converts a primitive to a wrapper class object without using autoboxing ?</p>',60),
	 (2839,'OCA - Chapter 3 - JavaDataTypes_Q4','<p>How do you force garbage collection to occur at a certain point ?</p>',60),
	 (2840,'OCA - Chapter 3 - JavaDataTypes_Q5','<p>Which of the following does not compile ?</p>',60);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (2841,'OCA - Chapter 3 - JavaDataTypes_Q6','<p>Which best describes what the "new" keyword does ?</p>',60),
	 (2842,'OCA - Chapter 3 - JavaDataTypes_Q7','<p>Which of the following lists of primitive numeric types is presented in order from smallest to largest data type ?</p>',60),
	 (2843,'OCA - Chapter 3 - JavaDataTypes_Q8','<p>Suppose foo is a reference to an instance of a class. Which of the following is not true about foo.bar ?</p>',60),
	 (2844,'OCA - Chapter 3 - JavaDataTypes_Q9','<p>Which two primitives have wrapper classes that are not merely the name of the primitive with an uppercase letter?</p>',60),
	 (2845,'OCA - Chapter 3 - JavaDataTypes_Q10','<p>Which of the following is not a wrapper class?</p>',60),
	 (2846,'OCA - Chapter 3 - JavaDataTypes_Q11','<p>Which statement is true about primitives?</p>',60),
	 (2847,'OCA - Chapter 3 - JavaDataTypes_Q12','<p>Which of these class names best follows standard Java naming conventions?</p>',60),
	 (2848,'OCA - Chapter 3 - JavaDataTypes_Q13','<p>Which of the following is true about String instance variables?</p>',60),
	 (2849,'OCA - Chapter 3 - JavaDataTypes_Q14','<p>Which of the following is true about primitives?</p>',60),
	 (2850,'OCA - Chapter 3 - JavaDataTypes_Q15','<p>Which is correct about an instance variable of type String ?</p>',60);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (2851,'OCA - Chapter 3 - JavaDataTypes_Q16','<p>Which of the following is a wrapper class?</p>',60),
	 (2852,'OCA - Chapter 3 - JavaDataTypes_Q17','<p>Which of the following is not a valid variable name?</p>',60),
	 (2853,'OCA - Chapter 3 - JavaDataTypes_Q18','<p>What is true of the finalize() method?</p>',60),
	 (2855,'OCA - Chapter 3 - JavaDataTypes_Q20','<p>Which of the following lists of primitive types are presented in order from smallest to largest data type?</p>',60),
	 (2856,'OCA - Chapter 3 - JavaDataTypes_Q21','<p>Which of the following is not a valid order for elements in a class?</p>',60),
	 (2857,'OCA - Chapter 3 - JavaDataTypes_Q22','<p>Which is correct about a local variable of type String?</p>',60),
	 (2910,'OCA - Chapter 3 - Custom3','<p>Which of the following are valid differences between creating Dates in Java 7 (and earlier) and Java 8? (Choose all that apply)</p>',60),
	 (2945,'OCP - Chapter 7 - Enthuware-Question 1104','<p>Consider the following code:&nbsp;</p><pre><code class="language-java">public class Student {
	private Map marksObtained = new HashMap();
	private ReadWriteLock lock = new ReentrantReadWriteLock();
	public void setMarksInSubject(String subject, Integer marks){
		// 1 INSERT CODE HERE
		try{ marksObtained.put(subject, marks); }
		finally{ // 2 INSERT CODE HERE } 
	}
	public double getAverageMarks(){ // valid code that computes average }
} </code></pre><p>What should be inserted at //1 and //2?</p>',15),
	 (2946,'OCP - Chapter 7 - Enthuware-Question 1106','<p>Consider the following code: What should be inserted at //1 and //2?</p><pre><code class="language-java">public class Student {
	private Map marksObtained = new HashMap();
	private ReadWriteLock lock = new ReentrantReadWriteLock();
	public void setMarksInSubject(String subject, Integer marks){
		// valid code to set marks for a given subject
	}
	public double getAverageMarks(){
	//1 - INSERT CODE HERE double
	sum = 0.0;
	try{
		for(Integer mark : marksObtained.values()){
			sum = sum + mark;
		}
	return sum/marksObtained.size();
	}finally{ //2 - INSERT CODE HERE }
} }</code></pre>',15),
	 (2952,'OCP - Chapter 7 - Enthuware - Question 1108','<p>You have multiple threads in your application that need to generate random numbers between 1 to 10 (both inclusive) frequently. Which of the following statements would you use considering overhead and contention as the main criteria?</p>',15);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (2956,'OCP - Chapter 7 - Enthuware - Question 1138','<p>You have a collection (say, an ArrayList) which is read by multiple reader threads and which is modified by a single writer thread. The collection allows multiple concurrent reads but does not tolerate concurrent read and write. Which of the following strategies will you use to obtain best performance ?</p>',15),
	 (2958,'OCP - Chapter 7 - Enthuware - Question 1080','<p>Given:</p><pre><code class="language-java">public class Counter{
	//1
	public void increment(){
		//2
	}
	//other valid code
}</code></pre><p>This class is supposed to keep an accurate count for the number of times the increment method is called. Several classes share an instance of this class and call its increment method. What should be inserted at //1 and //2?</p>',15),
	 (2960,'OCP - Chapter 7 - Enthuware - Question 1257','<p>Which of the following statements are true regarding the Fork/Join framework?</p>',15),
	 (2962,'OCP - Chapter 7 - Enthuware - Question1078','<p>Consider the following class:</p><pre><code class="language-java">public class Counter {
	private int count;
	public void increment(){
		System.out.println(count++);
	}
}</code></pre><p>If two threads call the increment() method on the same Counter instance simultaneously, which of the following are possible outputs? (Assume that there are no other calls to the Counter instance.)</p>',15),
	 (2986,'OCP - Chapter 1 - Q 17','<p>Consider the code of Test.java file:</p><pre><code class="language-java">package com.udayan.ocp;
class Player {
	String name;
	int age; Player() {
		this.name = "Yuvraj";
		this.age = 36;
	}
	public String toString() { return name + ", " + age; }
	public Class getClass() { return super.getClass(); }
}
public class Test {
	public static void main(String[] args) {
		System.out.println(new Player());
} }</code></pre><p>What will be the result of compiling and executing Test class?</p>',9),
	 (3024,'OCP - Chapter 1 - Q12','<p>Consider below code:&nbsp;</p><pre><code class="language-java">//Child.java package com.udayan.ocp;
class Parent {
	public void m() {
		System.out.println("Parent");
	}
}
public abstract class Child extends Parent { //Line 9
	public static void main(String [] args) { //Line 10
		new Parent().m(); //Line 11
	}
} </code></pre><p>What will be the result of compiling and executing Child class?</p>',9),
	 (3028,'OCP - Chapter 1 - Q47','<p>Given the following code:</p><pre><code class="language-java">class Outer {
	public static void innerPrint() {}
	static { 
		class Inner {
			{ System.out.println("I''m in"); }
		} 
		new Inner();
	}
}
public class TestOuter {
	public static void main(String[] args) {
		//Insert
	}
}</code></pre><p>Which of the following options can replace //Insert in order to print ???I???m in????</p>',9),
	 (3066,'OCP - Chapter 10 - Question 6','<p>Identify correct statement(s) regarding the benefit of using PreparedStatement over Statement. Please select 1 option.</p>',57),
	 (3070,'OCP - Chapter 10 - Question 10','<p>Identify the correct statement regarding a JDBC Connection: Please select 1 option.</p>',57),
	 (3071,'OCP - Chapter 10 - Q1','<p>Which interfaces or classes are in a database-specific JAR file ? (Choose all that apply)</p>',57);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (3072,'OCP - Chapter 10 - Q2','<p>Which are required parts of a JDBC URL? (Choose all that apply)</p>',57),
	 (3073,'OCP - Chapter 10 - Q3','<p>Which of the following is a valid JDBC URL ?</p>',57),
	 (3074,'OCP - Chapter 10 - Q4','<p>What file is required inside a JDBC 4.0+ driver JAR ?</p>',57),
	 (3075,'OCP - Chapter 10 - Q5','<p>Suppose that you have a table named animal with two rows. What is the result of the following code ?</p><pre><code class="language-java">6: Connection conn = new Connection(url, username, password);
7: Statement stmt = conn.createStatement();
8: ResultSet rs = stmt.executeQuery("select count(*) from animal");
9: if (rs.next()) System.out.println(rs.getInt(1));</code></pre>',57),
	 (3076,'OCP - Chapter 10 - Q6','<p>Which of the following are true ? (Choose all that apply)</p>',57),
	 (3077,'OCP - Chapter 10 - Q7','<p>Which of the following can fill in the blank ? (Choose all that apply)&nbsp;</p><pre><code class="language-java">public void stmt(Connection conn, int b) throws SQLException {
	Statement stmt = conn.createStatement(____, b);
}</code></pre>',57),
	 (3078,'OCP - Chapter 10 - Q8','<p>Given a valid conn object of type Connection, what will happen if you run this code when the requested mode is not supported ?&nbsp;</p><pre><code class="language-java">conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);</code></pre>',57),
	 (3079,'OCP - Chapter 10 - Q9','<p>Which of the options can fill in the blanks in order to make the code compile ?&nbsp;</p><pre><code class="language-java">boolean bool = stmt.____(sql);
int num = stmt.____(sql);
ResultSet rs = stmt.______(sql);</code></pre>',57),
	 (3080,'OCP - Chapter 10 - Q10','<p>Suppose that the table animal has five rows and this SQL statement updates all of them. What is the result of this code ?</p><pre><code class="language-java">public static void main(String[] args) throws SQLException {
	Connection conn = DriverManager.getConnection("jdbc: derby: zoo");
	Statement stmt = conn.createStatement();
	int result = stmt.executeUpdate("update animal set name = name");
	System.out.println(result);
}</code></pre>',57),
	 (3081,'OCP - Chapter 10 - Q11','<p>Suppose that the table food has five rows and this SQL statement updates all of them. What is the result of this code ?</p><pre><code class="language-java">public static void main(String[] args) {
	Connection conn = DriverManager.getConnection("jdbc: derby: zoo");
	Statement stmt = conn.createStatement();
	int result = stmt.executeUpdate("update food set amount = amount + 1");
	System.out.println(result);
}</code></pre>',57);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (3082,'OCP - Chapter 10 - Q12','<p>Which is the correct order in which to close database ressources ?</p>',57),
	 (3083,'OCP - Chapter 10 - Q13','<p>There are currently 100 rows in the table species before inserting a new row. What is the output of the following code ?</p><pre><code class="language-java">try (Connection conn = DriverManager.getConnection("jdbc: derby: zoo");
Statement stmt = conn.createStatement()) {
	ResultSet rs = stmt.executeQuery("select count(*) from species");
	int num = stmt.executeUpdate("INSERT INTO species VALUES (3, ''Ant'', .05)");
	rs.next();
	System.out.println(rs.getInt(1));
}</code></pre>',57),
	 (3084,'OCP - Chapter 10 - Q14','<p>Which of the following can fill in the blank correctly ? (Choose all that apply)&nbsp;</p><pre><code class="language-java">ResultSet rs = stmt.executeQuery(sql);
if (rs.next()) { ______ }</code></pre>',57),
	 (3085,'OCP - Chapter 10 - Q15','<p>Which of the following can fill in the blank to print the month, date, year, hour, minute and second ?</p>',57),
	 (3086,'OCP - Chapter 10 - Q16','<p>Suppose that you have a table with three rows. The names in those rows are Anna, Betty, and Cat. What does the following output ?</p><pre><code class="language-java">String sql = "select name from animal";
try (Connection conn = DriverManager.getConnection("jdbc: derby: zoo");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql)) {
		rs.next();
		rs.previous();
		rs.previous();
		rs.next();
		rs.next();
		rs.absolute(2);
		System.out.println(rs.getString(1));
	}</code></pre>',57),
	 (3087,'OCP - Chapter 10 - Q17','<p>Which of the following methods move the cursor without returning a boolean ?</p>',57),
	 (3088,'OCP - Chapter 10 - Q18','<p>Suppose that you have a table animal with three rows. The names in those rows are Anna, Betty, and Cat. What does the following output ?</p><pre><code class="language-java">String sql = "select name from animal order by id";
try (Connection conn = DriverManager.getConnection("jdbc: derby: zoo");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql)) {
		rs.absolute(0);
		rs.next();
		System.out.println(rs.getString(1));
	}</code></pre>',57),
	 (3089,'OCP - Chapter 10 - Q19','<p>In a table animal with 10 rows, how many times does true get output by the following ? (Choose all that apply)&nbsp;</p><pre><code class="language-java">String sql = "select * from animal";
try (Connection conn = DriverManager.getConnection("jdbc: derby: zoo");
	Statement stmt = conn.createStatement( ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	ResultSet rs = stmt.executeQuery(sql)) {
		System.out.println(rs.absolute(0));
		System.out.println(rs.absolute(5));
		System.out.println(rs.previous());
		System.out.println(rs.relative(-2));
		System.out.println(rs.relative(-100));
		}</code></pre>',57),
	 (3090,'OCP - Chapter 10 - Q20','<p>In a table animal with 10 rows, how many times does true get output by the following ? (Choose all that apply)&nbsp;</p><pre><code class="language-java">String sql = "select * from animal";
try (Connection conn = DriverManager.getConnection("jdbc: derby: zoo"); 
     Statement stmt = conn.createStatement( ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY); 
     ResultSet rs = stmt.executeQuery(sql)) {
	System.out.println(rs.beforeFirst());
	System.out.println(rs.absolute(5));
	System.out.println(rs.previous());
	System.out.println(rs.relative(-2));
	System.out.println(rs.afterLast());
}</code></pre>',57),
	 (3102,'VueJS_bases_Q12','<p>Laquelle des d??clarations suivantes d??finit le mieux Vue.js ?</p>',3);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (3103,'VueJS_bases_Q13','<p>Pourquoi Vue.js est-il appel?? framework progressif ?</p>',3),
	 (3104,'VueJS_bases_Q14','<p>Quelle est l''utilisation principale de Vue.js ?</p>',3),
	 (3105,'VueJS_bases_Q15','<p>Parmi les propositions suivantes, laquelle est la bonne fa??on d''installer Vue.js dans votre projet ?</p>',841),
	 (3106,'VueJS_bases_Q16','<p>Parmi les propositions suivantes, laquelle est un des avantages ?? utiliser Vue.js ?</p>',3),
	 (3143,'GIT_W3school_QUIZv3_1_25','<p>Qu''est-ce que Git ?</p>',755),
	 (3144,'GIT_W3school_QUIZv3_2_25','<p>Git est l''??quivalent de GitHub</p>',755),
	 (3145,'GIT_W3school_QUIZv3_3_25','<p>Quelle commande pour r??cup??rer la version de Git ?</p>',755),
	 (3146,'GIT_W3school_QUIZv3_4_25','<p>Quelle option utiliser pour d??finir le nom d''utilisateur par d??faut pour tous les d??p??ts git d''un ordinateur ?</p>',824),
	 (3147,'GIT_W3school_QUIZv3_5_25','<p>Quelle commande pour d??finir l''email sur le d??p??t courant ?</p>',824),
	 (3149,'GIT_W3school_QUIZv3_6_25','<p>Quelle commande pour ajouter tous les fichiers et changements du r??pertoire courant ?? l''environnement de ???staging??? du d??p??t Git ?</p>',770);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (3150,'GIT_W3school_QUIZv3_7_25','<p>Quelle commande pour r??cup??rer le statut actuel du d??p??t Git ?</p>',771),
	 (3151,'GIT_W3school_QUIZv3_8_25','<p>Quelle commande pour initialiser un d??p??t Git dans le r??pertoire courant ?</p>',750),
	 (3152,'GIT_W3school_QUIZv3_9_25','<p>Git ajoute automatiquement les nouveaux fichiers du r??pertoire au d??p??t et commence ?? suivre chacun de leurs changements.</p>',770),
	 (3153,'GIT_W3school_QUIZv3_10_25','<p>L''historique des commits Git est automatiquement supprim??:</p>',749),
	 (3154,'GIT_W3school_QUIZv3_11_25','<p>Quelle commande permet de "commit" (fixer dans l''historique des changements des fichiers) les changements en ???staging??? (les changements que l''on a s??lectionn??s) pour le d??p??t Git ?</p>',752),
	 (3155,'GIT_W3school_QUIZv3_12_25','<p>Quelle commande permet de "commit" (fixer dans l''historique des changements des fichiers) avec le message ???New email??? dans l''historique.</p>',774),
	 (3156,'GIT_W3school_QUIZv3_13_25','<p>Quelle commande permet de voir l''historique des "commits" du d??p??t ?</p>',816),
	 (3157,'GIT_W3school_QUIZv3_14_25','<p>Quelle commande permet de voir les options disponibles pour la commande de commit ?</p>',774),
	 (3158,'GIT_W3school_QUIZv3_15_25','<p>Dans Git, une ???branch??? (branche en fran??ais) c''est:</p>',778),
	 (3159,'GIT_W3school_QUIZv3_16_25','<p>Quelle est la commande pour cr??er une nouvelle branche nomm??e ???new-email??? ?</p>',778);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (3160,'GIT_W3school_QUIZv3_17_25','<p>Quelle est la commande pour se d??placer vers la "branch" nomm??e ???new-email??? ?</p>',778),
	 (3161,'GIT_W3school_QUIZv3_18_25','<p>Quelle est l''option, lors d''un d??placement vers une "branch", de cr??er la branche si elle n''existe pas encore ?</p>',797),
	 (3162,'GIT_W3school_QUIZv3_19_25','<p>Quelle est la commande pour fusionner la branche courante avec la branche ???new-email???</p>',803),
	 (3163,'GIT_W3school_QUIZv3_20_25','<p>Quelle est la commande pour supprimer la branche ???new-email???</p>',798),
	 (3165,'GIT_W3school_QUIZv3_22_25','<p>Quelle est la commande pour ???push??? (pousser nos changements vers un d??p??t distant) le d??p??t courant vers le d??p??t distant "origin" ?</p>',752),
	 (3166,'GIT_W3school_QUIZv3_23_25','<p>Quelle est la commande pour r??cup??rer tous les changements synchronis??s sur le d??p??t distant ???origin??? ?</p>',753),
	 (3167,'GIT_W3school_QUIZv3_24_25','<p>Quelle est la commande pour montrer les diff??rences entre la branche actuelle et la branche nomm??e ???new-email??? ?</p>',816),
	 (3169,'GIT_W3school_QUIZv3_25_25','<p>Git Pull est la combinaison de:</p>',812),
	 (3200,'OCP11_CHAP14_Review_17','<p>Quelles propositions peuvent ind??pendamment remplir les blancs pour que le code compile ?</p><pre><code class="language-java">1: public class Generic________ {
2:   public static void main(String[] args) {
3:     Generic&lt;String&gt; g = new Generic________();
4:     Generic&lt;String&gt; g2 = new Generic();
5:   }
6: }</code></pre>',204),
	 (3204,'SPRING_AOP_1','<p>Quel probl??me r??sout l''AOP ? &nbsp;</p>',154);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (3209,'OCP11_CHAP14_Review_25','<p>Quel est le r??sultat du code suivant ?</p><pre><code class="language-java">var map = new HashMap&lt;Integer, Integer&gt;();
map.put(1, 10);
map.put(2, 20);
map.put(3, null);
map.merge(1, 3, (a,b) -&gt; a + b);
map.merge(3, 3, (a,b) -&gt; a + b);
System.out.println(map);</code></pre>',32),
	 (3212,'SPRING_AOP_4','<p>Qu''est-ce qu''un <i><strong>Advice </strong></i>?</p>',154),
	 (3217,'SPRING_AOP_9','<p>A quoi fait r??f??rence le mot <i><strong>weaving</strong></i> &nbsp;(tissage) en AOP?</p>',154),
	 (3229,'VueJS_directives_Q28','<p>Quelle est l''abr??viation pour v-bind: ?</p>',836),
	 (3230,'VueJS_directives_Q29','<p>Quelle est l''abr??viation pour v-on: ?</p>',835),
	 (3231,'VueJS_directives_Q30','<p>Quelle est l''abr??viation pour v-model: ?</p>',837),
	 (3232,'VueJS_directives_Q31','<p>Lequel des modificateurs suivants est tr??s utile pour am??liorer les performances des appareils mobiles ?</p>',832),
	 (3234,'VueJS_directives_Q32','<p>Lequel des modificateurs d''??v??nement suivants devrions-nous utiliser pour effectuer l''??v??nement de clic une seule fois ?</p>',832),
	 (3246,'Node_Events1','<p>Quel est le r??sultat de ce code?</p><p>&nbsp;</p><pre><code class="language-javascript">import EventEmitter from "events";

const emitter = new EventEmitter();
emitter.on("logMessage", console.log);
emitter.emit("logMessage", "a");
emitter.emit("logMessage", "b");</code></pre>',23),
	 (3247,'Node_Events2','<p>Quel est le r??sultat de ce code?</p><p>&nbsp;</p><pre><code class="language-javascript">import EventEmitter from "events";

EventEmitter.on("logMessage", console.log);
EventEmitter.emit("logMessage", "a");
EventEmitter.emit("logMessage", "b");</code></pre>',23);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (3249,'Node_Events3','<p>Quel est le r??sultat de ce code?</p><p>&nbsp;</p><pre><code class="language-javascript">import EventEmitter from "events";

const emitter = new EventEmitter();
emitter.once("logMessage", console.log);
emitter.emit("logMessage", "a");
emitter.emit("logMessage", "b");</code></pre>',23),
	 (3250,'Node_Events4','<p>Quel est le r??sultat de ce code?</p><p>&nbsp;</p><pre><code class="language-javascript">import EventEmitter from "events";

const emitter = new EventEmitter();
emitter.on("logMessage", console.log);
emitter.emit("a");
emitter.emit("b");</code></pre>',23),
	 (3252,'Node_Events5','<p>Quel est le r??sultat de ce code?</p><p>&nbsp;</p><pre><code class="language-javascript">import EventEmitter from "events";

const emitter = new EventEmitter();
emitter.once("logMessage", console.log);
emitter.on("logMessage", console.log);
emitter.emit("logMessage", "a");
emitter.emit("logMessage", "b");</code></pre>',23),
	 (3268,'Node_Events6','<p>Quel est le r??sultat de ce code?</p><p>&nbsp;</p><pre><code class="language-javascript">import EventEmitter from "events";

const myEmitter = new EventEmitter();
myEmitter.on(''event'', (arg) =&gt; {
  setImmediate(() =&gt; {
    console.log(arg);
  });
});
console.log("a")
myEmitter.emit(''event'', ''b'');
console.log("c")</code></pre>',23),
	 (3517,'VueJS_directives_Q33','<p>Laquelle de ces propositions n''est pas une directive ?</p>',832),
	 (3518,'VueJS_CLI_Q9','<p>Comment peut-on appeler un composant personnalis?? qui a pour nom my-component ?</p>',825),
	 (3519,'VueJS_CLI_Q10','<p>Quels sont les avantages ?? utiliser Vue CLI pour cr??er des applications web ?</p>',852),
	 (3520,'VueJS_lifecycle_Q4','<p>Quel est le bon ordre d''ex??cution de ces hooks de composant ?</p>',827);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (3521,'VueJS_lifecycle_Q5','<p>Quel est le bon ordre d''ex??cution de ces hooks de composant ?</p>',827),
	 (3522,'Node: CLI','<p>Que se passe-t''il quand on ??crit node dans la console sans argument?</p>',22),
	 (3523,'VueJS_lifecycle_Q6','<p>Laquelle de ces propositions n''est pas un lifecycle hook en Vue.js ?</p>',827),
	 (3524,'VueJS_lifecycle_Q7','<p>Laquelle de ces propositions n''est pas un lifecycle hook en Vue.js ?</p>',827),
	 (3525,'Node: CLI_2','<p>Quelle raccourci REPL correspond ?? .exit?</p>',22),
	 (3526,'Node: CLI_3','<p>Quelle raccourci REPL correspond ?? .break?</p>',22),
	 (3527,'Node: CLI_4','<p>Peut-on lancer le REPL depuis un fichier? Si oui, comment?</p>',22),
	 (3528,'Node: CLI_5','<p>En REPL, il est n??cessaire de require les sous-modules de Node pour pouvoir les utiliser.</p>',22),
	 (3530,'Node: CLI_6','<p>La console affiche en REPL les informations suivantes. Quel va ??tre le r??sultat une fois que l''on appuiera sur enter?</p><pre><code class="language-javascript">&gt; [ ''a'', ''b'', ''c'' ]
[ ''a'', ''b'', ''c'' ]
&gt; _.length</code></pre>',22),
	 (3531,'Node: CLI_7','<p>Y a-t''il un ??quivalent ?? _ pour r??cup??rer les valeurs en REPL? Si oui, lequel?</p>',22);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (3606,'VueJS_CLI_Q11','<p>Quelle est la commande pour installer Vue CLI ?</p>',852),
	 (3607,'VueJS_CLI_Q12','<p>Quelle est la commande pour cr??er un projet my-project avec Vue CLI ?</p>',852),
	 (3644,'OCP11_CHAP18_Review_24','<p>Quelles propositions concernant le code suivant sont correctes ?</p><pre><code class="language-java">public class TicketManager {
    private int tickets;
    private static TicketManager instance;
    private TicketManager() {}
    static synchronized TicketManager getInstance() {      // k1
        if (instance==null) instance = new TicketManager(); // k2
        return instance;
    }
 
    public int getTicketCount() { return tickets; }
    public void addTickets(int value) {tickets += value;}  // k3
    public void sellTickets(int value) {
        synchronized (this) { // k4
            tickets -= value;
        }
    }
}</code></pre>',419),
	 (3873,'Node: CLI_8','<p>async/await &nbsp;n''est pas support?? en REPL</p>',22),
	 (3876,'Node: CLI_9','<p>Pour d??marrer un server REPL, quelle autre ??criture est possible que:</p><pre><code class="language-javascript">new repl.REPLServer();</code></pre>',22),
	 (3879,'Node: CLI_10','<p>Il est possible de cr??er de nouvelles commandes REPL comme .break ou .exit</p>',22),
	 (3890,'Node: CLI_11','<p>defineCommand prend en deuxi??me param??tre soit un objet soit une fonction. Quelle ??criture est pr??f??rable?</p>',22),
	 (3893,'Node: CLI_12','<p>Quels sont les propri??t??s qu''options peut avoir dans le code suivant qui sera utilis???</p><p>&nbsp;</p><pre><code class="language-javascript">replServer.defineCommand("sayhello", options);</code></pre>',22),
	 (3895,'Node: CLI_13','<p>Quels sont les propri??t??s qu''options peut avoir dans le code suivant qui sera utilis???</p><p>&nbsp;</p><pre><code class="language-javascript">replServer.defineCommand("sayhello", options);</code></pre>',22),
	 (3956,'Node: CLI_14','<p>Comment peut-on d??marrer le debugger de Node en CLI?</p>',22);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (3957,'Node: CLI_15','<p>Comment peut-on mettre un breakpoint sur lequel le debugger de Node s''arr??te?</p>',22),
	 (3958,'Node: CLI_16','<p>Comment peut-on suivre l''??tat d''une variable en mode debugger depuis la CLI?</p>',22),
	 (3959,'Node: Buffers_1','<p>Comment peut-on cr??er un Buffer en Node.JS?</p>',24),
	 (3960,'Node: Buffers_2','<p>_____ est moins performant mais garanti l''int??grit?? et s??curit?? des donn??es, tandis que ______ est plus performant au prix de potentielles vuln??rabilit??s</p>',24),
	 (3961,'Node: Buffers_3','<p>Quel est le cas d''utilisation de Buffer.from()?</p>',24),
	 (3984,'VueJS_VueX_Q1','<p>Qu''est-ce que VueX ?</p>',844),
	 (3985,'VueJS_VueX_Q2','<p>Comment installer VueX ?</p>',849),
	 (3986,'Node: Buffers_4','<p>Quel est le r??sultat de ce code?</p><p>&nbsp;</p><pre><code class="language-javascript">import { Buffer } from "buffer";

const buffer = Buffer.from(18);
buffer.write("Hello", "utf-8");
console.log(buffer.toString());</code></pre>',24),
	 (3987,'Node: Buffers_5','<p>Quel est le r??sultat de ce code?</p><p>&nbsp;</p><pre><code class="language-javascript">import { Buffer } from "buffer";

const buffer = Buffer.alloc(18);
buffer.write("Hello world", "utf16le");
console.log(buffer.toString());</code></pre>',24),
	 (3988,'Node: Buffers_6','<p>Quel est le r??sultat de ce code?</p><p>&nbsp;</p><pre><code class="language-javascript">import { Buffer } from "buffer";

const buffer = Buffer.alloc(18);
buffer.write("Hello", "utf16le");
console.log(buffer.toJSON());</code></pre>',24);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (3989,'Node: Buffers_7','<p>Quel est le r??sultat de ce code?</p><p>&nbsp;</p><pre><code class="language-javascript">import { Buffer } from "buffer";

const buffer = Buffer.alloc(18);
buffer.write("Hello", "utf16le");
console.log(buffer);</code></pre>',24),
	 (3990,'VueJS_VueX_Q3','<p>Est-ce que c''est possible de muter directement l''??tat du store ?</p>',846),
	 (3991,'Node: Buffers_8','<p>Quel est le r??sultat de ce code?</p><p>&nbsp;</p><pre><code class="language-javascript">import { Buffer } from "buffer";

const buffer = Buffer.from("Hello");
console.log(buffer.toString());</code></pre>',24),
	 (3994,'VueJS_VueX_Q4','<p>Pourquoi la gestion d''??tat (state management) est-elle importante ?</p>',844),
	 (3996,'Node: Buffers_10','<p>Quel est le r??sultat de ce code?</p><p>&nbsp;</p><pre><code class="language-javascript">import { Buffer } from "buffer";

const buffer = Buffer.alloc(5, "a")
console.log(buffer);</code></pre>',24),
	 (3997,'VueJS_VueX_Q5','<p>Quelle partie de Vuex est charg??e d''apporter directement des modifications au data store ?</p>',846),
	 (3999,'VueJS_VueX_Q7','<p>Quelle partie de Vuex est responsable de la gestion de la logique qui peut d??clencher des changements dans le data store ?</p>',846),
	 (4000,'Node: Buffers_11','<p>Comment mesurer la taille d''un Buffer (nomm?? buff) ?</p>',24),
	 (4002,'VueJS_VueX_Q8','<p>Quel est le mot cl?? pour d??clencher une mutation ?</p>',848);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (4023,'VueJS_VueX_Q9','<p>Quelle est la syntaxe la plus courante pour acc??der aux actions d''un store Vuex dans un composant ?</p>',849),
	 (4024,'Node: Buffers_12','<p>Quel est le r??sultat du code suivant?</p><p>&nbsp;</p><pre><code class="language-javascript">import { Buffer } from "buffer";

const buffer = Buffer.from("Hello world");
console.log(buffer[0]);</code></pre>',24),
	 (4025,'Node: Buffers_13','<p>Peut-on it??rer sur un Buffer?</p>',24),
	 (4026,'Node: Buffers_14','<p>Quel type d''objet Javascript est ??quivalent aux Buffer de Node.JS?</p>',24),
	 (4030,'Node: Buffers_15','<p>Quel est le r??sultat du code suivant?&nbsp;</p><p>&nbsp;</p><pre><code class="language-javascript">import { Buffer } from "buffer";

const buffer = Buffer.from("Hello world")
const copiedBuffer = buffer.slice();
copiedBuffer[0]++;
console.log(buffer.toString(), copiedBuffer.toString());
</code></pre>',24),
	 (4031,'Node: Buffers_16','<p>Quel est le r??sultat du code suivant?&nbsp;</p><p>&nbsp;</p><pre><code class="language-javascript">import { Buffer } from "buffer";

const buffer = Buffer.from("Hello world")
const copiedBuffer = Uint8Array.prototype.slice.call(buffer);
copiedBuffer[0]++;
console.log(buffer.toString(), copiedBuffer.toString());
</code></pre>',24),
	 (4033,'VueJS_VueX_Q10','<p>Quelle op??ration sur le store Vuex est asynchrone ?</p>',846),
	 (4035,'Node: Buffers_17','<p>Si l''on passe un Uint8Array en argument ?? la m??thode Buffer.isBuffer(), quel est le r??sultat?<br>&nbsp;</p>',24),
	 (4037,'Node: Buffers_18','<p>Quel est le r??sultat du code suivant?</p><p>&nbsp;</p><pre><code class="language-javascript">import { Buffer } from "buffer";

const buffer = Buffer.alloc(25)
buffer.write("Hello")
buffer.write(" world")
console.log(buffer.toString());
</code></pre>',24),
	 (4038,'Node: Buffers_19','<p>Quel est le r??sultat du code suivant?</p><p>&nbsp;</p><pre><code class="language-javascript">import { Buffer } from "buffer";

const buf1 = Buffer.alloc(5).fill(''?'');
const buf2 = Buffer.alloc(5).fill(''!'');
buf1.copy(buf2);
console.log(buf1.toString())</code></pre>',24);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (4044,'AOP 1','<p>Consid??rant cet aspect :&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">@Component
@Aspect
public class MathAOP {
	
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Pointcut(value = "execution(* com.excilys.kataspring.service.MathService.*(..))")
	private void multiplyMethod() {}
	
	@Around(value="multiplyMethod()")
	public double multiply(ProceedingJoinPoint joinpoint) {
		try {
			joinpoint.proceed();
		} catch (Throwable e) {
			logger.info(e.getMessage());
		}
		return 2;
	}
}</code></pre><p>Que retournera un appel ?? la m??thode MathService.multiply(3, 4) ?</p>',154),
	 (4045,'AOP 2','<p>En consid??rant l''aspect suivant :&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">@Component
@Aspect
public class MathAOP {
	
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Pointcut(value = "execution(* com.excilys.kataspring.service.MathService.*(..))")
	private void multiplyMethod() {}
	
	@Around(value="multiplyMethod()")
	public double multiply(ProceedingJoinPoint joinpoint) {
		try {
			return (double)joinpoint.proceed();
		} catch (Throwable e) {
			logger.error(e.getMessage());
		}
		return 2;
	}
}</code></pre><p>Que retournera un appel ?? la m??thode MathService.multiply(3,4) ?</p><p>&nbsp;</p>',154),
	 (4046,'AOP 3','<p>En consid??rant l''aspect suivant :&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">@Component
@Aspect
public class MathAOP {
	
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Pointcut(value = "execution(* com.excilys.kataspring.service.MathService.*(..))")
	private void multiplyMethod() {}
	
	@Before(value="multiplyMethod()")
	public void beforMultiply(JoinPoint joinpoint) {
		logger.info("--in before aop");
	}
	
	@Around(value="multiplyMethod()")
	public double multiply(ProceedingJoinPoint joinpoint) {
		logger.info("--in around aop");
		try {
			return (double)joinpoint.proceed();
		} catch (Throwable e) {
			logger.info(e.getMessage());
		}
		return 2;
	}
}</code></pre><p>A l''appel de la m??thode MathService.multiply(3,4), que contiendront les logs ?</p><p>&nbsp;</p>',154),
	 (4047,'AOP 4','<p>En consid??rant l''aspect suivant :&nbsp;</p><p>&nbsp;</p><pre><code class="language-java">@Component
@Aspect
public class MathAOP {
	
     private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Pointcut(value = "execution(* com.excilys.kataspring.service.MathService.*(..))")
	private void multiplyMethod() {}
	
	@Before(value="multiplyMethod()")
	public void beforMultiply(JoinPoint joinpoint) {
		logger.info("----------------in before aop");
	}
	
	@Around(value="multiplyMethod()")
	public double multiply(ProceedingJoinPoint joinpoint) {
		logger.info("---------------in around aop");
		
		return 2;
	}
}</code></pre><p>A l''appel de la m??thode MathService.multiply(3,4), que contiendront les logs ?</p><p>&nbsp;</p>',154),
	 (4048,'AOP 5','<p>Lesquels sont des Advice valides ? (plusieurs r??ponses attendues)</p>',154),
	 (4049,'AOP 6','<p>Lesquels sont des Advice valides ? (plusieurs r??ponses attendues)</p>',154),
	 (4050,'AOP 7','<p>Lesquels sont des Advice valides ? (plusieurs r??ponses attendues)</p>',154),
	 (4051,'Node: Buffers_20','<p>On peut it??rer directement sur un Buffer</p>',24),
	 (4052,'Node: Buffers_21','<p>Un Buffer rempli les conditions du protocole it??rateur, n??cessaire pour pouvoir ??tre it??rable (avec par exemple for???of)&nbsp;</p>',24),
	 (4053,'Node: Buffers_22','<p>Quelles fonctions existent pour it??rer sur les valeurs d''un Buffer buff?</p>',24);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (4054,'Node: Buffers_23','<p>Comment peut-on v??rifier l''??galit?? entre deux buffers?</p>',24),
	 (4088,'Spring 3','<p>Vous souhaitez cr??er un aspect qui permet de logguer le temps d???ex??cution d???une m??thode de votre module m??tier. Vous n???avez pas besoin de vous occuper des exceptions. Par quelle annotation devriez-vous remplacer XXXX ?</p><p>&nbsp;</p><pre><code class="language-java">@Aspect
public class TimerLoggingAspect {
	XXXX(???org.my.service.Component.work()???)
	public Object measureTime(ProceedingJoinPoint pjp) throws Throwable {
		??????
	}
}</code></pre><p><br>&nbsp;</p>',154),
	 (4089,'Spring 4','<p>Que se passe-t-il losqu''un bean annot?? avec @Autowired n''est pas trouv?? dans le context ?&nbsp;</p>',154),
	 (4090,'Spring 5','<p>S??lectionner les annotations AOP valides</p>',154),
	 (4103,'Spring 17','<p>Vous souhaitez ex??cuter une m??thode advice (AOP) apr??s un point de jointure (join point), mais seulement dans le cas o?? celle-ci se d??roule sans probl??me, c???est-??-dire sans lever d???exception. Comment annoter cette m??thode ?</p>',154),
	 (4109,'Git 1','<p>Quelle commande affiche pour chaque ligne de code du fichier index.html la r??vision et l???auteur correspondant ?? la derni??re modification de cette ligne ?</p>',816),
	 (4112,'Git 4','<p>&nbsp;Quelle commande permet de push une branche ???feature??? qui n???existe pas sur le d??p??t distant ?</p>',776),
	 (4113,'Git 5','<p>Quelle commande permet de r??cup??rer les nouvelles donn??es d???un d??p??t distant sans pour autant combiner les donn??es avec les fichiers de votre espace de travail ?&nbsp;</p>',753),
	 (4114,'Git 6','<p>Quelle fonctionnalit?? de Github met ?? disposition une interface Web conviviale pour notifier les membres d???une ??quipe projet de la fin d???un d??veloppement et permet ensuite que les changements propos??s soient revus puis int??gr??s dans la branche master ?</p>',754),
	 (4115,'Git 7','<p>Quelle commande devrait ??tre utilis??e pour annuler un commit sans supprimer le commit de l???historique ?&nbsp;</p>',775);
INSERT INTO question (id,title,`statement`,chapter_id) VALUES
	 (4116,'Git 8','<p>Quelle option de la ligne de commande permet de sp??cifier un commentaire de commit ?? l???ex??cution de git commit ?</p>',774),
	 (4117,'Git 9','<p>Que fait la commande git commit ?</p>',774),
	 (4118,'Git 10','<p>Qu???est-ce qui est vrai ?? propos des branches Git ? (Plusieurs r??ponses attendues)</p>',778),
	 (4119,'Git 11','<p>A l???ex??cution de <i>git clone &lt;remote repository&gt;</i>, quels fichiers sont ajout??s au r??pertoire local ?</p>',762),
	 (4120,'Git 12','<p>Quel fichier mis ?? la racine de votre d??p??t est utilis?? par Github pour afficher un r??sum?? ou de la documentation relative ?? votre projet ?</p>',749),
	 (4121,'Git 13','<p>On consid??re l???historique de commits suivant :&nbsp;</p><p><img src="https://lh3.googleusercontent.com/e7jWeIJLVsOkeMEeplmkk9Up6qZ_1RYSo-aUF1NSvOFbu2i-alWzBf4rdabSZN5sXBCYch6ZG1dleefrnc0nT9qrKkj6zs5MBj5tSkUBr3W4uQZKHB1LFXSgfoeAEpV3jTdm2Bg"></p><p>La HEAD se situe au commit F, vous r??alisez que vos derniers commits sont incorrects et vous voulez donc changer votre branche courante pour pointer vers le commit C et faire en sorte que tous vos fichiers de travail soient identiques ?? ceux du commit C. Parmi les propositions suivantes, quelle est celle que vous devriez ex??cuter ?</p><p><br>&nbsp;</p>',790),
	 (4122,'Git 14','<p>&nbsp;Qu???est ce qui est vrai ?? propos de la commande git init ?</p>',760),
	 (4123,'Git 15','<p>Que fait la commande git remote show origin ? (Plusieurs r??ponses attendues)</p>',749),
	 (4127,'Spring Core 1','<p>Quelle affirmation est vraie ?</p>',147),
	 (4128,'Spring Core 2','<p>Quelles affirmations sont vraies ?</p>',147);

INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Oui', 1, 314);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Non', 0, 314);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'cars', 0, 364);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'cars carts', 0, 364);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'ccars arts', 0, 364);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code does not compile', 0, 364);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code compiles but throws an exception at runtime', 1, 364);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '-, +, =, --', 0, 365);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '%, *, /, +', 0, 365);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '=, +, /, *', 1, 365);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '^, +, -, ==', 0, 365);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', '*, /, %, --', 1, 365);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'public byte getNose(String nose)', 0, 366);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'public void setHead(int head)', 1, 366);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'public String getShoulders()', 1, 366);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'public long isMouth()', 0, 366);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'public void gimmeEars()', 0, 366);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'public boolean isToes()', 1, 366);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'One line needs to be changed for this code to compile', 1, 367);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Two lines need to be changed for this code to compile', 0, 367);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Three lines need to be changed for this code to compile', 0, 367);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'If the code is fixed to compile, none of the cells in the 2D array have a value of 0.', 0, 367);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'If the code is fixed to compile, half of the cells in the 2D array have a value of 0.', 1, 367);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'If the code is fixed to compile, all of the cells in the 2D array have a value of 0.', 0, 367);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'An Error should be thrown if a file system resource becomes temporarily unavailable.', 0, 368);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'An application should never catch an Error.', 1, 368);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Error is a subclass of Exception, making it a checked exception.', 0, 368);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'It is possible to catch and handle an Error thrown in an application.', 1, 368);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'An Error should be thrown if a user enters invalid input.', 0, 368);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'forest.Bird', 1, 369);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'savana.sand.Wave', 0, 369);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'jungle.tree.Huicongo', 1, 369);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'java.lang.Object', 1, 369);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'forest.Sloth', 0, 369);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'forest.ape.bonobo', 0, 369);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'None', 0, 370);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'One', 0, 370);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Two', 1, 370);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Three', 0, 370);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Four', 0, 370);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'None of the above - this code doesn''t compile', 0, 370);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Leaves growing', 0, 371);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'ing', 0, 371);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'wing', 1, 371);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code does not compile', 0, 371);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code compiles but throws an exception at runtime', 0, 371);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'false false false', 0, 372);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'true true true', 0, 372);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'false true true', 0, 372);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'false false true', 1, 372);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'It does not compile', 0, 372);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'One', 0, 373);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Two', 0, 373);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Three', 1, 373);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Four', 0, 373);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Five', 0, 373);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'None. The code does not compile', 0, 373);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Lines 15 and 17', 1, 374);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Lines 15, 16 and 21', 1, 374);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Line 17', 1, 374);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Lines 17, 18 and 20', 0, 374);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Line 20', 0, 374);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Line 21', 0, 374);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '1234', 0, 375);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '1234.0', 1, 375);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '1234.0L', 1, 375);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '1234l', 0, 375);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', '1234L', 0, 375);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', '1_234', 0, 375);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'None', 1, 376);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'One', 0, 376);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Two', 0, 376);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'This is an infinite loop', 0, 376);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code does not compile', 0, 376);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'A', 0, 377);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '6', 0, 377);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The code does not compile', 0, 377);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code compiles but throws a NullPointerException at runtime', 1, 377);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code compiles but throws a different exception at runtime', 0, 377);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'The output is not guaranteed', 0, 377);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'List a = new ArrayList();', 0, 378);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'List b = new ArrayList();', 0, 378);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'List c = new ArrayList();', 1, 378);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'List d = new ArrayList();', 0, 378);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'List e = new ArrayList();', 1, 378);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'List f = new ArrayList();', 0, 378);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'No objects are eligible for garbage collection.', 0, 379);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'One object is eligible for garbage collection.', 1, 379);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Two objects are eligible for garbage collection.', 0, 379);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'No objects are guaranteed to be garbage collected.', 1, 379);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'One object is guaranteed to be garbage collected', 0, 379);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Two objects are guaranteed to be garbage collected.', 0, 379);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'None. The code compiles and prints swim!', 0, 380);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'None. The code compiles and prints a stack trace', 0, 380);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'One', 1, 380);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Two', 0, 380);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Three', 0, 380);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'One', 1, 381);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Two', 0, 381);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Three', 0, 381);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'None. It doesn''t compile', 0, 381);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'None. It throws an exception at runtime', 0, 381);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'I only', 0, 382);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'II only', 0, 382);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'III only', 0, 382);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'IV only', 0, 382);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'I or II, or both', 0, 382);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'None of the above', 1, 382);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '5', 1, 383);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '7', 0, 383);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '8', 0, 383);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code does not compile', 0, 383);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code compiles but throws an exception at runtime', 0, 383);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '0 1', 0, 384);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '1 1', 0, 384);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '1 2', 1, 384);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '2 2', 0, 384);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code does not compile', 0, 384);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'The code compiles but produces an exception at runtime', 0, 384);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'b', 1, 385);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'black', 0, 385);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'lack', 0, 385);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code does not compile', 0, 385);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code compiles but throws an exception at runtime', 0, 385);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'default', 1, 386);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'protected', 0, 386);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'static', 1, 386);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'private', 0, 386);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'final', 0, 386);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'abstract', 1, 386);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'null', 0, 387);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'shoelace', 0, 387);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'shoelaceshoelace', 0, 387);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code does not compile', 1, 387);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'This is an infinite loop', 0, 387);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'The code compiles but throws an exception at runtime', 0, 387);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'If the file does not contain a package statement, then the compiler considers the class part of the java.lang package.', 0, 388);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'The compiler assumes every class implicitly imports the java.lang.* package.', 1, 388);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The compiler assumes every class implicitly imports the java.util.* package.', 0, 388);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Java requires every file to declare a package statement.', 0, 388);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Java requires every file to declare at least one import statement.', 0, 388);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'If the class declaration does not extend another class, then it implicitly extends the java.lang.Object class.', 1, 388);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Grow!', 0, 389);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Growing!', 0, 389);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Super Growing!', 0, 389);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'It does not compile because of line m1', 1, 389);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'It does not compile because of line m2', 0, 389);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'It does not compile because of line m3', 0, 389);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'The declaration of name does not compile', 0, 390);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'The declaration of _number does not compile', 0, 390);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The declaration of profit$$$ does not compile', 0, 390);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The println statement does not compile', 1, 390);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code compiles and runs successfully', 0, 390);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'The code compiles and throws an exception at runtime', 0, 390);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'x--, ++x', 1, 391);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'x--, x++', 0, 391);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '--x, x++', 0, 391);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '--x, ++x', 0, 391);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'public Big(boolean stillIn)', 0, 392);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'public Trouble()', 1, 392);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'public Trouble(int deep)', 1, 392);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'public Trouble(String now, int... deep)', 0, 392);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'public Trouble(long deep)', 1, 392);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'public Trouble(double test)', 0, 392);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'final int min, max = 100;', 0, 393);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'final int min = 0, max = 100;', 0, 393);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'int min, max = 100;', 0, 393);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'int min = 0, max = 100;', 0, 393);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'static int min, max = 100;', 1, 393);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'static int min = 0, max = 100;', 1, 393);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Both right-hand sides of the ternary expression will be evaluated at runtime.', 0, 394);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'A switch statement may contain at most one default statement', 1, 394);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'A single if-then statement can have multiple else statements.', 0, 394);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The | and || operator are interchangeable, always producing the same results at runtime.', 0, 394);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The ! operator may not be applied to numeric expressions.', 1, 394);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'r', 0, 395);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'e', 0, 395);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'ed', 1, 395);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'red', 0, 395);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code does not compile', 0, 395);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'The code compiles but throws an exception at runtime', 0, 395);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '_____()', 1, 396);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '%run()', 0, 396);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'check-Activity()', 0, 396);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '$Hum2()', 1, 396);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'sing\\\\3()', 0, 396);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'po#ut ()', 0, 396);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Inheritance is better than using static methods for accessing data in other classes.', 0, 397);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Inheritance allows a method to be overridden in a subclass, possibly changing the expected behavior of other methods in a superclass', 1, 397);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Inheritance allows objects to inherit commonly used attributes and methods', 1, 397);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'It is possible to create a Java class that does not inherit from any other', 0, 397);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Inheritance tends to make applications more complicated', 0, 397);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'I only', 0, 398);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'II only', 0, 398);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'II and III', 0, 398);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'I, III and IV', 0, 398);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'I, II, III, and IV', 1, 398);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'None are true', 0, 398);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '2 2', 0, 399);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '2 3', 0, 399);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '3 2', 1, 399);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '3 3', 0, 399);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code does not compile', 0, 399);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'The code compiles but throws an exception at runtime', 0, 399);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Character', 1, 400);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Byte', 1, 400);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Double', 0, 400);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'long', 0, 400);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'String', 1, 400);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Object', 0, 400);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'It prints true', 0, 401);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'It prints false', 0, 401);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'It doesn''t compile due to line k1', 0, 401);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'It doesn''t compile due to line k2', 1, 401);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'It doesn''t compile due to another line', 0, 401);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '/** Insert */ in next method **/', 0, 402);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '/****** Find the kitty cat */', 1, 402);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '// Is this a bug ?', 1, 402);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '/ Begin method - performStart() /', 0, 402);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', '/*** TODO: Call grandma ***/', 1, 402);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', '# Updated code by Patti', 0, 402);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'import static food.Grass.getGrass;
    import static food.Grass.seeds', 1, 403);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'import static food.*;', 0, 403);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'static import food.Grass.*;', 0, 403);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'import food.Grass.*;', 0, 403);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'static import food.Grass.getGrass; 
    static import food.Grass.seeds;', 0, 403);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'import static food.Grass.*;', 1, 403);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '[Natural History, Science]', 0, 404);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '[Natural History, Science, Art]', 0, 404);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The code does not compile.', 0, 404);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code compiles but throws an exception at runtime.', 1, 404);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Change name to _name', 1, 405);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Change 10017 to _10017', 0, 405);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Change 10017 to 10017_', 0, 405);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Change 10017 to 10_0_17', 1, 405);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Change int to _int', 0, 405);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '[]', 0, 406);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '[0, 01, 1, 10]', 1, 406);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '[0, 01, 10, 1]', 0, 406);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '[0, 1, 01, 10]', 0, 406);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code does not compile', 0, 406);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'The code compiles but throws an exception at runtime.', 0, 406);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'final, package-private', 0, 407);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'class, static', 0, 407);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'protected, instance', 0, 407);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'public, static', 1, 407);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'default, public', 0, 407);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'One', 1, 408);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Four', 0, 408);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Five', 0, 408);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code does not compile', 0, 408);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code compiles but throws an exception at runtime', 0, 408);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'The javac command compiles a source text file into a set of machine instructions.', 0, 409);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'The java command compiles a .class file into a .java file.', 0, 409);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The javac command compiles a .java file into a .class file.', 1, 409);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The javac command compiles a source text file into a bytecode file.', 1, 409);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The java command compiles a .java file into a .class file.', 0, 409);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'The javac command compiles a .class file into a .java file.', 0, 409);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'None', 0, 410);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'One', 0, 410);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Two', 1, 410);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Three', 0, 410);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Four', 0, 410);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Five', 0, 410);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'boolean', 0, 411);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'short', 1, 411);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'int', 0, 411);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'byte', 1, 411);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'long', 0, 411);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'float', 1, 411);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'None', 1, 412);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'One', 0, 412);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Two', 0, 412);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Three', 0, 412);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code does not compile', 0, 412);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '145', 0, 413);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '1045', 0, 413);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '24, followed by a stack trace', 0, 413);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '245', 1, 413);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code does not compile because of line p1', 0, 413);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'The code does not compile because of line p2', 0, 413);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'can, cup', 0, 414);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'cup, can', 0, 414);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The code does not compile', 0, 414);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'This is an infinite loop', 0, 414);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code compiles but throws an exception at runtime', 1, 414);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'public static void main(String... widgets)', 1, 415);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'public static void main(String sprockets)', 0, 415);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'protected static void main(String[] args)', 0, 415);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'public static int void main(String[] arg)', 0, 415);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'public static final void main(String []a)', 1, 415);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'public static void main(String[] data)', 1, 415);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Line 8', 0, 416);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Line 9', 0, 416);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Line 10', 1, 416);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Line 11', 1, 416);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Line 12', 1, 416);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Line 13', 0, 416);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Line h1', 1, 417);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Line h2', 1, 417);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Line h3', 1, 417);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Line h4', 0, 417);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Line h5', 0, 417);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Line h6', 0, 417);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'FileNotFoundException', 0, 418);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'ArithmeticException', 1, 418);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'IOException', 0, 418);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Exception', 0, 418);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'IllegalArgumentException', 1, 418);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'RuntimeException', 1, 418);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'It only prints Hello', 0, 419);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'It only prints Goodbye', 0, 419);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'It only prints See you again', 0, 419);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'It does not compile because of line g1', 0, 419);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'It does not compile because of line g2', 0, 419);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'None of the above', 1, 419);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'protected and package-private (blank)', 0, 420);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'public and public', 1, 420);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'package-private (blank) and protected', 1, 420);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'protected and protected', 1, 420);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'private and public', 0, 420);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'package-private (blank) and package-private (blank)', 0, 420);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '15', 0, 421);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'It does not compile because of line q1', 1, 421);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'It does not compile because of line q2', 0, 421);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'It does not compile because of line q3', 0, 421);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'It does not compile because of line q4', 0, 421);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'It compiles but throws an exception at runtime', 0, 421);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'None', 0, 422);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'One', 0, 422);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Two', 1, 422);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Three', 0, 422);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Four', 0, 422);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Five', 0, 422);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'A catch block can never appear after a finally block', 1, 423);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'A try block must be followed by a catch block.', 0, 423);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'A finally block can never appear after a catch block', 0, 423);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'A try block must be followed by a finally block', 0, 423);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'A try block can have zero or more catch blocks', 1, 423);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'A try block can have zero or more finally blocks', 0, 423);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '49', 0, 424);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '13', 1, 424);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '18', 0, 424);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '99', 0, 424);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'It does not compile', 0, 424);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'An object can be assigned to an inherited interface reference variable without an explicit cast.', 1, 425);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'The compiler can prevent all explicit casts that lead to an exception at runtime13', 0, 425);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Casting an object to a reference variable does not modify the object in memory', 1, 425);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'An object can be assigned to a subclass reference variable without an explicit cast', 0, 425);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'An object can be assigned to a superclass reference variable without an explicit cast', 1, 425);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'An implicit cast of an object to one of its inherited types can sometimes lead to a ClassCastException at runtime.', 0, 425);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '0', 0, 426);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '1', 0, 426);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '2', 0, 426);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code does not compile', 0, 426);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code compiles but throws an exception at runtime', 0, 426);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'The output is not guaranteed', 1, 426);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'None', 0, 427);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'One', 1, 427);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Two', 0, 427);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Three', 0, 427);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code does not compile', 0, 427);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'throw, finally, throws', 0, 428);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'throws, catch, throw', 0, 428);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'catch, finally, throw', 0, 428);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'finally, catch, throw', 0, 428);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'throws, finally, throw', 1, 428);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'The println causes one line of output.', 0, 429);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'The println causes two lines of output.', 1, 429);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The println causes three lines of output.', 0, 429);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code terminates successfully', 0, 429);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code throws an exception at runtime', 1, 429);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'abstract methods, override, inheritance', 0, 430);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'concrete methods, overload, inheritance', 0, 430);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'virtual methods, overload, interfaces', 0, 430);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'inheritance, abstract, polymorphism', 0, 430);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'virtual methods, override, polymorphism', 1, 430);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Fall', 0, 431);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Spring', 0, 431);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The code does not compile', 0, 431);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code throws an exception on line s1', 0, 431);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code throws an exception on line s2', 1, 431);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'None. The code compiles and runs whithout issue', 0, 432);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'One', 0, 432);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Two', 0, 432);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Three', 1, 432);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Four', 0, 432);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '5, LONG', 0, 433);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '6, LONG', 1, 433);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '5, null', 0, 433);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '6, null', 0, 433);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code does not compile', 0, 433);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'The code compiles but throws an exception at runtime', 0, 433);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'None. The code compiles and produces a stack trace at runtime', 0, 434);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'One', 0, 434);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Two', 0, 434);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Three', 1, 434);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Four', 0, 434);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Five', 0, 434);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Optimization and platform independence', 0, 435);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Platform independence and encapsulation', 0, 435);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Platform independence and inheritance', 0, 435);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Object orientation and encapsulation', 1, 435);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Inheritance and polymorphism', 0, 435);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'false false', 0, 436);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'false true', 0, 436);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'true false', 0, 436);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'true true', 0, 436);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code does not compile', 1, 436);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'The code compiles but throws an exception at runtime', 0, 436);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '0', 1, 437);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '1', 0, 437);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '2', 0, 437);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code does not compile', 0, 437);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code compiles but throws an exception at runtime', 0, 437);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'The output is not guaranteed', 0, 437);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Every do-while loop can be rewritten as a for-each loop.', 0, 438);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Every for-each loop can be rewritten as a do-while loop.', 1, 438);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Every for-each loop can be rewritten as a traditional for loop.', 1, 438);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Every for-each loop can be rewritten as a while loop.', 1, 438);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Every traditional for loop can be rewritten as a for-each loop.', 0, 438);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Every while loop can be rewritten as a for-each loop.', 0, 438);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'None', 0, 439);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'One', 0, 439);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Two', 0, 439);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'This is an infinite loop', 0, 439);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code does not compile', 1, 439);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'None', 0, 440);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'One', 0, 440);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Two', 1, 440);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Three', 0, 440);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Four', 0, 440);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '0', 0, 441);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '1', 1, 441);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '3', 0, 441);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '9', 0, 441);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'This is an infinite loop', 0, 441);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'The code does not compile', 0, 441);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'None, the class compiles without issue', 0, 442);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'One', 0, 442);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Two', 0, 442);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Three', 1, 442);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Four', 0, 442);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Five', 0, 442);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Access modifier in a class', 0, 443);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Execution path in a switch statement', 1, 443);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Method name', 0, 443);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Modifier in an abstract interface method', 0, 443);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Modifier in an interface method with a body', 1, 443);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Variable name', 0, 443);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'computer-laptop-', 0, 447);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'laptop-computer-', 0, 447);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'laptop-laptop-', 1, 447);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'None of the above', 0, 447);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Just getNumRakes()', 0, 458);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Just getNumShovels()', 0, 458);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Both methods', 1, 458);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Neither method', 0, 458);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'p', 0, 471);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'q', 0, 471);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'r', 0, 471);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'None of these', 1, 471);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'None', 1, 475);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'One', 0, 475);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Two', 0, 475);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Three', 0, 475);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'filter()', 0, 483);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'forEach()', 1, 483);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'replace()', 0, 483);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'sort()', 0, 483);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'ArrayDeque', 0, 507);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'ArrayList', 1, 507);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'TreeSet', 0, 507);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'All of these allow nulls.', 0, 507);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'None', 0, 562);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'One', 0, 562);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Two', 1, 562);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Three', 0, 562);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'I', 0, 592);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'II', 0, 592);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'I and II', 1, 592);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'I, II, and III', 0, 592);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'withFlatMap(list); withoutFlatMap(list);', 0, 749);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'withFlatMap(queue); withoutFlatMap(queue);', 1, 749);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Both pairs disprove the claim.', 0, 749);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Neither pair disproves this claim.', 0, 749);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '1235', 0, 849);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '3215', 0, 849);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '41235', 0, 849);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code does not compile.', 1, 849);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'The code runs successfully.', 0, 870);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'The code throws an exception on line 18.', 0, 870);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The code throws an exception on line 19.', 1, 870);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code does not compile.', 0, 870);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'The code does not compile.', 0, 917);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'The code compiles but prints an exception at runtime', 0, 917);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The program runs and prints all students in the file', 0, 917);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The program runs but may only print some students in the files.', 1, 917);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'None', 0, 928);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'One', 0, 928);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Two', 1, 928);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Three', 0, 928);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Both methods compile and are equivalent to each other.', 0, 930);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Neither method compiles', 1, 930);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Only one of the methods compiles.', 0, 930);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The methods compile, but one method may lead to a resource leak', 0, 930);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'irregular file, regular file', 0, 937);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'regular file, opaque file', 0, 937);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'symbolic link, regular file', 1, 937);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'symbolic link, symbolic directory', 0, 937);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'The first stream statement does not compile.', 0, 971);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'The second stream statement does not compile.', 0, 971);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Both statements compile but are unlikely to print the same results at runtime.', 0, 971);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'None of the above', 1, 971);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Zero', 0, 980);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'One', 0, 980);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Two', 1, 980);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Three', 0, 980);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '0', 1, 997);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '10', 0, 997);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The code does not compile.', 0, 997);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'None of the above.', 0, 997);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '{1975=[Escort], 1967=[Thunderbird, Mustang]}', 1, 999);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '{Escort=[1975], Thunderbird=[1967], Mustang=[1967]}', 0, 999);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The code does not compile', 0, 999);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The application throws an exception at runtime because the stream is not parallel', 0, 999);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'aCataHat HatCat', 1, 1000);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'CatHat CatHat', 0, 1000);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The code does not compile because concat1() returns an Optional.', 0, 1000);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code does not compile for a different reason.', 0, 1000);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '0', 0, 1004);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '10', 1, 1004);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '12', 0, 1004);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'None of the above', 0, 1004);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'None. The code compiles as is', 0, 1014);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'One', 0, 1014);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Two', 1, 1014);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Three', 0, 1014);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'The code terminates successfully without any output.', 0, 1030);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'The code does not compile due to line s1.', 0, 1030);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The code does not compile due to line s2.', 1, 1030);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'None of the above', 0, 1030);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'System.out.println(rs.getString());', 0, 1032);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'System.out.println(rs.getString("0"));', 0, 1032);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'System.out.println(rs.getString("1"));', 0, 1032);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'System.out.println(rs.getString("title"));', 1, 1032);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'There is a compiler error on the line of code that creates the Statement.', 0, 1033);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'There is a compiler error on the line of code that creates the ResultSet.', 1, 1033);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'This code compiles and runs without error.', 0, 1033);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'This code throws a SQLException at runtime.', 0, 1033);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'The code compiles and runs without error.', 1, 1040);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'The code does not compile.', 0, 1040);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The code compiles but throws an exception at runtime on line r1.', 0, 1040);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code compiles but throws an exception at runtime on line r2.', 0, 1040);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'The code terminates successfully without any output.', 1, 1045);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'The code does not compile due to line s1.', 0, 1045);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The code does not compile due to line s2.', 0, 1045);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'None of the above', 0, 1045);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Jeanne Scott', 0, 1046);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Scott Jeanne', 1, 1046);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The code compiles, but the output is neither of these.', 0, 1046);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code throws a SQLException at runtime.', 0, 1046);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '.java', 0, 1068);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '.properties', 0, 1068);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Both of the above', 0, 1068);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Neither of the above', 1, 1068);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'engine 241', 0, 1075);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'moteur 241', 0, 1075);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'moteur null', 0, 1075);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code throws an exception at runtime.', 1, 1075);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'engine 241', 1, 1076);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'moteur 241', 0, 1076);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'moteur null', 0, 1076);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code throws an exception at runtime.', 0, 1076);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'null', 0, 1081);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'black', 0, 1081);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'white', 0, 1081);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code throws an exception at runtime.', 1, 1081);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'null', 0, 1082);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '4', 1, 1082);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '6', 0, 1082);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code throws an exception at runtime.', 0, 1082);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '0 0', 0, 1087);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '0 1', 0, 1087);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The code does not compile.', 1, 1087);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code compiles but throws an exception at runtime', 0, 1087);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'The application completes without printing anything.', 0, 1110);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Yummy!', 0, 1110);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'One line of this application fails to compile.', 0, 1110);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Two lines of this application fail to compile.', 1, 1110);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'polymorphism', 0, 1116);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'concrete methods in interfaces', 0, 1116);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'multiple inheritance', 0, 1116);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'backward compatibility', 1, 1116);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Les objets Singleton peuvent ??tre modifi??s avec un setter', 0, 1159);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Les constructeurs d''une classe Singleton doivent obligatoirement ??tre private', 1, 1159);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Un objet Singleton doit ??tre nomm?? "instance"', 0, 1159);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Les objets Singleton peuvent ??tre de protected ou private', 0, 1159);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'S''assure qu''il n''y a qu''une seule et unique instance en m??moire', 1, 1159);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Requi??re une m??thode public static pour r??cup??rer l''instance du Singleton', 1, 1159);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Mod??le MVC', 0, 1214);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Mod??le MVVM', 1, 1214);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Une m??thode propos??e par Vue qui permet de faire des boucles', 0, 1217);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Un objet propos?? par Vue qui permet de cr??er des m??thodes, g??rer des donn??es et lier un template ?? tout ??a', 1, 1217);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Une m??thode enregistr??e, qui va se lancer seulement si une donn??e est charg??e', 0, 1217);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Parce qu''on peut cr??er des m??thodes dans les composants et pas les instances', 0, 1230);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Parce qu''on peut r??-utiliser des composants facilement', 1, 1230);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'On utilise la m??thode map()', 0, 1231);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'On utilise les props', 1, 1231);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'On utilise la propri??t?? "sendToChild"', 0, 1231);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Ce sont des fonctions qui s''ex??cutent ?? diff??rents stades de la construction et de la mise ?? jour d''un composant.', 1, 1232);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Ce sont des fonctions qui permettent de cr??er et de supprimer des composants.', 0, 1232);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Ces m??thodes servent ?? envoyer des donn??es partout dans notre application, on l''appelle aussi le "bus ?? ??v??nement".', 0, 1232);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'v-for', 1, 1233);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'v-loop', 0, 1233);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'v-every', 0, 1233);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Oui', 1, 1234);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Non', 0, 1234);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'v-show', 1, 1235);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'v-if', 0, 1235);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'v-model', 0, 1235);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'v-bind', 0, 1235);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'beforeMount', 1, 1237);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'mounted', 0, 1237);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'beforeUpdate', 0, 1237);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'updated', 0, 1237);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'DisposableBean', 0, 1257);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Singleton', 0, 1257);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Services', 0, 1257);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Spring beans', 1, 1257);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Un framework', 1, 1283);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Une biblioth??que', 0, 1283);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Aspect Oriented Programming', 1, 1294);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Aspect Oriented Programs', 0, 1294);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Aspect Oriente Programming', 0, 1294);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Aucune de ces r??ponses n???est vraie', 0, 1294);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Les fonctions async', 1, 1298);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Les callbacks', 1, 1298);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Les promesses avec .then().catch()', 1, 1298);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Rien en particulier, le code s''execute de mani??re synchrone', 0, 1298);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Les Thread', 0, 1298);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'async function ma_fonction() {}', 1, 1300);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'function async ma_fonction(){}', 0, 1300);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'const ma_fonction = async () => {}', 1, 1300);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'async const ma_fonction = () => {}', 0, 1300);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'function ma_fonction() {}', 0, 1300);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'const ma_fonction = () => {}', 0, 1300);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'async function ma_fonction() {}', 1, 1304);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'function async ma_fonction(){}', 0, 1304);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'const ma_fonction = async () => {}', 1, 1304);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'async const ma_fonction = () => {}', 0, 1304);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'function ma_fonction() {}', 1, 1304);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'const ma_fonction = () => {}', 1, 1304);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Les Promesses', 1, 1306);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Les Callbacks', 0, 1306);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'fetch', 1, 1317);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'axios', 0, 1317);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'promise', 0, 1317);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'callback', 0, 1317);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'get', 0, 1317);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'const', 1, 1318);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'var', 0, 1318);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'let', 0, 1318);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'final', 0, 1318);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'const', 0, 1319);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'var', 0, 1319);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'let', 1, 1319);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'final', 0, 1319);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'function ma_fonction(a, b=12) {}', 1, 1320);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'function ma_fonction(a, b:12) {}', 0, 1320);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'function ma_fonction(a, b ? b : 12) {}', 0, 1320);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'function ma_fonction(a, b=?12) {}', 0, 1320);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Il permet la destructuration d''array, qui permet une manipulation plus simple du contenu d''un array (copie, ajout, suppression, split...)', 1, 1321);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Il permet la destructuration d''objets, qui permet une manipulation plus simple du contenu d''un objet (copie, ajout, suppression, split...)', 0, 1321);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Pour les fonctions, remplace l''API apply et permet de passer les valeurs d''un array d''une fonction comme ??tant la liste des param??tres.', 1, 1321);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Permet de d??crire une fonction  avec un nombre ind??fini de param??tres', 1, 1321);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '(param) => param;', 1, 1322);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '(param) => { return param }', 1, 1322);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'param => { return param; }', 1, 1322);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'param1, param2 => param1;', 0, 1322);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', '(param1, param2) => param1+param2;', 1, 1322);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'param => return param', 0, 1322);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('G', 'param => param', 1, 1322);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Propri??t?? d''ECMAScript qui permet de modifier une variable avant sa d??claration, tant qu''elle est d??clar??e', 1, 1323);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Propri??t?? d''ECMAScript qui emp??che de modifier une variable avant sa d??claration', 0, 1323);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Propri??t?? d''ECMAScript qui permet de lire une variable avant sa d??claration, tant qu''elle est d??clar??e', 1, 1323);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Propri??t?? d''ECMAScript qui emp??che de lire une variable avant sa d??claration, tant qu''elle est d??clar??e', 0, 1323);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'oui', 0, 1324);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'non', 1, 1324);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'oui', 0, 1325);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'non', 1, 1325);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '''My name is ${name} !''', 0, 1326);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '`My name is ${name} !`', 1, 1326);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'On ne peut pas', 0, 1326);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '''My name is {name} !''', 0, 1326);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', '`My name is {name} !`', 0, 1326);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', '`My name is {name} !`', 0, 1326);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'const [a, , b] = [1,2,3];', 1, 1327);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'const { a } = { a: "valeur1", b: "valeur2" }', 1, 1327);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'const { a, ...rest } = { a: "valeur1", b: "valeur2" }', 1, 1327);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'const [a, ...rest] = [1,2,3];', 1, 1327);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'const { ...rest, b } = { a: "valeur1", b: "valeur2" }', 0, 1327);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'const [...rest, b] = [1,2,3];', 0, 1327);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'script, template, methods', 0, 1328);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'template, script, style', 1, 1328);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'script, template, css', 0, 1328);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'body, script, style', 0, 1328);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'v-bind:kiwi="kiwi"', 1, 1334);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'v-key:kiwi="kiwi"', 0, 1334);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'v-model="kiwi"', 0, 1334);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', ':kiwi="kiwi"', 1, 1334);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'v-id', 0, 1338);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'v-loop', 0, 1338);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'v-key', 1, 1338);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'v-while', 0, 1338);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'v-model', 1, 1341);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'v-bind', 0, 1341);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'v-store', 0, 1341);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'v-input', 0, 1341);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'var text = new vue(){ // options }', 0, 1371);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'var text = new object({ // options })', 0, 1371);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'var text = new Vue({ // options })', 1, 1371);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'var text = new text({ // options })', 0, 1371);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '[ ]', 0, 1372);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '{{ }}', 1, 1372);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'v-model', 0, 1372);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Pour ??viter les fuites de m??moire (memory leak)', 0, 1373);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Pour des raisons de performance lors de la manipulation de grands tableaux', 0, 1373);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Pour forcer la copie et ??viter les conflits de donn??es entre composants', 1, 1373);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'En utilisant setInterval dans methods', 0, 1374);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'En utilisant watch', 1, 1374);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'En utilisant MutationObserver', 0, 1374);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Vrai', 1, 1375);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Faux', 0, 1375);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'v-pre', 0, 1381);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'v-once', 0, 1381);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'v-bind', 1, 1381);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'v-html', 0, 1381);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Oui', 0, 1388);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Non', 1, 1388);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Oui', 1, 1389);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Non', 0, 1389);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'int main()', 0, 1390);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'public void main(String[] args)', 0, 1390);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'public static void main(String... values)', 1, 1390);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'public static int main(String things)', 0, 1390);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'public void main(String... arguments)', 0, 1390);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'public static void main(String items[])', 1, 1390);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('G', 'public static void main(String[] case)', 0, 1390);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'caillou 18 Je suis ton p??re !', 0, 1391);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'caillou 18 Je', 0, 1391);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'javac Main.java; java Main caillou 18 Je suis ton p??re !', 0, 1391);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Le code ne compile pas', 1, 1391);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'caillou 18 Je suis ton p??re !', 1, 1392);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'caillou 18 Je', 0, 1392);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'javac Main.java; java Main caillou 18 Je suis ton p??re !', 0, 1392);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Le code ne compile pas', 0, 1392);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'javac Main.java ; java Main monsieur le ministre', 0, 1393);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'javac Main.java ; java Main "monsieur le ministre"', 1, 1393);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'java Main monsieur le ministre', 0, 1393);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'java Main "monsieur le ministre"', 0, 1393);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'java Main.java monsieur le ministre', 0, 1393);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'java Main.java "monsieur le ministre"', 1, 1393);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Le protocole it??rateur', 0, 1404);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Le protocole it??rable', 1, 1404);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'La fonction next, avec un ou z??ro argument, qui retourne un objet de deux valeurs: value et done.', 1, 1407);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'La fonction next, avec un ou z??ro argument, qui retourne une valeur', 0, 1407);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Les fonctions asynchrones', 0, 1416);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Les g??n??rateurs', 1, 1416);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Les constructeurs', 0, 1416);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Les it??rateurs', 0, 1416);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'yield newValue;', 1, 1417);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'return newValue;', 1, 1417);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'function* myGenerator()', 1, 1418);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '*function myGenerator()', 0, 1418);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'generator myGenerator()', 0, 1418);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'generator* myGenerator()', 0, 1418);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'On peut faire plusieurs exports nomm??s par module mais un seul export par d??faut', 1, 1428);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'L''export par d??faut permet d''exporter l''ensemble du module, ce qu''on ne peut pas faire avec l''export nomm??', 0, 1428);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'L''export par d??faut ne fonctionne que dans le dossier du module o?? il est d??fini, alors que l''export nomm?? n''est pas limit??', 0, 1428);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'L''export nomm?? ne fonctionne que dans le dossier du module o?? il est d??fini, alors que l''export par d??faut n''est pas limit??', 0, 1428);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'target', 1, 1435);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'handler', 1, 1435);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'trap', 1, 1435);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'symbol', 0, 1435);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'reflect', 0, 1435);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '-c', 0, 1438);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '-C', 0, 1438);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '-cp', 1, 1438);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '-d', 0, 1438);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', '-f', 0, 1438);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', '-p', 0, 1438);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '-c', 1, 1439);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '-C', 1, 1439);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '-cp', 0, 1439);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '-d', 0, 1439);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', '-f', 1, 1439);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', '-p', 0, 1439);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'data-binding', 1, 1440);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'caching', 1, 1440);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'access control', 1, 1440);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'inheritance', 0, 1440);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Reflect', 1, 1441);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Symbol', 0, 1441);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Generator', 0, 1441);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Vrai', 0, 1442);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Faux', 1, 1442);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Une class de Spring.', 0, 1443);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Un objet cr???? par le framework AOP afin de mettre en oeuvre les contrats d???aspects.', 1, 1443);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Un proxy fourni par Spring conteneur.', 0, 1443);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Un JDK dynamic proxy.', 0, 1444);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Un JDK  CGLIB proxy.', 0, 1444);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Un JDK dynamic proxy or a CGLIB proxy.', 1, 1444);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Aucune de ces r??ponses.', 0, 1444);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'JDK dynamic proxy', 1, 1445);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'CGLIB proxy', 0, 1445);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Aspect Oriented Proxy', 0, 1446);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Aspect Observable Programming', 0, 1446);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Aspect Oriented Programming', 1, 1446);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Aspect Objet Programming', 0, 1446);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Join cut', 0, 1447);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Point cut', 0, 1447);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Join Point', 1, 1447);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Advice', 0, 1447);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Toutes les m??thodes peuvent ??tre des proxy.', 0, 1449);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Seules les classes qui impl??mentent au moins une interface peuvent ??tre des proxy.', 0, 1449);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Les proxy AOP sont cr????s par Spring dans le but d???impl??menter les aspect contracts.', 1, 1449);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Les proxy AOP sont toujours cr????s avec un proxy dynamique JDK.', 0, 1449);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Un advice peut rendre proxy un constructeur de classe.', 0, 1451);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Un code statique d???initialisation peut ??tre cibl?? par un point cut.', 0, 1451);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Un point cut peut selectionner des m??thodes qui ont une annotation personnalis??e.', 1, 1451);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'La combinaison de point cut par les op??rateurs ???&&???, ???||??? et ???!??? n???est pas support??.', 0, 1451);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Les m??thodes publiques', 1, 1455);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Toutes les m??thodes quelque soit leur visibilit??', 0, 1455);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Toutes les m??thodes except?? les m??thodes priv??s', 0, 1455);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Les m??thodes publiques et protected', 0, 1455);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Il s???agit de l???ex??cution de toutes les m??thodes publiques qui renvoient une valeur.', 0, 1456);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Il s???agit de l???ex??cution de toutes les m??thodes publiques.', 1, 1456);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Il s???agit de l???ex??cution de toutes les m??thodes publiques qui ont au moins un param??tre.', 0, 1456);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Il s???agit de l???ex??cution de toutes les m??thodes publiques qui appartiennent au paquet par d??faut de Java.', 0, 1456);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'mounted, beforeCreate, created, destroyed', 0, 1485);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'created, beforeMount, mounted, updated', 1, 1485);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'created, beforeUpdate, updated, mounted', 0, 1485);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'destroyed, created, updated, mounted', 0, 1485);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'v-for', 0, 1486);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'v-model', 1, 1486);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'v-bind', 0, 1486);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'v-on', 0, 1486);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Non', 0, 1487);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Oui', 1, 1487);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'v-model', 0, 1488);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'v-bind', 0, 1488);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'v-on', 1, 1488);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'v-for', 0, 1488);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Liaison de donn??es bidirectionnelle o?? la partie de vue de l''application (UI) est mise ?? jour automatiquement lorsque le mod??le de donn??es est modifi??.', 1, 1489);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Liaison de donn??es unidirectionnelle o?? la partie de vue de l''application (UI) est mise ?? jour automatiquement lorsque le mod??le de donn??es est modifi??.', 0, 1489);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Liaison de donn??es bidirectionnelle o?? la partie de vue de l''application (UI) n''est pas mise ?? jour automatiquement. On a besoin d''??crire quelque code personnalis?? pour la mettre ?? jour chaque fois un mod??le de donn??es est modifi??.', 0, 1489);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Liaison de donn??es unidirectionnelle o?? la partie de vue de l''application (UI) n''est pas mise ?? jour automatiquement. On a besoin d''??crire quelque code personnalis?? pour la mettre ?? jour chaque fois un mod??le de donn??es est modifi??.', 0, 1489);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Oui', 1, 1498);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Non', 0, 1498);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'v-show', 1, 1500);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'v-if', 0, 1500);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'v-show', 0, 1501);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'v-if', 1, 1501);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Oui', 0, 1506);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Non', 1, 1506);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Non', 1, 1511);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Oui', 0, 1511);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'base^exponent', 0, 1521);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Math.pow(base, exponent)', 1, 1521);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Math.pow(exponent, base)', 0, 1521);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'base**exponent', 1, 1521);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '9', 0, 1522);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '8', 1, 1522);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Ce code ne compile pas', 0, 1522);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Ce code retourne une erreur', 0, 1522);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', '6', 0, 1522);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'array.indexOf(val) !== -1', 1, 1523);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'array.includes(val)', 1, 1523);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'array.includes(val, -1)', 0, 1523);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'array.includes(val) !== -1', 0, 1523);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'array.includes(1,1)', 1, 1524);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'array.includes(1, 2)', 0, 1524);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'array.includes(2, -1)', 0, 1524);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'array.includes(1)', 1, 1524);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'array.includes(0, 0)', 1, 1524);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'array.includes(0, 1)', 0, 1524);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'ES7', 0, 1525);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'ES8', 1, 1525);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'ES9', 0, 1525);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'ES10', 0, 1525);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Permet de lire plus facilement les actions asynchrones comme des actions synchrones', 1, 1528);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Renvoi toujours une erreur lorsque la promesse est rejet??e', 1, 1528);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Permet de plus facilement faire plusieurs actions asynchrones en parall??le', 0, 1528);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Aucune diff??rence', 0, 1530);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'return await va throw une erreur si ma_fonction a une erreur, ce qui n''est pas le cas du return', 1, 1530);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'return await implique des pertes de performances et est d??conseill??', 0, 1530);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'try...catch', 1, 1534);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '.catch()', 0, 1534);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Les erreurs sont retourn??s ?? la place de la r??ponse, il faut faire un check pour savoir si la fonction retourne un objet erreur', 0, 1534);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'undefined', 1, 1535);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'null', 0, 1535);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Une erreur est retourn??', 0, 1535);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'A l''execution, JS rajoute le await car il reconnait que c''est une fonction asynchrone', 0, 1535);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Pour faire le rendu d???une liste d?????l??ments ', 1, 1584);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Pour it??rer sur les propri??t??s d???un objet', 1, 1584);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Avec la balise <template>', 1, 1584);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Avec la directive v-if', 1, 1584);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'v-for="item in items"', 0, 1588);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'v-for="(item, index) in items"', 0, 1588);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'v-for="item of items"', 0, 1588);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Toutes les propositions ', 1, 1588);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'v-for="value in object"', 0, 1589);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'v-for="(value, name) in object"', 0, 1589);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'v-for="(value, name, index) in object"', 0, 1589);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Toutes les propositions ', 1, 1589);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '1 2 3 4 5 6 7 8 9 10', 1, 1590);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '0 1 2 3 4 5 6 7 8 9', 0, 1590);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '0 1 2 3 4 5 6 7 8 9 10', 0, 1590);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Le code ne compile pas', 0, 1590);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Facebook', 0, 1603);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Evan You', 1, 1603);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Google', 0, 1603);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Object.keys', 0, 1604);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Object.values', 1, 1604);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Object.entries', 0, 1604);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Array.from', 0, 1604);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Array.entries', 0, 1604);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Array.keys', 0, 1604);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('G', 'Array.values', 0, 1604);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Object.keys', 0, 1605);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Object.values', 0, 1605);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Object.entries', 1, 1605);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Array.from', 0, 1605);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Array.entries', 0, 1605);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Array.keys', 0, 1605);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('G', 'Array.values', 0, 1605);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Oui', 1, 1606);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Non', 0, 1606);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'On passe par le store', 0, 1607);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Global Events', 0, 1607);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Event Bus', 1, 1607);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Event Dispatch', 0, 1607);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'configurable', 1, 1608);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'writable', 1, 1608);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'enumerable', 1, 1608);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'value', 1, 1608);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'get', 1, 1608);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'set', 1, 1608);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'L''attribut scoped dans la balise <style>', 1, 1609);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'La directive v-scope', 0, 1609);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'La propri??t?? scoping:true', 0, 1609);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'configurable', 0, 1610);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'writable', 0, 1610);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'enumerable', 1, 1610);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'value', 0, 1610);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'get', 0, 1610);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'set', 0, 1610);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Vrai', 1, 1611);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Faux', 0, 1611);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'configurable', 0, 1612);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'writable', 1, 1612);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'enumerable', 0, 1612);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'value', 1, 1612);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'get', 0, 1612);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'set', 0, 1612);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'ES7', 0, 1613);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'ES8', 0, 1613);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'ES9', 1, 1613);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'ES10', 0, 1613);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'ES11', 0, 1613);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'ABC', 0, 1618);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'BC', 1, 1618);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Rien ne s''affiche', 0, 1618);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'CB', 0, 1618);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'B', 0, 1618);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Aucune de ses options', 0, 1618);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'nativeEvent', 0, 1637);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '$event', 1, 1637);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'e.native', 0, 1637);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'e', 0, 1637);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'v-on:click.self', 1, 1638);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'v-on:click.once', 0, 1638);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'v-on:click.this', 0, 1638);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'v-on:click.once', 1, 1639);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'v-on:click.prevent.once', 0, 1639);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'v-on:click.stop', 0, 1639);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'v-on:click.passive', 0, 1639);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'v-on:click.prevent', 0, 1640);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'v-on:click.self.prevent', 1, 1640);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'v-on:click.prevent.self', 0, 1640);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Un objet it??rable asynchrone', 1, 1691);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Un objet it??rable synchrone', 1, 1691);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Un array', 1, 1691);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Un ReadableStream', 1, 1691);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Poss??de le symbole Symbol.asyncIterator', 1, 1692);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'La m??thode next() retourne une Promesse', 1, 1692);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Il ne peut ??tre it??r?? qu''avec for await...of', 1, 1692);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'On peut l''it??r?? avec for...of ou for await...of', 0, 1692);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Poss??de le symbole Symbol.iterator', 0, 1692);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'La m??thode next() retourne une valeur quelconque', 0, 1692);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Poss??de le symbole Symbol.asyncIterator', 0, 1693);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'La m??thode next() retourne une Promesse', 0, 1693);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Il ne peut ??tre it??r?? qu''avec for await...of', 0, 1693);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'On peut l''it??r?? avec for...of ou for await...of', 1, 1693);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Poss??de le symbole Symbol.iterator', 1, 1693);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'La m??thode next() retourne une valeur quelconque', 1, 1693);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'synchrone/asynchrone', 1, 1694);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'asynchrone/synchrone', 0, 1694);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '[arrayA, arrayB].flat()', 1, 1695);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '[arrayA, arrayB].flatten()', 0, 1695);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Array.flatten([arrayA, arrayB])', 0, 1695);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Array.flat([arrayA, arrayB])', 0, 1695);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '[1, 2, [3, 4, [5, 6]]].flat(2)', 1, 1696);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '[1, 2, [3, 4, [5, 6]]].flat(1)', 0, 1696);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'On ne peut pas supprimer tous les sous-tableaux avec flat directement', 0, 1696);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '[
  [''foo'', ''bar''],
  [''baz'', 42]
]', 0, 1697);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Ce code retourne une erreur', 0, 1697);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Object { "foo": "bar", "baz": 42 }', 1, 1697);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Object { "bar": "foo", "42": baz }', 0, 1697);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Une Map', 1, 1698);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Un Array de [cl??, valeur]', 1, 1698);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Un Objet', 0, 1698);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Un Set', 0, 1698);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '    try {
      const response = await fetch(url);
    } catch (e) {
      console.log("caught error")
    }', 1, 1699);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '    try {
      const response = await fetch(url);
    } catch () {
      console.log("caught error")
    }', 0, 1699);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '    try {
      const response = await fetch(url);
    } catch {
      console.log("caught error")
    }', 1, 1699);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Non', 1, 1746);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Oui', 0, 1746);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'this.$router.push(url)', 1, 1762);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'this.$router.go(url)', 0, 1762);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'this.$router.change(url)', 0, 1762);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Vue Router est incapable de g??rer des routes dynamiques', 0, 1766);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'La concordance dynamique des routes n''est pas utilis??e', 1, 1766);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Les param??tres doivent ??tre d??finis dans des propri??t??s calcul??es', 0, 1766);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Le composant n??cessite une propri??t?? dans Data sp??ciale pour permettre le routage dynamique', 0, 1766);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '<router-view>', 0, 1767);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '<router-anchor>', 0, 1767);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '<router-link>', 1, 1767);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '<router-url>', 0, 1767);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'this.$route.vars[''id'']', 0, 1768);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'this.$route.query.id', 0, 1768);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'this.$route.params.id', 1, 1768);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'this.$route.document.id', 0, 1768);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'function sayHello(text){
  const name = text;
  //print name
  console.log(`Hello ${name}`)
}', 1, 1769);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'function sayHello(text){
  const name = text;
  console.log(`Hello ${name}`)
}', 0, 1769);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Function@1fee6fc', 0, 1769);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Le code retourne une erreur', 0, 1769);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'class A { a(){return 1} }', 1, 1770);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Ce code retourne une TypeError car class n''est pas une fonction', 0, 1770);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '50', 1, 1771);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '10', 0, 1771);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Ce code retourne une erreur', 0, 1771);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'null', 0, 1772);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '25', 1, 1772);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Ce code retourne une erreur', 0, 1772);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'undefined', 0, 1772);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'null', 0, 1773);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '25', 1, 1773);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Ce code retourne une erreur', 0, 1773);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'undefined', 0, 1773);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'console.log(adventurer.dog?.name);', 1, 1774);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'console.log(adventurer.dog ? adventurer.dog.name : undefined);', 1, 1774);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'console.log(adventurer.dog && adventurer.dog.name);', 0, 1774);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Ce code n''a pas d''erreurs', 0, 1774);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Non', 0, 1775);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Oui, en pr??fixant par #', 1, 1775);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Oui, avec le mot-cl?? private', 0, 1775);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Les modules avec des d??pendances cycliques ne compilent pas', 1, 1779);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Les packages avec des d??pendances cycliques ne compilent pas', 0, 1779);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Une d??pendance cyclique implique toujours exactement deux modules', 0, 1779);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Une d??pendance cyclique implique toujours trois ou plus de modules', 0, 1779);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Une d??pendance cyclique implique toujours au moins deux requires', 1, 1779);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Un module anonyme peut ??tre impliqu?? dans une d??pendance cyclique avec un module automatique', 0, 1779);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Un nouveau r??pertoire sera toujours cr????', 0, 1813);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Un nouveau r??pertoire sera cr???? seulement si /mammal/kangaroo/ existe', 1, 1813);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Si le code cr??e un r??pertoire, il sera accessible ?? /kang/joey', 1, 1813);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Si le code cr??e un r??pertoire, il sera accessible ?? mammal/kangaroo/joey', 1, 1813);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Le code ne compile pas', 0, 1813);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Le code compile mais soul??ve une exception durant l''ex??cution ', 0, 1813);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Il n''y a pas de diff??rence', 0, 1834);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Promise.allSettled est plus performant que Promise.all', 0, 1834);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Il vaut mieux utiliser Promise.allSettled plut??t que Promise.all car plus r??cent', 0, 1834);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Promise.all renvoie un reject si une des promesse fail, alors que Promise.allSettled ne fail jamais', 1, 1834);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Promise.allSettled renvoie un reject si une des promesse fail, alors que Promise.all ne fail jamais', 0, 1834);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Ils r??pondent ?? des cas d''usages diff??rents', 1, 1834);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '[{ status: "fulfilled", value: 3 },  { status: "rejected", reason: "foo" }]', 1, 1845);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '"foo"', 0, 1845);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '[{ status: "rejected", reason: "foo" }, { status: "fulfilled", value: 3 }]', 0, 1845);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Ce code retourne une erreur', 0, 1845);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'On obtient un array, mais on ne peut pas pr??voir le contenu', 0, 1845);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'hash ', 1, 1848);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'history', 0, 1848);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'finished waiting', 1, 1850);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Une Syntax Error  sera envoy??e', 0, 1850);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Rien ne sera affich??', 0, 1850);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Ce code tourne ind??finiment', 0, 1850);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'finished waiting', 0, 1851);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Une Syntax Error  sera envoy??e', 1, 1851);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Rien ne sera affich??', 0, 1851);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Ce code tourne ind??finiment', 0, 1851);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'public void main(String[] args)', 0, 2008);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'public static void main()', 0, 2008);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'private static void start(String[] mydata)', 0, 2008);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'public static final void main(String[] mydata)', 1, 2008);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '.java', 0, 2009);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '.bytecode', 0, 2009);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '.class', 1, 2009);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '.dll', 0, 2009);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'The code does not compile because of lines 1 and 2', 0, 2010);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'The code does not compile because of line 4', 1, 2010);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The code does not compile because of line 5', 0, 2010);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code compiles without issue', 0, 2010);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Objects are grouped as procedures, separate from the data they act on.', 1, 2011);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'An object can take many forms via casting.', 0, 2011);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'An object can hold data, referred to as attributes.', 0, 2011);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'An object can perform actions, via methods.', 0, 2011);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Interface variables', 0, 2012);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Class variables', 0, 2012);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Instance variables', 0, 2012);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Local variables', 1, 2012);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'java.util', 0, 2013);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'java.lang', 1, 2013);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'system.lang', 0, 2013);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'java.system', 0, 2013);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '// Add 5 to the result', 0, 2014);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '/*** TODO: Fix bug 12312 ***/', 0, 2014);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '# Add configuration value', 1, 2014);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '/* Read file from system ****/', 0, 2014);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'It can only contain one class declaration.', 0, 2015);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'It can contain one public class declaration and one public interface definition.', 0, 2015);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'It must define at least one public class.', 0, 2015);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'It may define at most one public class.', 1, 2015);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '2, 0, 1', 0, 2016);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '2, 2, 1', 1, 2016);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '1, 0, 1', 0, 2016);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '0, 2, 1', 0, 2016);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'The class will not compile if it contains unused import statements.', 0, 2017);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Unused import statements can be removed from the class without causing a class to become unable to be compiled.', 1, 2017);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The class will not compile if a duplicate import statement is present.', 0, 2017);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'If a class contains an import statement for a class used in the program that cannot be found, it can still compile.', 0, 2017);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'It does not compile', 1, 2018);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'It compiles but throws an exception at runtime.', 0, 2018);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'It compiles and outputs 5.', 0, 2018);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'It compiles and outputs 15.', 0, 2018);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'I only', 0, 2019);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'III only', 0, 2019);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'II and III', 0, 2019);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'None are true', 1, 2019);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'import widget.*;', 0, 2020);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '// Widget Manager', 0, 2020);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'package sprockets;', 0, 2020);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'int facilityNumber;', 1, 2020);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Every class is required to include a package declaration.', 0, 2021);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'To create a new package, you need to add a package.init file to the directory.', 0, 2021);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Packages allow you to limit access to classes, methods, or data from classes outside the package.', 1, 2021);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'It is not possible to restrict access to objects and methods within a package.', 0, 2021);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'javac Manager
java Manager', 0, 2022);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'javac Manager.java
java Manager', 1, 2022);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'javac Manager
java Manager.class', 0, 2022);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'javac Manager.java
java Manager.class', 0, 2022);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'platform independence', 0, 2023);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'object orientation', 0, 2023);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'inheritance', 0, 2023);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'encapsulation', 1, 2023);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'i', 0, 2024);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '55', 0, 2024);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '56', 0, 2024);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'It does not compile', 1, 2024);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'It can be run on any computer with a compatible JVM.', 1, 2025);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'It can only be executed on the same type of computer that it was created on.', 0, 2025);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'It can be easily read and modified in a standard text editor.', 0, 2025);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'It requires the corresponding .java that created it to execute.', 0, 2025);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'A colon (:)', 0, 2026);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'An end-of-line character', 0, 2026);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'A tab character', 0, 2026);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'A semicolon (;)', 1, 2026);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'The code does not compile due to line 6.', 0, 2027);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'The code does not compile due to line 7.', 0, 2027);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '31', 1, 2027);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '61', 0, 2027);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Line 1', 0, 2028);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Line 2', 0, 2028);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Line 3', 1, 2028);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Line 4', 0, 2028);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Encapsulation', 0, 2029);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Object oriented', 0, 2029);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Inheritance', 0, 2029);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Platform independence', 1, 2029);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'It prevents Java bytecode from being easily decoded/decompiled.', 1, 2030);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'It supports platform independence.', 0, 2030);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'It manages memory for the application.', 0, 2030);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'It translates Java instructions to machine instructions.', 0, 2030);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Package variables', 0, 2031);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Class variables', 1, 2031);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Instance variables', 0, 2031);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Local variables', 0, 2031);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'television.actor.recurring.Marie', 0, 2032);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'movie.directors.John', 0, 2032);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'television.actor.Package', 1, 2032);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'movie.NewRelease', 0, 2032);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'import statements, package statement, class declaration', 0, 2033);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'package statement, class declaration, import statement', 0, 2033);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'class declaration, import statements, package declaration', 0, 2033);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'package statement, import statements, class declaration', 1, 2033);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Zero', 0, 2034);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'One', 0, 2034);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Two', 0, 2034);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Three', 1, 2034);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'java forest.Deer deer 5 "White-tailed deer"', 0, 2035);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'java forest.Deer "White-tailed deer" deer 3', 0, 2035);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'java forest.Deer Red deer White-tailed deer', 1, 2035);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'java forest.Deer My "deer White-tailed"', 0, 2035);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'The java command compiles a .java file into a .class file.', 0, 2036);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'The javac command compiles a .java file into a .class file.', 1, 2036);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The java command compiles a .class file into a .java file.', 0, 2036);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The javac command compiles a .class file into a .java file.', 0, 2036);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Java is a procedural programming language.', 0, 2037);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Java allows method overloading.', 1, 2037);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Java allows operator overloading.', 0, 2037);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Java allows direct access to objects in memory.', 0, 2037);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'import, class, null', 0, 2038);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'import, interface, void', 0, 2038);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'package, int, int', 0, 2038);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'package, class, long', 1, 2038);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '2 5', 1, 2039);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '8 5', 0, 2039);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '6 5', 0, 2039);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code does not compile', 0, 2039);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Inheritance requires that a class that extends another class be in the same package.', 0, 2040);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'The program must spend extra time/resources at runtime jumping through multiple layers of inheritance to determine precise methods and variables.', 0, 2040);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Method signature changes in parent classes may break subclasses that use overloaded methods.', 0, 2040);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Developers minimize duplicate code in new classes by sharing code in a common parent class. ', 1, 2040);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '//////// Walk my dog', 1, 2041);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '#! Go team!', 0, 2041);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '/ Process fails at runtime /', 0, 2041);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'None of the above', 0, 2041);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'public static void main(String... arguments)', 0, 2042);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'public static void main(String arguments)', 1, 2042);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'public static final void main(String[] arguments)', 0, 2042);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'public static void main(String[] arguments)', 0, 2042);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'a1 and a3', 0, 2043);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'a2 and a4', 1, 2043);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'a2, a3, and a4', 0, 2043);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'a1, a2, a3, and a4', 0, 2043);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'A class declaration', 1, 2044);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'A package statement', 0, 2044);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'At least one import statement', 0, 2044);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The public modifier', 0, 2044);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '.jav', 0, 2045);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '.class', 0, 2045);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '.source', 0, 2045);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '.java', 1, 2045);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'The code does not compile because of line 2.', 0, 2046);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'The code does not compile because of line 3.', 0, 2046);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The code does not compile because of line 6.', 1, 2046);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code compiles without issue.', 0, 2046);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'dog.puppy.female.KC', 1, 2047);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'dog.puppy.Georgette', 0, 2047);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'dog.Webby', 0, 2047);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'java.lang.Object', 0, 2047);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Encapsulation', 0, 2048);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Object orientation', 1, 2048);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Platform independence', 0, 2048);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Polymorphism', 0, 2048);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '0', 1, 2049);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '1', 0, 2049);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '2', 0, 2049);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '3', 0, 2049);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'true false', 0, 2050);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'false false', 0, 2050);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'It does not compile.', 1, 2050);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'It compiles but throws an exception at runtime.', 0, 2050);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'The code does not compile.', 0, 2051);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '5', 0, 2051);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '10', 0, 2051);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '20', 1, 2051);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'red', 0, 2052);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'purple', 1, 2052);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'blue', 0, 2052);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'It does not compile', 0, 2052);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'I only', 0, 2053);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'II only', 0, 2053);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'I and II', 1, 2053);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'I, II and III', 0, 2053);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'true', 0, 2054);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'false', 0, 2054);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'It does not compile', 0, 2054);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'It compiles but throws an error at runtime.', 1, 2054);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'The JVM schedules garbage collection on a predictable schedule.', 0, 2055);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'The JVM ensures that the application will always terminate.', 0, 2055);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The JVM requires a properly defined entry point method to execute the application.', 1, 2055);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'A Java compiled code can be run on any computer.', 0, 2055);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '<p>En utilisant les doubles moustaches : {{ rawHtml }}</p>', 0, 2119);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '<p>En utilisant la directive `v-html` : <span v-html="rawHtml"></span></p>', 1, 2119);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '<p>En utilisant les doubles moustaches : {{ rawHtml }}</p>', 1, 2120);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '<p>En utilisant la directive `v-html` : <span v-html="rawHtml"></span></p>', 0, 2120);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'The Matrix', 1, 2154);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'The Matrix Reloaded', 0, 2154);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Rien n''est affich??', 0, 2154);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'If host is not accessible , print:  "ZA"', 0, 2220);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'If host is not accessible , print:  "Z"', 0, 2220);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '  print:  "Connected to Oxyl"', 0, 2220);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'This code does not compile', 1, 2220);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Remove line 3, 7', 1, 2233);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Remove line 7', 1, 2233);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Remove line 5, 6', 1, 2233);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Remove line 5', 0, 2233);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Remove line 3, 6', 1, 2233);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'It will always print  _ab', 0, 2303);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'It will always print either  _ab  or  _ba', 0, 2303);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'It will print either  _ab  or  _a_b', 1, 2303);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'It will print any of the following: 
_ab, _ba, _a_b,_b_a', 0, 2303);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'f3, f5', 0, 2563);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'f5', 0, 2563);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'f4, f5', 1, 2563);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'f1, f4, f5', 0, 2563);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'truefalse', 0, 2707);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'falsetrue', 0, 2707);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'falsefalse', 1, 2707);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'truetrue', 0, 2707);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'this code does not compile.', 0, 2707);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'You can call the default constructor written by the compiler using this().', 0, 2711);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'You can access a private constructor with the main() method.', 1, 2711);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'this() can be called from anywhere in a constructor.', 0, 2711);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'this() can be called from any instance method in the class.', 0, 2711);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'this.variableName can be called from any instance method in the class.', 1, 2711);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'this.variableName can be called from any static method in the class.', 0, 2711);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('G', 'You must include a default constructor in the code if the compiler does not include one.', 0, 2711);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Replace line 2 with this(2);', 0, 2713);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Replace line 1 with BirdSeed(2);', 0, 2713);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Replace line 2 with BirdSeed(2);', 0, 2713);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Replace line 1 with new BirdSeed(2);', 0, 2713);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Replace line 2 with new BirdSeed(2);', 0, 2713);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Replace line 1 with this(2);', 1, 2713);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'throw on line 5 and throw on line 6', 0, 2742);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'throw on line 5 and throws on line 6', 0, 2742);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'throws on line 5 and throw on line 6', 1, 2742);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'throws on line 5 and throws on line 6', 0, 2742);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'None of the above. SQLException is a checked exception and cannot be thrown.', 0, 2742);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'None of the above. SQLException is a runtime exception and cannot be thrown.', 0, 2742);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'TWF', 0, 2775);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'TWDF', 0, 2775);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'TWDEF', 0, 2775);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'TWF followed by an exception', 0, 2775);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'TWDF followed by an exception', 0, 2775);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'TWEF followed by an exception', 0, 2775);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('G', 'The code does not compile.', 1, 2775);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'TF', 0, 2791);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'TEF', 0, 2791);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'TDWF', 0, 2791);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'TWDF', 1, 2791);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'A compilation error is thrown.', 0, 2791);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'TWF', 0, 2795);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'TWDF', 0, 2795);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'TWDEF', 0, 2795);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'TWF followed by an exception.', 0, 2795);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'TWDF followed by an exception.', 0, 2795);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'TWEF followed by an exception.', 0, 2795);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('G', 'The code does not compile.', 1, 2795);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'TWF', 0, 2813);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'TWDF', 0, 2813);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'TWDEF', 1, 2813);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'TWF followed by an exception.', 0, 2813);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'TWDF followed by an exception.', 0, 2813);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'TWEF followed by an exception.', 0, 2813);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('G', 'The code does not compile.', 0, 2813);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'TF', 0, 2814);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'TEF', 0, 2814);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'TDWF', 0, 2814);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'TWDF', 1, 2814);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'A compilation error is thrown.', 0, 2814);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'double num1, int num2 =0;', 1, 2836);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'int num1, num2 =0;', 0, 2836);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'int num1, num2;', 0, 2836);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'int num1 =0, num2 =0;', 0, 2836);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'class _Outside {}', 0, 2837);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'class 5MainSt {}', 1, 2837);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'class Cost$ {}', 0, 2837);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'class building {}', 0, 2837);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Call the convertToObject() method', 0, 2838);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Call the asObject() method', 0, 2838);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Call the toObject() method', 0, 2838);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Call the constructor of the wrapper class', 1, 2838);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'None of the others', 1, 2839);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Call System.requireGc()', 0, 2839);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Call System.forceGc()', 0, 2839);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Call System.gc()', 0, 2839);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'double num = 2.718;', 0, 2840);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'double num = 2._718;', 1, 2840);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'double num = 2.7_1_8;', 0, 2840);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'They all compile', 0, 2840);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Creates a copy of an existing object and treats it as a new one', 0, 2841);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Instantiates a new object', 1, 2841);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Switches an object reference to a new one', 0, 2841);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Creates a new primitive', 0, 2841);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'short, int, byte, long', 0, 2842);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'short, byte, int, long', 0, 2842);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'byte, short, int, long', 1, 2842);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'int, short, byte, long', 0, 2842);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'It can be used to read from bar', 0, 2843);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'It can be used to write to bar', 0, 2843);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'bar is an instance variable', 0, 2843);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'bar is a local variable', 1, 2843);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'byte and char', 0, 2844);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'byte and int', 0, 2844);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'None of the others', 0, 2844);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'char and int', 1, 2844);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Integer', 0, 2845);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'String', 1, 2845);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Double', 0, 2845);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Long', 0, 2845);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'You can create your own primitives types', 0, 2846);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'String is a primitive', 0, 2846);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Primitive types can be set to null', 0, 2846);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Primitives types begin with a lowercase letter', 1, 2846);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'FooBar', 1, 2847);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'fooBar', 0, 2847);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'FOO_BAR', 0, 2847);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'F_o_o_B_a_r', 0, 2847);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'They can never be set from outside the class they are defined in.', 0, 2848);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'They can be set to null.', 1, 2848);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'They can only be set once per run of the program.', 0, 2848);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'They can only be set in the constructor.', 0, 2848);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'You can store a primitive directly into an ArrayList.', 0, 2849);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'You can convert a wrapper class object to primitive by calling valueOf().', 0, 2849);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'You can call methods on a primitive.', 0, 2849);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'You can convert a primitive to a wrapper class object simply by assigning it.', 1, 2849);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'It defaults to an empty string.', 0, 2850);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'it does not have a default value.', 0, 2850);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'It defaults to null.', 1, 2850);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'It will not compile without initializing on the declaration line.', 0, 2850);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Object', 0, 2851);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'int', 0, 2851);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Integer', 1, 2851);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Int', 0, 2851);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Blue', 0, 2852);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'blue$', 0, 2852);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '2blue', 1, 2852);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '_blue', 0, 2852);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'It may be called zero or more times.', 0, 2853);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'It may be called one or more times.', 0, 2853);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'It may be called exactly once', 0, 2853);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'It may be called zero or one time', 1, 2853);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'char, double, float, bigint', 0, 2855);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'char, byte, float, double', 0, 2855);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'byte, char, float, double', 1, 2855);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'byte, char, double, float', 0, 2855);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Constructor, instance variables, method names', 0, 2856);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Method names, instance variables', 0, 2856);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Instance variables, constuctor, method names', 0, 2856);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'All orders are valid', 1, 2856);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'It will not compile without initializing on the declaration line', 0, 2857);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'It defaults to null', 0, 2857);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'It does not have a default value', 1, 2857);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'It defaults to an empty string', 0, 2857);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Creating an object with the current date
      - old way :  LocalDate d = LocalDate.now();
      - new way :  Date d = new Date();', 0, 2910);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Importing  
      - old way :  import java.util.*;
      - new way :  import java.time.*;', 1, 2910);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Creating an object with the current date and time              
      - old way :  Date d = new Date();
      - new way :  LocalDateTime dt = LocalDateTime.now();', 1, 2910);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Month indexes were always 1 based', 0, 2910);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'In Java 7 and  earlier,the Date class represented both the date and time', 1, 2910);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'lock.writeLock().acquire();
and
lock.writeLock().release();', 0, 2945);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'lock.writeLock().lock();
and
lock.writeLock().unlock();', 1, 2945);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'lock.acquire();
and
lock.release();', 0, 2945);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'lock.readLock().lock();
and
lock.readLock().unlock();', 0, 2945);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'lock.lock();
and
lock.unlock();', 0, 2946);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'lock.readLock();
and
lock.readUnlock();', 0, 2946);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'lock.read();
and
lock.unlock();', 0, 2946);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'lock.readLock().lock();
and
lock.readLock().unlock();', 1, 2946);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'int r = (int) (Math.random(1, 10));', 0, 2952);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'int r = ThreadLocalRandom.current().nextInt(1, 10);', 0, 2952);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'int r = ThreadLocalRandom.current().nextInt(1, 11);', 1, 2952);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'int r = ThreadSafeRandom.nextInt(1, 11);', 0, 2952);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'synchronize all access to the collection', 0, 2956);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'make the collection variable final', 0, 2956);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'make the collection variable final and volatile', 0, 2956);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Wrap the collection into its synchronized version using Collections.synchronizedCollection()', 0, 2956);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Encapsulate the collection into another class and use ReadWriteLock to manage read and write access', 1, 2956);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'int count; at //1
AtomicInteger.increment(count); at //2', 0, 2958);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'synchronized int count; at //1
count++ at //2', 0, 2958);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'AtomicInteger count = 0; at //1
count++; at //2', 0, 2958);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'AtomicInteger count = new AtomicInteger(0); at //1
count++; at //2', 0, 2958);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'AtomicInteger count = new AtomicInteger(0); at //1
count.incrementAndGet(); at //2', 1, 2958);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'The worker threads in the ForkJoinPool extend java.lang.Thread and are created by a factory', 1, 2960);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'The worker threads in the ForkJoinPool implement Executor', 0, 2960);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'One worker thread may steal work from another worker thread', 1, 2960);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'A ForkJoinPool can be viewed as a pool of workers in a circular queue', 0, 2960);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The tasks submitted to a ForkJoinPool sit on the leaves of the task tree', 0, 2960);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '0 1', 1, 2962);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '1 1', 0, 2962);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '0 0', 1, 2962);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '1 2', 0, 2962);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Exception at run time', 0, 2962);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Compilation error', 1, 2986);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'null, 0', 0, 2986);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Yuvraj, 36', 0, 2986);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Text containing @ symbol', 0, 2986);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Compilation error at Line 9', 0, 3024);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Compilation error at Line 10', 0, 3024);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Compilation error at Line 11', 0, 3024);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Parent', 1, 3024);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Outer.new Inner();', 0, 3028);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Outer.innerPrint();', 1, 3028);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'new Outer();', 1, 3028);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Outer.Inner.innerPrint();', 0, 3028);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'new Inner();', 0, 3028);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Inner.innerPrint();', 0, 3028);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'PreparedStatement allows BLOB and CLOB on all databases.', 0, 3066);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'PreparedStatement offers protection against SQL injection attacks.', 1, 3066);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'PreparedStatement allows transactions to span across multiple databases.', 0, 3066);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'PreparedStatement allows easier customization of joins at run time.', 0, 3066);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'When a JDBC Connection is created, it is in commit mode is undetermined.', 0, 3070);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'When a JDBC Connection is created, it is in auto-commit mode.', 1, 3070);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'When a JDBC Connection is created, its commit mode depends on the parameters used while creating the connection.', 0, 3070);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'When a JDBC Connection is created, its auto-commit feature is disabled.', 0, 3070);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Driver', 0, 3071);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Driver''s implementation', 1, 3071);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'DriverManager', 0, 3071);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'DriverManager''s implementation', 0, 3071);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Statement', 0, 3071);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Statement''s implementation', 1, 3071);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Connection parameters', 0, 3072);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Database name', 1, 3072);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'jdbc', 1, 3072);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Location of database', 0, 3072);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Port', 0, 3072);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Password', 0, 3072);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'jdbc: sybase: localhost: 1234/db', 1, 3073);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'jdbc: : sybase: : localhost: : /db', 0, 3073);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'jdbc: : sybase: : localhost: : 1234/db', 0, 3073);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'sybase: localhost: 1234/db', 0, 3073);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'sybase: : localhost: : /db', 0, 3073);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'sybase: : localhost: : 1234/db', 0, 3073);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'java.sql.Driver', 0, 3074);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'META-INF/java.sql.Driver', 0, 3074);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'META-INF/db/java.sql.Driver', 0, 3074);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'META-INF/database/java.sql.Driver', 0, 3074);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'META-INF/service/java.sql.Driver', 1, 3074);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '0', 0, 3075);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '2', 0, 3075);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'There is a compiler error on line 6', 1, 3075);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'There is a compiler error on line 9', 0, 3075);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'There is a compiler error on another line', 0, 3075);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'A runtime exception is thrown', 0, 3075);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Calling Class.forName() is mandatory in JDBC 4.0', 0, 3076);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Class.forName() throws a ClassNotFoundException if the driver class is not found', 1, 3076);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Class.forName() throws a SQLException if the driver class is not found', 0, 3076);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'DriverManager.getConnection() throws   a ClassNotFoundException if the driver class is not found', 0, 3076);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'DriverManager.getConnection() throws   a SQLException if the driver class is not found', 1, 3076);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'ResultSet.CONCUR_READ_ONLY', 0, 3077);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'ResultSet.CONCUR_UPDATABLE', 0, 3077);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'ResultSet.TYPE_FORWARD_ONLY', 1, 3077);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'ResultSet.TYPE_REVERSE_ONLY', 0, 3077);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'ResultSet.TYPE_SCROLL_INSENSITIVE', 1, 3077);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'ResultSet.TYPE_SCROLL_SENSITIVE', 1, 3077);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'A ClassNotFoundException is thrown', 0, 3078);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'A NoSuchTypeException is thrown', 0, 3078);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'A SQLException is thrown', 0, 3078);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'A TypeNotFoundException  is thrown', 0, 3078);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'The code will run without throwing an exception', 1, 3078);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'None of the above. The code will not compile', 0, 3078);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'execute, executeQuery, executeUpdate', 0, 3079);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'execute, executeUpdate, executeQuery', 1, 3079);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'executeQuery, execute, executeUpdate', 0, 3079);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'executeQuery, executeUpdate, execute', 0, 3079);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'executeUpdate, execute, executeQuery', 0, 3079);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'executeUpdate, executeQuery, execute', 0, 3079);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '0', 0, 3080);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '1', 0, 3080);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '5', 1, 3080);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code does not compile', 0, 3080);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'A SQLException is thrown', 0, 3080);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'A different exception is thrown', 0, 3080);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '0', 0, 3081);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '1', 0, 3081);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '5', 0, 3081);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code does not compile', 1, 3081);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'A SQLException is thrown', 0, 3081);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'A different exception is thrown', 0, 3081);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Connection, ResultSet, Statement', 0, 3082);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Connection, Statement, ResultSet', 0, 3082);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'ResultSet, Connection, Statement', 0, 3082);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'ResultSet, Statement, Connection', 1, 3082);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Statement, Connection, ResultSet', 0, 3082);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Statement, ResultSet, Connection', 0, 3082);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '100', 0, 3083);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '101', 0, 3083);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'The code does not compile', 0, 3083);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'A SQLException is thrown', 1, 3083);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'A different exception is thrown', 0, 3083);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'String s = rs.getString(0);', 0, 3084);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'String s = rs.getString(1);', 1, 3084);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'String s = rs.getObject(0);', 0, 3084);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'String s = rs.getObject(1);', 0, 3084);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Object s = rs.getObject(0);', 0, 3084);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Object s = rs.getObject(1);', 1, 3084);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'rs.getDate("d");', 0, 3085);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'rs.getLocalDate("d");', 0, 3085);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'rs.getLocalDateTime("d");', 0, 3085);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'rs.getLocalTime("d");', 0, 3085);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'rs.getTime("d");', 0, 3085);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'rs.getTimeStamp("d");', 1, 3085);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Anna', 0, 3086);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Betty', 0, 3086);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Cat', 0, 3086);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code does not compile', 0, 3086);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'A SQLException is thrown', 1, 3086);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'absolute()', 0, 3087);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'afterFirst()', 0, 3087);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'afterLast()', 1, 3087);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'beforeFirst()', 1, 3087);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'beforeLast()', 0, 3087);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'previous()', 0, 3087);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Anna', 1, 3088);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Betty', 0, 3088);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Cat', 0, 3088);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'The code does not compile', 0, 3088);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'A SQLException is thrown', 0, 3088);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'A SQLException is thrown', 0, 3089);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'One', 0, 3089);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Two', 0, 3089);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Three', 1, 3089);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Four', 0, 3089);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Five', 0, 3089);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('G', 'The code does not compile', 0, 3089);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'One', 0, 3090);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Two', 0, 3090);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Three', 0, 3090);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Four', 0, 3090);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Five', 0, 3090);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'The code does not compile', 1, 3090);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('G', 'A SQLException is thrown', 0, 3090);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Vue.js est une biblioth??que JavaScript open source utilis??e pour d??velopper des interfaces utilisateur', 0, 3102);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Vue.js est un framework JavaScript front open source utilis?? pour d??velopper des interfaces utilisateur', 1, 3102);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Vue.js est une situation d''ex??cution JavaScript open source et multi-plateforme qui ex??cute le programme JavaScript en dehors d''un navigateur Web', 0, 3102);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Vue.js est une biblioth??que JavaScript con??ue pour faciliter la travers??e et l''administration de l''arborescence HTML DOM, la gestion des ??v??nements, l''activit?? CSS et Ajax', 0, 3102);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Vue.js est appel?? framework progressif car il nous permet de cr??er des interfaces utilisateur dynamiques et des applications web monopage', 0, 3103);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Vue.js est appel?? framework progressif car il suit les derni??res normes JavaScript', 0, 3103);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Vue.js est appel?? framework progressif car il est continuellement modifi?? et d??velopp??.', 1, 3103);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Toutes les propositions', 0, 3103);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Vue.js est une biblioth??que JavaScript qui cr??e des interfaces utilisateur pour les applications web monopage en divisant l''interface utilisateur en composants', 0, 3104);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Vue.js utilise le mod??le MVVM pour lier des donn??es ?? certains ??l??ments DOM', 0, 3104);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Vue.js est un framework JavaScript dynamique fr??quemment utilis?? pour d??velopper des interfaces utilisateur.', 1, 3104);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Toutes les propositions', 0, 3104);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'En utilisant CDN en incluant la balise <script> dans le fichier HTML', 0, 3105);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'En utilisant Node Package Manager (NPM)', 0, 3105);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '?? l''aide de Bower', 0, 3105);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Toutes les propositions', 1, 3105);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Vue.js est de tr??s petite taille', 0, 3106);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'La documentation de Vue.js est tr??s simple et compl??te', 0, 3106);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Vue.js est de nature flexible', 0, 3106);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Toutes les propositions', 1, 3106);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Un syst??me de contr??le de version.', 1, 3143);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Un langage de programmation.', 0, 3143);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Une plateforme de d??p??t ?? distance', 0, 3143);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Un raccourcis pour "Github"', 0, 3143);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Faux', 1, 3144);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Vrai', 0, 3144);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git --version', 1, 3145);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'getGitVersion', 0, 3145);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'git help version', 0, 3145);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'gitVersion', 0, 3145);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '--global', 1, 3146);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Rien de sp??cifique, c''est le comportement par d??faut', 0, 3146);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '--all', 0, 3146);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '--A', 0, 3146);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git config user.email', 1, 3147);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'git config email', 0, 3147);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'git email.user', 0, 3147);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git add --all', 1, 3149);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'git add --files', 0, 3149);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'git add', 0, 3149);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git status', 1, 3150);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '--status', 0, 3150);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'git config --status', 0, 3150);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'git getStatus', 0, 3150);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git init', 1, 3151);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'initialize git', 0, 3151);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'start git', 0, 3151);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'git start', 0, 3151);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Faux', 1, 3152);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Vrai', 0, 3152);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'l''historique n''est jamais effac?? automatiquement', 1, 3153);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'tous les mois', 0, 3153);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'toutes les 2 semaines (la dur??e d''un sprint agile typique)', 0, 3153);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'chaque ann??e', 0, 3153);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git commit', 1, 3154);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'git com', 0, 3154);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'git snapshot', 0, 3154);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'git save', 0, 3154);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git commit -m "New email"', 1, 3155);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'git commit message "New email"', 0, 3155);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'git commit -mess "New email"', 0, 3155);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'git commit -log "New email"', 0, 3155);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git log', 1, 3156);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'git commits', 0, 3156);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'git --full-log', 0, 3156);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'git history', 0, 3156);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git commit -help', 1, 3157);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'git commit readme', 0, 3157);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'gitHelp commit', 0, 3157);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'git commitHelp', 0, 3157);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Une version s??par??e du d??p??t principal', 1, 3158);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Un petit bout de bois utilis?? pour taper les commandes', 0, 3158);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Une partie secr??te de Git config', 0, 3158);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Rien, c''est un terme invent?? pour cette question', 0, 3158);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git branch new "new-email"  ', 0, 3159);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'git newBranch "new-email"', 0, 3159);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'git branch new-email', 1, 3159);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'git add branch "new-email"', 0, 3159);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git checkout new-email', 1, 3160);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'git branch -move new-email', 0, 3160);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'git checkout branch new-email', 0, 3160);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'git branch new-email', 0, 3160);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '-b', 1, 3161);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '-newbranch', 0, 3161);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '-all', 0, 3161);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '-new', 0, 3161);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git merge new-email', 1, 3162);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'git add new-email', 0, 3162);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'git commit -merge new-email', 0, 3162);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git branch -d new-email', 1, 3163);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'git delete branch new-email', 0, 3163);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'git delete new-email', 0, 3163);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'git gone new-email', 0, 3163);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git push origin', 1, 3165);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'git merge remote', 0, 3165);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'git remote commit', 0, 3165);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'git remote push', 0, 3165);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git fetch origin', 1, 3166);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'git get log origin', 0, 3166);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'git status remote origin', 0, 3166);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'git origin help', 0, 3166);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git diff new-email', 1, 3167);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'git log new-email', 0, 3167);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'git status new-email', 0, 3167);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'git changes new-email', 0, 3167);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'fetch et merge', 1, 3169);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'branch et checkout', 0, 3169);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'add et commit', 0, 3169);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'A la ligne 1, remplacer le blanc avec <>', 0, 3200);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'A la ligne 1, remplacer le blanc avec <T>', 1, 3200);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'A la ligne 1, remplacer le blanc avec <?>', 0, 3200);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'A la ligne 3, remplacer le blanc avec <>', 1, 3200);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'A la ligne 3, remplacer le blanc avec <T>', 0, 3200);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'A la ligne 3, remplacer le blanc avec <?>', 0, 3200);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'L''AOP permet de faire l''injection de d??pendance ', 0, 3204);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'L''AOP permet de s??parer les probl??matiques transverses (techniques) de la logique m??tier ', 1, 3204);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'L''AOP permet de mieux tester son application', 0, 3204);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '{1=10, 2=20}', 0, 3209);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '{1=10, 2=20, 3=null}', 0, 3209);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '{1=10, 2=20, 3=3}', 0, 3209);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '{1=13, 2=20}', 0, 3209);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', '{1=13, 2=20, 3=null}', 0, 3209);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', '{1=13, 2=20, 3=3}', 1, 3209);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('G', 'Le code ne compile pas', 0, 3209);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('H', 'Le code l??ve une exception ?? l''ex??cution', 0, 3209);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'C''est un point d''ex??cution', 0, 3212);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', ' un module d??finissant des greffons et leurs points d''activation', 0, 3212);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'C''est la fonctionnalit?? qui est appliqu??e ?? l''aide d''AOP.', 1, 3212);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'm??canisme de liaison d''un aspect au programme', 1, 3217);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'une annotation', 0, 3217);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Aucune', 0, 3229);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', ';', 0, 3229);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', ':', 1, 3229);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'bind', 0, 3229);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Aucune', 0, 3230);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '@', 1, 3230);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', ':', 0, 3230);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'on', 0, 3230);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Aucune', 1, 3231);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '@', 0, 3231);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', ':', 0, 3231);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', ';', 0, 3231);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'model', 0, 3231);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '.directive', 0, 3232);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '.once', 0, 3232);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '.capture', 0, 3232);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '.passive', 1, 3232);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '<a @click.prevent-once="dotask"></a>', 0, 3234);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '<a @click.once="dotask"></a>', 1, 3234);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '<a @click.prevent="dotask"></a>', 0, 3234);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '<a @click.passive="dotask"></a>', 0, 3234);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Rien ne s''affiche', 0, 3246);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'a', 0, 3246);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'b', 0, 3246);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'a puis b', 1, 3246);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Une erreur apparait', 0, 3246);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'logMessage, a', 0, 3246);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Rien ne s''affiche', 0, 3247);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'a', 0, 3247);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'b', 0, 3247);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'a puis b', 0, 3247);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Une erreur apparait', 1, 3247);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'logMessage, a', 0, 3247);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Rien ne s''affiche', 0, 3249);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'a', 1, 3249);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'b', 0, 3249);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'a puis b', 0, 3249);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Une erreur apparait', 0, 3249);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'logMessage, a', 0, 3249);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Rien ne s''affiche', 1, 3250);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'a', 0, 3250);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'b', 0, 3250);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'a puis b', 0, 3250);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Une erreur apparait', 0, 3250);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'logMessage, a', 0, 3250);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Rien ne s''affiche', 0, 3252);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'a', 0, 3252);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'b', 0, 3252);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'ab', 0, 3252);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'aab', 1, 3252);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'logMessage, a', 0, 3252);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('G', 'aabb', 0, 3252);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Rien ne s''affiche', 0, 3268);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'abc', 0, 3268);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'bac', 0, 3268);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'acb', 1, 3268);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Une erreur survient', 0, 3268);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'v-cloak', 0, 3517);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'v-view', 1, 3517);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'v-memo', 0, 3517);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'v-pre', 0, 3517);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '@my-component', 0, 3518);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', ' v-my-component', 0, 3518);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'v-bind:my-component', 0, 3518);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '<my-component></my-component>', 1, 3518);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Il permet d''utiliser tr??s simplement Babel, TypeScript, ESLint, PostCSS, PWA, tests unitaires et tests end-to-end.', 1, 3519);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Il dispose d''un syst??me de plugin permettant ?? la communaut?? de construire et de partager des solutions r??utilisables pour des besoins communs.', 1, 3519);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Le code ES2015 natif peut ??tre envoy?? sans effort pour les navigateurs modernes. ', 1, 3519);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Il permet d''utiliser des composants ?? fichier unique (*.vue).', 1, 3519);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'mounted, beforeCreate, created, destroyed', 0, 3520);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'created, beforeUpdate, update, mounted', 0, 3520);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'mounted, created, beforeCreate, updated', 0, 3520);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'beforeMount, mounted, updated, destroyed', 1, 3520);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'create, mount, update, destroy', 0, 3521);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'created, beforeMount, mounted, updated', 1, 3521);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'created, beforeUpdate, update, mounted', 0, 3521);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'mounted, created, beforeCreate, updated', 0, 3521);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Ouvre l''??diteur REPL de Node', 1, 3522);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Rien ne se passe', 0, 3522);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Une erreur bash', 0, 3522);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'created', 0, 3523);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'didMount', 1, 3523);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'beforeMount', 0, 3523);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'mounted', 0, 3523);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'created', 0, 3524);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'beforeMount', 0, 3524);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'willMount', 1, 3524);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'mounted', 0, 3524);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Ctrl+S', 0, 3525);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Ctrl+R', 0, 3525);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Ctrl+D', 1, 3525);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Ctrl+C', 0, 3525);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Ctrl+S', 0, 3526);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Ctrl+R', 0, 3526);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Ctrl+D', 0, 3526);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Ctrl+C', 1, 3526);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Non', 0, 3527);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Disponible nativement dans node', 0, 3527);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Cela n??cessite d''importer le module repl', 1, 3527);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Vrai', 0, 3528);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Faux', 1, 3528);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '3', 1, 3530);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Uncaught TypeError: Cannot read property ''length'' of undefined', 0, 3530);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Il est impossible de savoir ce qui sera affich??', 0, 3530);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '_ r??cup??re les valeurs et les erreurs', 0, 3531);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '_error', 1, 3531);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Non', 0, 3531);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'npm install -g vue/cli', 0, 3606);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'npm install -g @vue/cli', 1, 3606);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'install -g @vue/cli', 0, 3606);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'install -g vue/cli', 0, 3606);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'vue-cli create my-project', 0, 3607);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'vue-cli my-project create', 0, 3607);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'vue my-project create', 0, 3607);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'vue create my-project', 1, 3607);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Le code compile sans probl??me', 1, 3644);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Le code ne compile pas ?? cause de la ligne k2', 0, 3644);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Le code ne compile pas ?? cause de la ligne k3', 0, 3644);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Les locks r??cup??r??s aux lignes k1 et k4 portent sur le m??me objet', 0, 3644);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'La classe prot??ge correctement l''attribut tickets des race conditions', 0, 3644);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Au plus une instance de TicketManager sera cr????e dans une application qui utilise cette classe', 1, 3644);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Vrai', 0, 3873);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Faux', 1, 3873);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'repl.start()', 1, 3876);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'repl.begin()', 0, 3876);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Il n''y a pas d''autres ??critures ??quivalente', 0, 3876);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'new repl.start()', 0, 3876);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'new repl.begin()', 0, 3876);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Vrai', 1, 3879);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Faux', 0, 3879);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Objet', 1, 3890);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Fonction', 0, 3890);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'help', 1, 3893);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'action', 1, 3893);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'description', 0, 3893);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'func', 0, 3893);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'configurable', 0, 3893);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'help', 1, 3895);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'action', 1, 3895);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'description', 0, 3895);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'func', 0, 3895);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'configurable', 0, 3895);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Il n''y a pas de debugger natif pour Node.JS, contrairement ?? un navigateur', 0, 3956);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'node inspect <fileName>', 1, 3956);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'node debug <fileName>', 0, 3956);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'node dbg <fileName>', 0, 3956);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Ecrire debugger; dans le code cr???? un breakpoint', 1, 3957);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Ecrire debugger(); dans le code cr???? un breakpoint', 0, 3957);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Ecrire setBreapoint(); dans le code', 0, 3957);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Ecrire setBreapoint; dans le mode REPL de la CLI', 0, 3957);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Ecrire setBreapoint(); dans le mode REPL de la CLI', 1, 3957);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Ecrire setBreapoint; dans le code', 0, 3957);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('G', 'Ecrire debugger(); dans le mode REPL de la CLI', 0, 3957);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('H', 'Ecrire debugger; dans le mode REPL de la CLI', 0, 3957);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'On ne peut pas', 0, 3958);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'watch(''maVariable'') dans le code', 0, 3958);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'watch(''maVariable'') dans le REPL de la CLI', 1, 3958);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'new Buffer();', 0, 3959);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Buffer.from();', 1, 3959);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Buffer.alloc();', 1, 3959);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Buffer.malloc();', 0, 3959);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Buffer.allocUnsafe();', 1, 3959);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Buffer.alloc(); / Buffer.from();', 0, 3960);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Buffer.alloc(); / Buffer.allocUnsafe();', 1, 3960);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Buffer.allocUnsafe(); / Buffer.alloc();', 0, 3960);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Buffer.from(); / Buffer.alloc();', 0, 3960);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Buffer.allocUnsafe(); / Buffer.from(); ', 0, 3960);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'Buffer.from(); / Buffer.allocUnsafe();', 0, 3960);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Buffer.from(); permet d''utiliser des sources ext??rieurs en param??tre et garde l''application s??curis??e.', 1, 3961);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Buffer.from(); et Buffer.alloc(); sont compl??tement interchangeables.', 0, 3961);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Il faut pr??ferrer Buffer.from(); ?? Buffer.alloc(); pour les allocations de nombres de bites', 0, 3961);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'VueX est un gestionnaire d''??tat et une biblioth??que pour des applications Vue.js.', 1, 3984);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'VueX est une commande utilis??e en Vue.js.', 0, 3984);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'VueX est un composant de Vue.js.', 0, 3984);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'VueX est d??j?? inclus dans Vue.js, pas besoin de l''installer', 0, 3985);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'En utilisant un lien CDN dans une balise <script>', 1, 3985);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'En ligne de commande avec npm', 1, 3985);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'En ligne de commande avec yarn', 1, 3985);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Le code retourne une erreur TypeError [ERR_INVALID_ARG_TYPE]', 1, 3986);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Hello', 0, 3986);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '{ type: ''Buffer'', data: [ 72, 101, 108, 108, 111 ] }', 0, 3986);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '<Buffer 48 65 6c 6c 6f>', 0, 3986);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Le code retourne une erreur TypeError [ERR_INVALID_ARG_TYPE]', 0, 3987);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Hello world', 0, 3987);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '{
  type: ''Buffer'',
  data: [
     72,   0, 101,  0, 108,   0, 108,
      0, 111,   0, 32,   0, 119,   0,
    111,   0, 114,  0
  ]
}', 0, 3987);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '<Buffer 48 00 65 00 6c 00 6c 00 6f 00 20 00 77 00 6f 00 72 00>', 0, 3987);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Hello wor', 1, 3987);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Le code retourne une erreur TypeError [ERR_INVALID_ARG_TYPE]', 0, 3988);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Hello', 0, 3988);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '{
  type: ''Buffer'',
  data: [
     72,   0, 101,  0, 108,   0, 108,
      0, 111
  ]
}', 1, 3988);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '<Buffer 48 00 65 00 6c 00 6c 00 6f 00 20 00 77 00 6f 00 72 00>', 0, 3988);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Le code retourne une erreur TypeError [ERR_INVALID_ARG_TYPE]', 0, 3989);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Hello', 0, 3989);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '{
  type: ''Buffer'',
  data: [
     72,   0, 101,  0, 108,   0, 108,
      0, 111
  ]
}', 0, 3989);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '<Buffer 48 00 65 00 6c 00 6c 00 6f 00 20 00 77 00 6f 00 72 00>', 1, 3989);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Oui', 0, 3990);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Non', 1, 3990);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Le code retourne une erreur TypeError [ERR_INVALID_ARG_TYPE]', 0, 3991);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Hello', 1, 3991);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '{
  type: ''Buffer'',
  data: [
     72,   0, 101,  0, 108,   0, 108,
      0, 111
  ]
}', 0, 3991);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '<Buffer 48 00 65 00 6c 00 6c 00 6f 00 20 00 77 00 6f 00 72 00>', 0, 3991);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'La synchronisation des donn??es d''une application peut devenir trop complexe ?? mesure qu''une application se d??veloppe et s''??tend. ', 1, 3994);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Cela nous permet de cr??er une source unique de v??rit?? pour les donn??es de notre application.', 1, 3994);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Elle garantit que toutes les copies de donn??es sont ind??pendantes les unes des autres.', 0, 3994);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Les composants de notre application doivent pouvoir acc??der aux donn??es et les mettre ?? jour, quel que soit leur emplacement dans la codebase.', 1, 3994);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Le code retourne une erreur TypeError [ERR_INVALID_ARG_TYPE]', 0, 3996);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Hello', 0, 3996);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '<Buffer 61 61 61 61 61>', 1, 3996);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '<Buffer 61 00 00 00 00>', 0, 3996);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Le state', 0, 3997);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Les getters', 0, 3997);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Les actions', 0, 3997);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Les mutations', 1, 3997);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Le state', 0, 3999);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Les getters', 0, 3999);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Les actions', 1, 3999);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Les mutations', 0, 3999);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Buffer.byteLength(buff)', 1, 4000);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Buffer.biteLength(buff)', 0, 4000);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'buff.length()', 0, 4000);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Buffer.length(buff)', 0, 4000);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'buff.byteLength()', 0, 4000);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', 'buff.biteLength()', 0, 4000);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'trigger', 0, 4002);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'commit', 1, 4002);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'initiate', 0, 4002);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'call', 0, 4002);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '...mapActions()', 1, 4023);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '...generateActions()', 0, 4023);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '...listActions()', 0, 4023);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '...getActions()', 0, 4023);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'H', 0, 4024);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'undefined', 0, 4024);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '72', 1, 4024);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Oui', 1, 4025);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Non', 0, 4025);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Objet', 0, 4026);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'TypedArray', 0, 4026);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Uint8Array', 1, 4026);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Array', 0, 4026);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', 'Aucune ??quivalence', 0, 4026);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Hello world, Iello world', 0, 4030);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Iello world, Iello world', 1, 4030);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'TypeError', 0, 4030);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Iello world, Hello world', 0, 4030);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Hello world, Iello world', 1, 4031);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Iello world, Iello world', 0, 4031);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'TypeError', 0, 4031);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Iello world, Hello world', 0, 4031);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'un getter', 0, 4033);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'une mutation', 0, 4033);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'une action', 1, 4033);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'true', 0, 4035);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'false', 1, 4035);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Hello', 0, 4037);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', ' world', 1, 4037);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Hello world', 0, 4037);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'TypeError', 0, 4037);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '?????', 1, 4038);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', ' !!!!!', 0, 4038);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'TypeError', 0, 4038);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '12', 0, 4044);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '2', 1, 4044);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '3', 0, 4044);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '4', 0, 4044);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '2', 0, 4045);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '12', 1, 4045);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Rien un exception est logg??e', 0, 4045);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Le code ne compile pas', 0, 4045);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '--in around aop
--in before aop', 1, 4046);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '--in before aop
--in around aop', 0, 4046);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '--in around aop', 0, 4046);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '--in before aop', 0, 4046);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '--in around aop
--in before aop', 0, 4047);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '--in before aop
--in around aop', 0, 4047);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '--in around aop', 1, 4047);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '--in before aop', 0, 4047);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Before', 1, 4048);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Pointcut', 0, 4048);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'AfterReturn', 0, 4048);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'After', 1, 4048);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Around', 1, 4049);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Aspect', 0, 4049);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'AfterReturning', 1, 4049);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'AfterThrow', 0, 4049);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Around', 1, 4050);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Aspect', 0, 4050);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'AfterResult', 0, 4050);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'AfterThrowing', 1, 4050);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Vrai', 1, 4051);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Faux', 0, 4051);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Vrai', 0, 4052);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Faux', 1, 4052);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'buff.values()', 1, 4053);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'buff.entries()', 1, 4053);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'buff.keys()', 1, 4053);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'buff1.equals(buff2)', 1, 4054);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Buffer.equals(buff1, buff2)', 0, 4054);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'buff1 === buff2', 0, 4054);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'AfterReturning', 0, 4088);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Before', 0, 4088);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'After', 0, 4088);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Around', 1, 4088);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Rien, le contexte d??marre normalement', 0, 4089);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Une exception est lanc??e et le contexte d??marre normalement', 1, 4089);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Une exception est lanc??e et le programme s''arr??te', 0, 4089);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Aucune proposition au dessus', 0, 4089);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '@EnableAspect', 0, 4090);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '@Pointcut', 1, 4090);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '@Around', 1, 4090);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '@Between', 0, 4090);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('E', '@Before', 1, 4090);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('F', '@AfterReturning', 1, 4090);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'AfterSuccess', 0, 4103);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'AfterReturning', 1, 4103);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'AfterThrowing', 0, 4103);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'After', 0, 4103);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git show -blame index.html', 0, 4109);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'git blame index.html', 1, 4109);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'git show --blame index.html', 0, 4109);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'git show -b index.html', 0, 4109);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git push --set-remote origin feature', 0, 4112);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'git push --force', 0, 4112);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'git push --set-upstream origin feature', 1, 4112);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'git push --upstream origin feature', 0, 4112);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git checkout', 0, 4113);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'git pull', 0, 4113);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'git pull --offline', 0, 4113);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'git fetch', 1, 4113);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Clone', 0, 4114);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Fork', 0, 4114);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Pull request', 1, 4114);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Notify', 0, 4114);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git revert', 1, 4115);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'git reset', 0, 4115);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'git undo', 0, 4115);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'git commit --undo', 0, 4115);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', '-m', 1, 4116);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', '-a', 0, 4116);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', '-i', 0, 4116);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', '-l', 0, 4116);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Elle commite les changements locaux vers le d??p??t distant en omettant la ???staging area??? ', 0, 4117);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Elle commite les changements locaux vers la staging area', 0, 4117);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Elle commite les changements de la staging area vers le d??p??t distant', 0, 4117);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Elle commite les changements de la staging area vers le d??p??t local', 1, 4117);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Les branches permettent de travailler ind??pendamment sur diff??rents bugs ou fonctionnalit??s en parall??le', 1, 4118);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Vous pouvez cr??er de multiples branches locales et ne pousser que certaines d???entre elles vers le d??p??t distant', 1, 4118);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Vous pouvez cr??er de multiples branches mais vous devez merger sur master avant de basculer d???une branche ?? l???autre', 0, 4118);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Les fichiers du premier commit de la branche master du d??p??t distant', 0, 4119);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'La derni??re version des fichiers de la branche master du d??p??t distant', 1, 4119);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Aucun fichier n???est r??cup??r??, seul un d??p??t vide est cr????', 0, 4119);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'La derni??re version des fichiers de la branche la plus r??cente du d??p??t distant', 0, 4119);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'document.md', 0, 4120);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'README.md', 1, 4120);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'introduction.md', 0, 4120);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'README.doc', 0, 4120);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'git reset --hard HEAD~4', 0, 4121);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'git reset --hard HEAD~~', 0, 4121);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'git reset --hard HEAD~3', 1, 4121);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'git reset --hard HEAD~2', 0, 4121);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Le premier git commit effectu?? apr??s git init cr??e une branche master', 0, 4122);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'C???est une commande que l???on ex??cute une seule fois pour initialiser un d??p??t Git', 1, 4122);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Elle doit ??tre ex??cut??e ?? chaque changement de branche', 0, 4122);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Elle cr??e un nouveau r??pertoire .init dans votre r??pertoire de travail courant', 0, 4122);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'Elle liste l???historique des commits de origin', 0, 4123);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'Elle liste les utilisateurs qui ont travaill?? sur le d??p??t distant', 0, 4123);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'Elle donne l???URL du d??p??t distant', 1, 4123);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'Elle liste l???ensemble des r??f??rences distantes qui ont ??t?? pull??es', 1, 4123);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'ApplicationContext est une classe qui ??tends BeanFactory', 0, 4127);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'BeanFactory est une classe qui ??tends ApplicationContext', 0, 4127);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'ApplicationContext est une interface qui ??tends BeanFactory', 1, 4127);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'BeanFactory est une interface qui ??tends ApplicationContext', 0, 4127);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('A', 'BeanFactory charge les beans ?? la demande', 1, 4128);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('B', 'BeanFactory charge les beans au d??marrage de l''application', 0, 4128);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('C', 'ApplicationContext charge les beans ?? la demande', 0, 4128);
INSERT INTO answer (label, `text`, valid_answer, question_id) VALUES('D', 'ApplicationContext charge les beans au d??marrage de l''application', 1, 4128);

