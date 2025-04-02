## 5. Développement de l'Interface Utilisateur

#Pour le tableau de bord interactif, vous pouvez utiliser des frameworks comme **Streamlit** ou **Dash**. Voici un exemple avec Streamlit.

### Exemple de Code (Streamlit)

import streamlit as st
import requests
import pandas as pd

st.title("Tableau de Bord MedPredict AI")

# Affichage d'indicateurs (exemple statique)
st.metric("Prédictions fiables", "85%")
st.metric("Pannes prévues", "3 cette semaine")

# Affichage d'un graphique simulé
data = pd.DataFrame({
    'Jour': ['Lun', 'Mar', 'Mer', 'Jeu', 'Ven'],
    'Nombre de pannes': [1, 2, 0, 3, 1]
})
st.line_chart(data.set_index('Jour'))

# Formulaire pour tester la prédiction via l'API
st.header("Tester la Prédiction")
features = st.text_input("Entrez les features (séparées par des virgules):")
if st.button("Prédire"):
    # Conversion des features en liste de float
    features_list = [float(x) for x in features.split(',')]
    response = requests.post("http://localhost:5000/predict", json={'features': features_list})
    result = response.json()
    st.write("Prédiction de panne:", result['prediction'])

