CREATE TABLE Agence (
    NumAgence int PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    Nom varchar(50), 
    Adresse varchar(100), 
    NumTel varchar(10), 
    Mail varchar(50)
);





CREATE TABLE Technicien (
    Id int PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    Qualification varchar(100),
    NumAgence int NOT NULL,
    FOREIGN KEY (NumAgence) REFERENCES Agence(NumAgence)
);

CREATE TABLE Intervention (
    Id int NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    DateIntervention date, 
    Commentaire varchar(200),
    IdTechnicien int NOT NULL,
    FOREIGN KEY (IdTechnicien) REFERENCES Technicien(Id)
);

CREATE TABLE MaterielVerifie (
    NumSerie int PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    Label varchar(100), 
    Description varchar(200), 
    Temps time,
    IdIntervention int NOT NULL,
    FOREIGN KEY (IdIntervention) REFERENCES Intervention(Id)
);

CREATE TABLE TypeMateriel (
    typeMateriel VARCHAR(20) PRIMARY KEY NOT NULL, 
    libelle VARCHAR(100)
);


CREATE TABLE Client (
    numero_client INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    raison_social VARCHAR(100), 
    numero_siren VARCHAR(20), 
    cope_ape VARCHAR(20), 
    adresse_postal VARCHAR(40), 
    numero_telphone VARCHAR(20), 
    numero_telecopie VARCHAR(20), 
    email VARCHAR(255), 
    distance_agence FLOAT, 
    duree_moyenne_deplacement INT, 
    agence_id INT, 
    FOREIGN KEY (agence_id) REFERENCES Agence(NumAgence)
);

CREATE TABLE MaterielInstalle(
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    typeMateriel VARCHAR(20), 
    dateVente DATE, 
    dateInstall DATE, 
    prixVente FLOAT, 
    numero_client INT NOT NULL,
    FOREIGN KEY (typeMateriel) REFERENCES TypeMateriel(typeMateriel),
    FOREIGN KEY (numero_client) REFERENCES Client(numero_client)
);

CREATE TABLE Contrat(
    numero_contrat INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    date_signature DATE, 
    date_echeance DATE, 
    date_renouvellement DATE, 
    client_id INT, 
    FOREIGN KEY (client_id) REFERENCES Client(numero_client)
);
