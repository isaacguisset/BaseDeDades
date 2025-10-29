ALTER TABLE Professionals
ADD telefon int;

CREATE TABLE Zones(
id int not null,
nom varchar(100) not null,
constraint pk_Zones PRIMARY KEY (id),
constraint ak_Zones UNIQUE (nom)
);
INSERT INTO Zones(id,nom)
values
(1,'Nord'),
(2, 'Sud'),
(3, 'Centre');
ALTER TABLE Serveis
ADD zona_id int,
constraint fk_Serveis_a_Zones FOREIGN KEY (zona_id)
references Zones(id)
on delete set null
on update cascade
;

UPDATE Serveis
SET zona_id = 3
WHERE id = 3;
ALTER TABLE Intervencions 
ADD CONSTRAINT chK_Intervencions CHECK(hores_totals>0);

ALTER TABLE Serveis
ADD observacions varchar(500);