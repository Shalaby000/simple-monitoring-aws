
# **SIMPLE MONITORING APP ON AWS**

## Description
A simple montitoring webapp to monitor CPU and Memory usage and show warning if exceeds the limit, running on an EKS cluster on AWS

## Prerequisites
- AWS Account
- Python3 & pip3
- Docker
- Kubernetes & kubectl
- Terraform

## **Steps For Execution**
### Clone the Repository
```
git clone <repository_url>
```
### Install Dependencies
```
pip3 install -r requirements.txt
```
### Navigate to The Root Directory of The Project &  Run The Flask App

```
python3 app.py
```
### Dockerize The App
```
docker build -t <image name> .
```
### Run the Container on Port 5000
```
docker run -dt -p 5000:5000 <image name>
```
### You Can Navigate to "localhost:5000" on Your Browser to Ensure it works

### Create the ECR Repository
```
python3 ecr.py
```
### Push the Image to the ECR Repo Following Push commands on AWS Console
Credentials then tagging image then:
```
docker push <ecr_repo_uri>:<tag>
```
### Create the EKS Cluster and Node Group After Replacing Placeholders With Your Own Info in `main.tf` File
```
terraform init
terraform plan
terraform apply
```
### Apply the K8s Deployment and Ensure it works
```
kubectl apply -f app-deployment.yaml
kubectl get deployment -n default
```
### Expose the Deployment to Create the Service and Ensure it works
```
kubectl expose deployment/app-deployment
kubectl get svc
```
### Run Port Forward to Expose the Service on Port 5000
```
kubectl port-forward svc/app-deloyment 5000:5000
```
### Navigate to "localhost:5000" on Your Browser to Ensure it works
