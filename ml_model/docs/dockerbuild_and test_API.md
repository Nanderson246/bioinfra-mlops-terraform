cd docker
docker build -t ml-docker-app .
docker run -p 5000:5000 ml-docker-app

Then test the API:

bash
Copy
Edit
curl -X POST http://localhost:5000/predict \
     -H "Content-Type: application/json" \
     -d '{"A": 1, "B": 0}'

