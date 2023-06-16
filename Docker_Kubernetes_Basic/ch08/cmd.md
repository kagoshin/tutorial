## デプロイメント読込み
kubectl apply -f /Users/kagoshin/tutorial/Docker_Kubernetes_Basic/ch08/kube_folder/apa000dep.yml

kubectl get pods

## サービス読込み
kubectl apply -f /Users/kagoshin/tutorial/Docker_Kubernetes_Basic/ch08/kube_folder/apa000ser.yml

kubectl get services

## デプロイメント削除
kubectl delete -f /Users/kagoshin/tutorial/Docker_Kubernetes_Basic/ch08/kube_folder/apa000dep.yml

kubectl get deployment

## サービス削除
kubectl delete -f /Users/kagoshin/tutorial/Docker_Kubernetes_Basic/ch08/kube_folder/apa000ser.yml

kubectl get service