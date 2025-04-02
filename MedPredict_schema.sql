-- Table TypeEquipement
CREATE TABLE TypeEquipement (
    id_TypeEquipement INT AUTO_INCREMENT PRIMARY KEY,
    Libelle VARCHAR(50) NOT NULL UNIQUE  -- Exemples de valeurs : 'Scanner', 'IRM', 'Radiographie', 'ECG', 'Ventilateur', 'Ultrason'
);

-- Table Equipement
CREATE TABLE Equipement (
    id_Equipement INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    statut VARCHAR(20),
    id_TypeEquipement INT NOT NULL,
    CONSTRAINT fk_type_equipement
        FOREIGN KEY (id_TypeEquipement)
        REFERENCES TypeEquipement(id_TypeEquipement)
);

-- Table HistoriqueMaintenance
CREATE TABLE HistoriqueMaintenance (
    id_Maintenance SERIAL PRIMARY KEY,
    id_Equipement INT NOT NULL,
    date_intervention DATE,
    description TEXT,
    cout DECIMAL(10,2),
    CONSTRAINT fk_equipement_maintenance
        FOREIGN KEY (id_Equipement)
        REFERENCES Equipement(id_Equipement)
);

-- Table RapportPanne
CREATE TABLE RapportPanne (
    id_Panne SERIAL PRIMARY KEY,
    id_Equipement INT NOT NULL,
    date_panne DATE,
    cause TEXT,
    action_effectuee TEXT,
    CONSTRAINT fk_equipement_panne
        FOREIGN KEY (id_Equipement)
        REFERENCES Equipement(id_Equipement)
);

-- Table Capteur
CREATE TABLE Capteur (
    id_Capteur SERIAL PRIMARY KEY,
    id_Equipement INT NOT NULL,
    type_capteur VARCHAR(50),
    emplacement VARCHAR(100),
    CONSTRAINT fk_equipement_capteur
        FOREIGN KEY (id_Equipement)
        REFERENCES Equipement(id_Equipement)
);
