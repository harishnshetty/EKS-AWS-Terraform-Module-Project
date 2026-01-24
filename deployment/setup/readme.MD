kubectl apply --server-side -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.4.1/standard-install.yaml


helm install ngf oci://ghcr.io/nginx/charts/nginx-gateway-fabric --create-namespace -n nginx-gateway -f values.yml


helm upgrade ngf oci://ghcr.io/nginx/charts/nginx-gateway-fabric \
  -n nginx-gateway \
  -f values.yml



# Uninstall
helm uninstall ngf -n nginx-gateway

# Reinstall with corrected values
helm install ngf oci://ghcr.io/nginx/charts/nginx-gateway-fabric \
  --create-namespace \
  -n nginx-gateway \
  -f values.yaml




  kubectl patch svc external-gateway-nginx -n nginx-gateway \
  -p '{
    "metadata": {
      "annotations": {
        "service.beta.kubernetes.io/aws-load-balancer-ssl-cert": "arn:aws:acm:ap-south-1:970378220457:certificate/93296424-711a-4bb9-8bc3-f7a76c0f2d87",
        "service.beta.kubernetes.io/aws-load-balancer-ssl-ports": "443",
        "service.beta.kubernetes.io/aws-load-balancer-proxy-protocol": "*"
      }
    }
  }'


kubectl patch svc external-gateway-nginx \
  -n nginx-gateway \
  -p '{
    "metadata": {
      "annotations": {
        "service.beta.kubernetes.io/aws-load-balancer-scheme": "internet-facing",
        "service.beta.kubernetes.io/aws-load-balancer-type": "external",
        "service.beta.kubernetes.io/aws-load-balancer-nlb-target-type": "ip"
      }
    }
  }'
