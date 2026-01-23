# EKS-AWS-Terraform-Module-Project

aws configure
aws sts get-caller-identity

tf apply -var-file=dev.tfvars -auto-approve


helm repo add eks https://aws.github.io/eks-charts
helm repo update eks

helm search repo eks/aws-load-balancer-controller --versions
helm list -A


helm repo add argo https://argoproj.github.io/argo-helm
helm repo update


helm search repo argo/argo-cd --versions
helm list -A



| Gateway Implementation   | controllerName                                   |
| ------------------------ | ------------------------------------------------ |
| **AWS ALB Gateway**      | `eks.amazonaws.com/aws-load-balancer-controller` |
| **NGINX Gateway Fabric** | `gateway.nginx.org/nginx-gateway-controller`     |
| Istio                    | `istio.io/gateway-controller`                    |
| Kong                     | `konghq.com/kic-gateway-controller`              |


kubectl apply --server-side -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.4.1/standard-install.yaml


aws eks update-kubeconfig --name dev-my-cluster --region ap-south-1
