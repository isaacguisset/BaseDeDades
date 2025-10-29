CREATE TABLE genres (
id int NOT NULL,
name varchar(50) NOT NULL,
CONSTRAINT PK_genres PRIMARY KEY (id)
)                                     ;

CREATE TABLE tvshows (
code varchar(20) NOT NULL,
name varchar(100) NOT NULL,
CONSTRAINT PK_tvshows PRIMARY KEY (code)
)                                        ;

CREATE TABLE tvshow_genres (
genre_id int NOT NULL,
tvshow_code varchar(20) NOT NULL,
CONSTRAINT PK_tvshow_genres PRIMARY KEY (genre_id, tvshow_code),
CONSTRAINT FK_tvshow_genres_genres FOREIGN KEY (genre_id)
REFERENCES genres(id)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT FK_tvshow_genres_tvshows FOREIGN KEY (tvshow_code)
REFERENCES tvshows(code)
ON DELETE CASCADE
ON UPDATE CASCADE
)                                                                ;

CREATE TABLE episodes (
tvshow_code varchar(20) NOT NULL,
season int NOT NULL,
number int NOT NULL,
title varchar(100) NOT NULL,
CONSTRAINT PK_episodes PRIMARY KEY (tvshow_code, season, number),
CONSTRAINT AK_episodes UNIQUE (tvshow_code, title),
CONSTRAINT FK_episodes_tvshows FOREIGN KEY (tvshow_code)
REFERENCES tvshows(code)
ON DELETE CASCADE
ON UPDATE CASCADE
)                                                                 ;

CREATE TABLE users (
id int NOT NULL,
username varchar(50) NOT NULL,
email varchar(100) NOT NULL,
CONSTRAINT PK_users PRIMARY KEY (id),
CONSTRAINT AK_users_username UNIQUE (username),
CONSTRAIN AK_users_email UNIQUE (email)
)                                               ;

CREATE TABLE ratings (
user_id int NOT NULL,
tvshow_code varchar(20) NOT NULL,
season int NOT NULL,
number int NOT NULL,
stars int NOT NULL,
CONSTRAINT PK_ratings PRIMARY KEY (user_id, tvshow_code, season, number),
CONSTRAINT FK_ratings_users FOREIGN KEY (user_id)
REFERENCES users(id)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT FK_ratings_episodes FOREIGN KEY (tvshow_code, season, number)
REFERENCES episodes(tvshow_code, season, number)
ON DELETE CASCADE
ON UPDATE CASCADE
)                                                                         ;

INSERT INTO genres (id, name) VALUES
(1, 'Drama'),
(2, 'Comèdia'),
(3, 'Ciència-ficció'),
(4, 'Thriller');

INSERT INTO tvshows (code, name) VALUES
('BREAK', 'Breaking Bad'),
('STRANGE', 'Stranger Things'),
('OFFICE', 'The Office');

INSERT INTO tvshow_genres (genre_id, tvshow_code) VALUES
(1, 'BREAK'),
(4, 'BREAK'),
(3, 'STRANGE'),
(1, 'STRANGE'),
(4, 'STRANGE'),
(2, 'OFFICE');

INSERT INTO episodes (tvshow_code, season, number, title) VALUES
('BREAK', 1, 1, 'Pilot'),
('BREAK', 1, 2, 'Cat''s in the Bag...'),
('STRANGE', 1, 1, 'Chapter One: The Vanishing of Will Byers'),
('OFFICE', 1, 1, 'Pilot');

INSERT INTO users (id, username, email) VALUES
(1, 'joan_tv', 'joan@example.com'),                                                 ;

CREATE TABLE paisos (
iso2 char(2) NOT NULL,
nom varchar(50) NOT NULL,
CONSTRAINT PK_paisos PRIMARY KEY (iso2),
CONSTRAINT AK_paisos_nom UNIQUE (nom)
)   ;             
-- DELETE FROM nombre_de_la_tabla
-- WHERE usuario = 'nombre_del_usuario';
                        

INSERT INTO paisos (iso2, nom) VALUES
('ES', 'Espanya'),
('US', 'Estats Units');

ALTER TABLE users
ADD nacionalitat char(2) NULL ;

ALTER TABLE users
ADD CONSTRAINT FK_users_paisos FOREIGN KEY (nacionalitat)
REFERENCES paisos(iso2)
ON DELETE SET NULL
ON UPDATE CASCADE                                         ;

UPDATE users SET nacionalitat = 'ES' WHERE username = 'joan_tv';

ALTER TABLE episodes DROP CONSTRAINT AK_episodes ;

ALTER TABLE tvshow_genres DROP CONSTRAINT FK_tvshow_genres_genres  ;
ALTER TABLE tvshow_genres DROP CONSTRAINT FK_tvshow_genres_tvshows ;
ALTER TABLE episodes DROP CONSTRAINT FK_episodes_tvshows           ;
ALTER TABLE ratings DROP CONSTRAINT FK_ratings_users               ;
ALTER TABLE ratings DROP CONSTRAINT FK_ratings_episodes            ;
ALTER TABLE users DROP CONSTRAINT FK_users_paisos                  ;

TRUNCATE TABLE ratings       ;
TRUNCATE TABLE episodes      ;
TRUNCATE TABLE tvshow_genres ;
TRUNCATE TABLE users         ;
TRUNCATE TABLE tvshows       ;
TRUNCATE TABLE genres        ;
TRUNCATE TABLE paisos        ;

DROP TABLE ratings       ;
DROP TABLE episodes      ;
DROP TABLE tvshow_genres ;
DROP TABLE users         ;
DROP TABLE tvshows       ;
DROP TABLE genres        ;
DROP TABLE paisos        ;
