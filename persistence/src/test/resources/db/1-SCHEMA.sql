DROP ALL OBJECTS;
  create schema if not exists `newrofactorydb`;
  use `newrofactorydb`;

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
  `valid_answer` tinyint NOT NULL,
  `question_id` int NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `ANSWER_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
);

INSERT INTO promotion(name) VALUES('Pouet');
INSERT INTO promotion(name) VALUES('Axel');
INSERT INTO promotion(name) VALUES('Hamzouille2');

