# EKS-AWS-Terraform-Module-Project


## For more projects, check out  
[https://harishnshetty.github.io/projects.html](https://harishnshetty.github.io/projects.html)

[![Video Tutorial](https://github.com/harishnshetty/image-data-project/blob/f4cbae3f8429073cb96264ef402ecbe511db6bc4/1eksterraform.JPG)](https://youtu.be/BgyYqUXuHuk?si=Gi6vkxhnVJQBILkG)

[![Channel Link](https://github.com/harishnshetty/image-data-project/blob/f4cbae3f8429073cb96264ef402ecbe511db6bc4/2eks.JPG)](https://youtu.be/BgyYqUXuHuk?si=Gi6vkxhnVJQBILkG)

## 1. Terraform Installation

```bash
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs)" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install -y terraform packer git jq unzip
```

## 2. AWS CLI Installation

Refer: [AWS CLI Installation Guide](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

```bash
sudo apt install -y unzip jq
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

## 3. AWS CLI Configuration

```bash
aws configure
```

## 4. Helm Installation

Refer: [Helm Installation Guide](https://helm.sh/docs/intro/install/)

```bash
sudo apt-get install curl gpg apt-transport-https --yes
curl -fsSL https://packages.buildkite.com/helm-linux/helm-debian/gpgkey | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/helm.gpg] https://packages.buildkite.com/helm-linux/helm-debian/any/ any main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm bash-completion

# Enable Helm auto-completion
echo 'source <(helm completion bash)' >> ~/.bashrc
echo 'alias h=helm' >> ~/.bashrc
echo 'complete -F __start_helm h' >> ~/.bashrc

# Apply changes immediately
source ~/.bashrc
```


```bash
terraform destroy -var-file="dev.tfvars" -auto-approve
terraform destroy -var-file="stage.tfvars" -auto-approve
terraform destroy -var-file="prod.tfvars" -auto-approve
``` 


## 5. EKS Cluster Setup
```bash
aws configure
aws sts get-caller-identity
```

## 6. Terraform Apply
```bash
tf apply -var-file=dev.tfvars -auto-approve
```

## 7. Install EKS Addons version check
```bash
helm repo add eks https://aws.github.io/eks-charts
helm repo update eks
helm search repo eks/aws-load-balancer-controller --versions
helm list -A
```

## 8. Install EKS Addons argo-cd version check
```bash
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
helm search repo argo/argo-cd --versions
helm list -A
```

## 9. Install EKS Addons prometheus version check
```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update prometheus-community
helm search repo prometheus-community/kube-prometheus-stack --versions
helm list -A
```

## 10. update the kubeconfig
```bash
aws eks update-kubeconfig --name dev-my-cluster --region ap-south-1
```

## 11. get the argocd server url
```bash
kubectl get svc argocd-server -n argocd -o json | jq --raw-output '.status.loadBalancer.ingress[0].hostname'
```

## 12. get the argocd admin password
```bash
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```

## 13. get the prometheus admin password
```bash
kubectl get secret --namespace prometheus prometheus-grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
```

## 14. get the prometheus grafana image
```bash
helm list -n prometheus
kubectl get pods -n prometheus -l app.kubernetes.io/name=grafana -o jsonpath='{.items[*].spec.containers[*].image}'
```

## 15. reset the prometheus grafana admin password
```bash 
kubectl exec --namespace prometheus -it $(kubectl get pods --namespace prometheus -l app.kubernetes.io/name=grafana -o jsonpath="{.items[0].metadata.name}") -- grafana-cli admin reset-admin-password Abcd@1234
```

## 16. Delete the Deployments
```bash
kubectl delete -f .
```

## 17. Destory the infrastructure
```bash
terraform destroy -var-file="dev.tfvars" -auto-approve
terraform destroy -var-file="stage.tfvars" -auto-approve
terraform destroy -var-file="prod.tfvars" -auto-approve
```