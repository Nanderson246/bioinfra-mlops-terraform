import mlflow
from mlflow.tracking import MlflowClient
import pandas as pd

# Connect to the local tracking server
client = MlflowClient()

# List all experiments
experiments = client.list_experiments()
print("\n🧪 Experiments:")
for exp in experiments:
    print(f"ID: {exp.experiment_id}, Name: {exp.name}, Artifact Location: {exp.artifact_location}")

# Choose experiment by name
experiment_name = "BioinfraML"
experiment = client.get_experiment_by_name(experiment_name)

if experiment is None:
    print(f"Experiment '{experiment_name}' not found.")
    exit()

# List all runs for this experiment
runs = client.search_runs(
    experiment_ids=[experiment.experiment_id],
    order_by=["metrics.accuracy DESC"],
    max_results=5
)

# Convert runs to a DataFrame
df = pd.DataFrame([
    {
        "Run ID": run.info.run_id,
        "Accuracy": run.data.metrics.get("accuracy"),
        "Start Time": run.info.start_time
    }
    for run in runs
])

print("\n📊 Top 5 runs:")
print(df)

# Load model from the latest run (optional)
best_run = runs[0]
model_uri = f"runs:/{best_run.info.run_id}/mlflow_model"

print(f"\n📦 Loading best model from: {model_uri}")
model = mlflow.sklearn.load_model(model_uri)

# Example prediction
example = [[13.0, 20.0, 85.0, 520.0, 0.1] + [0]*25]  # padded to match breast cancer features
pred = model.predict(example)
print(f"🎯 Predicted class: {pred[0]}")

