🔍 What is model.pkl?
It's a pickled version of your trained model, saved using joblib.dump():

python
Copy
Edit
joblib.dump(model, "model.pkl")
This creates a file you can:

Reuse later without retraining the model

Load in another Python script (like an API or notebook)

Package into a Docker container for serving

Deploy in cloud services or REST endpoints

🧠 Why save it separately (besides MLflow)?
Even though you already logged the model to MLflow, saving model.pkl:

✅ Makes local development faster — just joblib.load("model.pkl") to use it again.

✅ Enables easy REST API deployment (like Flask or FastAPI).

✅ Lets you decouple training from inference — train once, reuse many times.

✅ Example: How you'd use model.pkl later
python
Copy
Edit
import joblib

model = joblib.load("model.pkl")
pred = model.predict([[1, 0]])
print(pred)
Or in your app.py (Flask):

python
Copy
Edit
model = joblib.load("model.pkl")

@app.route("/predict", methods=["POST"])
def predict():
    data = request.get_json()
    features = [[data['A'], data['B']]]
    prediction = model.predict(features)
    return {"prediction": int(prediction[0])}
🚀 Summary
File	Purpose
model.pkl	Portable, loadable model file for use in APIs, testing, or packaging
MLflow log	Tracks experiment metrics and stores versioned model for reproducibility




