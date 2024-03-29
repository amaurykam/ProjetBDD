CREATE DATABASE PROJET_AVA_BDD;

USE PROJET_AVA_BDD;

CREATE TABLE AUTHENTIFICATION (
  PRIMARY KEY (id_mot_passe),
  id_mot_passe INT AUTO_INCREMENT NOT NULL,
  mot_passe    VARCHAR(42)
);

CREATE TABLE CV (
  PRIMARY KEY (id_cv),
  id_cv INT AUTO_INCREMENT NOT NULL,
  pdf   VARCHAR(42)
);

CREATE TABLE OFFRE (
  PRIMARY KEY (id_offre),
  id_offre   INT AUTO_INCREMENT NOT NULL,
  nom_offre  VARCHAR(42),
  id_secteur INT NOT NULL
);

CREATE TABLE POSTULANT (
  PRIMARY KEY (id_postulant),
  id_postulant INT AUTO_INCREMENT NOT NULL,
  nom          VARCHAR(42),
  prenom       VARCHAR(42),
  telephone    VARCHAR(42),
  email        VARCHAR(42),
  id_cv        INT NOT NULL,
  UNIQUE (id_cv)
);

CREATE TABLE POSTULER (
  PRIMARY KEY (id_postulant, id_offre),
  id_postulant INT AUTO_INCREMENT NOT NULL,
  id_offre     INT NOT NULL
);

CREATE TABLE SECTEUR (
  PRIMARY KEY (id_secteur),
  id_secteur  INT AUTO_INCREMENT NOT NULL,
  nom_secteur VARCHAR(42)
);

CREATE TABLE UTILISATEUR (
  PRIMARY KEY (id_user),
  id_user      INT AUTO_INCREMENT NOT NULL,
  username     VARCHAR(42),
  droits       VARCHAR(42),
  id_mot_passe INT NOT NULL,
  UNIQUE (id_mot_passe)
);

ALTER TABLE OFFRE ADD FOREIGN KEY (id_secteur) REFERENCES SECTEUR (id_secteur);

ALTER TABLE POSTULANT ADD FOREIGN KEY (id_cv) REFERENCES CV (id_cv);

ALTER TABLE POSTULER ADD FOREIGN KEY (id_offre) REFERENCES OFFRE (id_offre);
ALTER TABLE POSTULER ADD FOREIGN KEY (id_postulant) REFERENCES POSTULANT (id_postulant);

ALTER TABLE UTILISATEUR ADD FOREIGN KEY (id_mot_passe) REFERENCES AUTHENTIFICATION (id_mot_passe);

INSERT INTO `cv`(`id_cv`, `pdf`) VALUES ('1','C:\\Users\vince\\OneDrive\\Documents\\important\\CV_Amaury');
INSERT INTO `cv`(`id_cv`, `pdf`) VALUES ('2','C:\\Users\\vince\\OneDrive\\Documents\\important\\CV_Vincent');
INSERT INTO `cv`(`id_cv`, `pdf`) VALUES ('3','C:\\Users\vince\\OneDrive\\Documents\\important\\CV_Abderrahman');

INSERT INTO `postulant`(`id_postulant`, `nom`, `prenom`, `telephone`, `email`, `id_cv`) VALUES ('2','Angoulvant','Vincent','0609675617','vincent.angoulvant@esme.fr','2');
INSERT INTO `postulant`(`id_postulant`, `nom`, `prenom`, `telephone`, `email`, `id_cv`) VALUES ('1','Kamerer','Amaury','0782452705','amaury.kamerer@esme.fr','1');
INSERT INTO `postulant`(`id_postulant`, `nom`, `prenom`, `telephone`, `email`, `id_cv`) VALUES ('3','Foullous','Abderrahman','0762729630','abderrahman.foullous@esme.fr','3');

INSERT INTO `offre` (`id_offre`, `nom_offre`, `id_secteur`) VALUES
(1, 'apprenti_dev', 2),
(2, 'apprenti_SOC', 1),
(3, 'pentest', 1),
(4, 'devops', 3),
(5, 'backend_dev', 3),
(6, 'frontend_dev', 2);

INSERT INTO `secteur` (`id_secteur`, `nom_secteur`) VALUES
(1, 'cybersécurité'),
(2, 'centre_de_contact'),
(3, 'lab_recherche');

INSERT INTO `utilisateur` (`id_user`, `username`, `droits`, `id_mot_passe`) VALUES
(1, 'kamaury', 'admin', 1),
(2, 'avincent', 'normal', 2),
(3, 'fabderrahman', 'admin', 3);

INSERT INTO `authentification` (`id_mot_passe`, `mot_passe`) VALUES
('1', 'd72e30a67e488d293e368aefacb0bb19'),
('2', '0482c68cb5558e75fe0844f33292a4e1'),
('3', '0d1c0dbd2a9dbf3d238cf17200c96a90');

INSERT INTO `postuler`(`id_postulant`, `id_offre`) VALUES ('1','2');
INSERT INTO `postuler`(`id_postulant`, `id_offre`) VALUES ('1','3');
INSERT INTO `postuler`(`id_postulant`, `id_offre`) VALUES ('2','1');
INSERT INTO `postuler`(`id_postulant`, `id_offre`) VALUES ('3','1');
INSERT INTO `postuler`(`id_postulant`, `id_offre`) VALUES ('4','2');
INSERT INTO `postuler`(`id_postulant`, `id_offre`) VALUES ('4','3');
INSERT INTO `postuler`(`id_postulant`, `id_offre`) VALUES ('5','2');
INSERT INTO `postuler`(`id_postulant`, `id_offre`) VALUES ('6','3');

