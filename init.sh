set pipefail -e
CLUSTER_NAME="backstage-cluster"

echo "🆙 Creating Kubernetes Cluster with Kind"
kind create cluster --config=./kind/kind-config.yaml --name backstage-cluster

kubectl cluster-info --context kind-$CLUSTER_NAME 

echo "Installing Nginx Ingress Controller in the cluster"

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

echo "Installing ArgoCD in the cluster"
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
helm upgrade --install argocd argo/argo-cd -n argocd --create-namespace -f charts/argo/values.yaml

kubectl rollout restart deployment argocd-server -n argocd

kubectl get all -n argocd