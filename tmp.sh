helm install -n argocd --create-namespace --version='3.33.5' argocd argocd/argo-cd

kubectl port-forward service/argocd-server -n argocd 8080:443 &

kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo

kubectl -n argocd apply -f argocd-applicationset.Application.yml

kubectl -n argocd apply -f node-exporter.ApplicationSet.yml
