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

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update prometheus-community

helm search repo prometheus-community/kube-prometheus-stack --versions

| Gateway Implementation   | controllerName                                   |
| ------------------------ | ------------------------------------------------ |
| **AWS ALB Gateway**      | `eks.amazonaws.com/aws-load-balancer-controller` |
| **NGINX Gateway Fabric** | `gateway.nginx.org/nginx-gateway-controller`     |
| Istio                    | `istio.io/gateway-controller`                    |
| Kong                     | `konghq.com/kic-gateway-controller`              |


kubectl apply --server-side -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.4.1/standard-install.yaml


aws eks update-kubeconfig --name dev-my-cluster --region ap-south-1


sudo apt install jq -y

kubectl get svc argocd-server -n argocd -o json | jq --raw-output '.status.loadBalancer.ingress[0].hostname'

kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d


kubectl get secret --namespace prometheus prometheus-grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo

helm list -n prometheus
