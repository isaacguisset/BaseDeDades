INSERT INTO Rols (nom, salari_base)
VALUES
('Supervisor', 25.50),
('Netejador', 15.00),
('Especialista', 20.00);

INSERT INTO Professionals(NIF, nom_complet)
values
('12345678A', 'Joan Martí Soler'),
('23456789B', 'Maria Puig Vidal'),
('34567890C', 'Pere Casals Font'),
('45678901D', 'JLaura Ribas Coma');

INSERT INTO Serveis (id, dia, adreca)
VALUES
(1, '2024-01-15', 'Carrer Major 123, Barcelona'),
(2, '2024-01-16', 'Avinguda Diagonal 456, Barcelona'),
(3, '2024-01-17', 'Plaça Catalunya 78, Barcelona');
INSERT INTO Intervencions (nif_prof, nom_rol, id_servei, hores_totals)
VALUES
('12345678A', 'Supervisor', 1, 4),
('23456789B', 'Netejador', 1, 6),
('34567890C', 'Netejador', 1, 6),
('12345678A', 'Supervisor', 2, 3),
('45678901D', 'Especialista', 2, 5),
('34567890C', 'Supervisor', 3, 4),
('23456789B', 'Netejador', 3, 6);