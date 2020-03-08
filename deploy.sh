docker build -t fabiohb/multi-client - f ./client/Dockerfile ./client
docker build -t fabiohb/multi-server - f ./server/Dockerfile ./server
docker build -t fabiohb/multi-worker - f ./worker/Dockerfile ./worker
docker push fabiohb/multi-client
docker push fabiohb/multi-server
docker push fabiohb/multi-worker
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=fabiohb/multi-server