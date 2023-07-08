DROP TABLE IF EXISTS NOCs;
DROP TABLE IF EXISTS Athletes;
DROP TABLE IF EXISTS Competitions;
DROP TABLE IF EXISTS `NOC quality stats`;
DROP TABLE IF EXISTS `Number of Medals`;
DROP TABLE IF EXISTS Teams;

CREATE TABLE NOCs
(
  ID     INTEGER NOT NULL,
  NOC    CHAR    NULL    ,
  Region VARCHAR NULL    ,
  PRIMARY KEY (ID)
);

CREATE TABLE Athletes
(
  ID     INTEGER NOT NULL,
  Name   VARCHAR NULL    ,
  Sex    CHAR    NULL    ,
  NOC_id INTEGER NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (NOC_id) REFERENCES NOCs (ID)
);

CREATE TABLE Competitions
(
  Athlete_id     INTEGER NOT NULL,
  `Athlete Age`    FLOAT   NULL    ,
  `Athlete Height` FLOAT   NULL    ,
  `Athlete Weight` FLOAT   NULL    ,
  Games          CHAR    NULL    ,
  Year           INTEGER NULL    ,
  Season         CHAR    NULL    ,
  City           VARCHAR NULL    ,
  Event          VARCHAR NULL    ,
  FOREIGN KEY (Athlete_id) REFERENCES Athletes (ID)
);

CREATE TABLE `NOC quality stats`
(
  NOC_id      INTEGER NOT NULL,
  Year        INTEGER NULL    ,
  `Mean Age`    FLOAT   NULL    ,
  `Mean Height` FLOAT   NULL    ,
  `Mean Weight` FLOAT   NULL    ,
  `Mean BMI`    FLOAT   NULL    ,
  `Male Ratio`   FLOAT   NULL    ,
  `Female Ratio` FLOAT   NULL    ,
  FOREIGN KEY (NOC_id) REFERENCES NOCs (ID)
);

CREATE TABLE `Number of Medals`
(
  NOC_id INTEGER NOT NULL,
  Year   INTEGER NULL    ,
  Bronze INTEGER NULL    ,
  Silver INTEGER NULL    ,
  Gold   INTEGER NULL    ,
  Total  INTEGER NULL    ,

  FOREIGN KEY (NOC_id) REFERENCES NOCs (ID)
);

CREATE TABLE Teams
(
  ID              NOT NULL,
  Team            NULL    ,
  NOC_id INTEGER NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (NOC_id) REFERENCES NOCs (ID)
);
