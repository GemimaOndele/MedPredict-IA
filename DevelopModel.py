## 3. Développement des Modèles de Machine Learning

#Nous allons utiliser scikit-learn pour entraîner un modèle de prédiction (par exemple, un RandomForestClassifier).

### Exemple de Code (Python)

from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score
import pandas as pd

# Chargement des données (supposons que le fichier 'maintenance_data.csv' contient des features et une colonne 'panne' indiquant la panne)
data = pd.read_csv('maintenance_data.csv')

# Séparation des features et de la cible
X = data.drop('panne', axis=1)
y = data['panne']

# Division en sets d'entraînement et de test
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)

# Initialisation et entraînement du modèle
model = RandomForestClassifier(n_estimators=100, random_state=42)
model.fit(X_train, y_train)

# Prédictions et évaluation
predictions = model.predict(X_test)
accuracy = accuracy_score(y_test, predictions)
print(f"Précision du modèle : {accuracy:.2f}")


