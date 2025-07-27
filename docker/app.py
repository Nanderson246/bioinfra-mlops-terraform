# docker/app.py
from flask import Flask, request, jsonify
import joblib
import numpy as np

app = Flask(__name__)

try:
    model = joblib.load("model.pkl")
except Exception as e:
    raise RuntimeError("Model not found or couldn't load. Train it first.") from e

@app.route("/predict", methods=["POST"])
def predict():
    try:
        data = request.get_json()
        features = np.array([data['A'], data['B']]).reshape(1, -1)
        prediction = model.predict(features)[0]
        return jsonify({"prediction": int(prediction)})
    except Exception as e:
        return jsonify({"error": str(e)}), 400

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

