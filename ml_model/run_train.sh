#!/bin/bash

# ml_model/run_train.sh

echo "📦 Installing dependencies..."
pip install -r requirements.txt

echo "🧠 Running training..."
python train.py

