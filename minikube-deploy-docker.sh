# load all necessary env variables
eval $(minikube docker-env)

# read Dockerfile and create the container hello-kube
docker build -t docker-project-1:v1 ./project-1
docker build -t docker-project-2:v1 ./project-2

# deployment
kubectl create deployment project-1 --image=docker-project-1:v1
kubectl create deployment project-2 --image=docker-project-2:v1

# Service
kubectl expose deployment project-1 --type=NodePort --port=8080
kubectl expose deployment project-2 --type=NodePort --port=8084

# alternatively, use kubectl to forward the port:
#kubectl port-forward service/hello-minikube 7080:8080
