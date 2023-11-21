echo "Running container..."
docker run --name flask_app -d -p 5000:5000 490188592902.dkr.ecr.us-east-1.amazonaws.com/cropanalysis:latest
