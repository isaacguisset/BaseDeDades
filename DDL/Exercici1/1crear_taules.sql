create table Professionals(
NIF char(9) not null,
nom_complet varchar(300) not null,
-- clau primària
constraint pk_Professionals PRIMARY KEY (NIF),
-- clau alternativa
constraint ak_Professionals UNIQUE (nom_complet)

);
create table Rols(
nom varchar(100) not null,
salari_base NUMERIC(10,2) not null,
-- clau primària
constraint pk_Rols PRIMARY KEY (nom)
);

create table Serveis(
id int not null,
dia date not null,
adreca varchar(300) not null,
-- clau primària
constraint pk_Serveis PRIMARY KEY (id)
);

create table Intervencions(
nif_prof char(9) not null,
nom_rol varchar(100) not null,
id_servei int not null,
hores_totals int not null,
--clau primària
constraint pk_Intervencions PRIMARY KEY(nif_prof, id_servei),
-- clau forana de intervencions a professionals
constraint fk1_Intervencions_a_Professionals FOREIGN KEY (nif_prof)
references Professionals(NIF)
on update cascade
on delete cascade,
-- clau forana de intervencions a rols
constraint fk2_Intervencions_a_rols FOREIGN KEY (nom_rol)
references Rols(nom)
on update cascade 
on delete cascade,
-- clau forana de intervencions a serveis
constraint fk3_Intervencions_a_Serveis FOREIGN KEY (id_servei)
references Serveis(id)
on update cascade
on delete cascade

);