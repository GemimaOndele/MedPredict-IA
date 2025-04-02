## 4. Implémentation d'une API avec Flask
#Une API permettra d'interroger votre modèle en temps réel pour prédire des pannes. Voici un exemple simple d’API avec Flask.

### Exemple de Code (Flask)

from flask import Flask, request, jsonify
import pickle
import numpy as np

app = Flask(__name__)

# Supposons que le modèle est sauvegardé dans 'model.pkl'
with open('model.pkl', 'rb') as f:
    model = pickle.load(f)

@app.route('/predict', methods=['POST'])
def predict():
    # On attend des données JSON avec des features
    data = request.get_json(force=True)
    # Conversion en tableau numpy (adapté selon la structure de vos données)
    features = np.array(data['features']).reshape(1, -1)
    prediction = model.predict(features)
    return jsonify({'prediction': int(prediction[0])})

if __name__ == '__main__':
    app.run(debug=True)