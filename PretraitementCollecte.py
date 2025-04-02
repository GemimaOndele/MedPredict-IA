## 2. Collecte et Prétraitement des Données

import pandas as pd

# Lecture d'un fichier CSV simulant les données des capteurs
data_capteurs = pd.read_csv('donnees_capteurs.csv')
print(data_capteurs.head())

# Nettoyage et normalisation (exemple simple)
data_capteurs.dropna(inplace=True)  # Suppression des valeurs manquantes
data_capteurs['valeur_normalisee'] = (data_capteurs['valeur'] - data_capteurs['valeur'].min()) / (data_capteurs['valeur'].max() - data_capteurs['valeur'].min())


