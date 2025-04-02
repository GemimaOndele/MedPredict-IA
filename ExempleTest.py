#2. Collecte et Prétraitement des Données

#À ce stade, l'objectif est de rassembler les données des capteurs associés à vos équipements médicaux et de les préparer pour l'analyse. Ces données peuvent provenir de diverses sources, telles que des fichiers CSV exportés depuis vos systèmes actuels ou des bases de données existantes.​

#a. Collecte des Données

#Si vous disposez déjà de données historiques provenant de vos capteurs, assurez-vous qu'elles sont accessibles et dans un format exploitable, comme CSV ou JSON. Si ce n'est pas le cas, vous pouvez envisager de simuler des données pour les premières phases de développement.​

#b. Chargement des Données en Python

import pandas as pd

# Chargement des données depuis un fichier CSV
data_capteurs = pd.read_csv('donnees_capteurs.csv')

# Affichage des premières lignes du dataframe
print(data_capteurs.head())


#c. Prétraitement des Données

#Le prétraitement est une étape cruciale pour garantir la qualité des données avant l'analyse. Voici quelques opérations courantes :​

#Gestion des Valeurs Manquantes : Supprimez ou imputez les valeurs manquantes pour éviter les biais dans l'analyse.​


# Suppression des lignes avec des valeurs manquantes
 data_capteurs = data_capteurs.dropna()

#Normalisation des Données : Mettez à l'échelle les données pour assurer une cohérence entre les différentes variables.​


from sklearn.preprocessing import MinMaxScaler

  scaler = MinMaxScaler()
  data_capteurs[['valeur_normalisee']] = scaler.fit_transform(data_capteurs[['valeur']])

#Encodage des Variables Catégorielles : Transformez les variables catégorielles en variables numériques si nécessaire.​


# Encodage one-hot des variables catégorielles
  data_capteurs = pd.get_dummies(data_capteurs, columns=['type_capteur'])

#d. Stockage des Données Prétraitées

#Après le prétraitement, il est judicieux de stocker les données nettoyées dans votre base de données MySQL pour une utilisation ultérieure. Utilisez SQLAlchemy, une bibliothèque ORM pour Python, afin de faciliter cette interaction :​


from sqlalchemy import create_engine

# Création de la connexion à la base de données
engine = create_engine('mysql+pymysql://<utilisateur>:<mot_de_passe>@<hôte>/<nom_de_la_base>')

# Insertion des données prétraitées dans une table nommée 'donnees_capteurs'
data_capteurs.to_sql('donnees_capteurs', con=engine, if_exists='replace', index=False)