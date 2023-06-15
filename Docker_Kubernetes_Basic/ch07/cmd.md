## 実行
docker-compose -f /Users/kagoshin/tutorial/Docker_Kubernetes_Basic/ch07/com_folder/docker-compose.yml up -d

## 停止・削除
docker-compose -f /Users/kagoshin/tutorial/Docker_Kubernetes_Basic/ch07/com_folder/docker-compose.yml down

## 後始末
docker image rm wordpress mysql:8.0

docker volume rm com_folder_mysql000vol11 com_folder_wordpress000vol12