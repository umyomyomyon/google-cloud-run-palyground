# REAMDE

## for Local
`docker build . -t {image_name}`

`docker run --name {container_name} -e PORT={port_number} -p {local_port}:{port_number} -d {image_name}`

または

`docker run -e PORT={port_number} -p {local_port}:{port_number} -d {image_name}`

すでにコンテナがある場合は

`docker start {container_name}`

### 疎通確認
`curl http://localhost:{local_port}`

## for Google Cloud run
#### gcloud ログイン
`gcloud auth login`
#### アカウント一覧
`gcloud auth list`
#### アカウント切り替え
`gcloud config set account [account name]`
#### プロジェクト切り替え
`gcloud config set project [project id]`
#### プロジェクト一覧
`gcloud projects list`

### GCR(Google Container Registry)にDockerのコンテナイメージをアップロード
`gcloud builds submit --tag gcr.io/[project id]/[container image name]`

### Cloud RunにGCRにアップロードしたコンテナをデプロイ
`gcloud run deploy --image gcr.io/[project name]/[container image name] --platform managed`

## 参考URL
---ベストオブ参考になった---

https://medium.com/google-cloud-jp/cloud-run-%E3%82%92%E6%9C%80%E9%80%9F%E3%81%A7%E8%A7%A6%E3%81%A3%E3%81%A6%E3%81%BF%E3%82%8B-6e42021307d4
https://qiita.com/Canon11/items/cc461dc57d5d9fbb5ca9
https://cloud.google.com/run/docs/quickstarts/build-and-deploy?hl=ja#python
https://cloud.google.com/run/docs/setup

---gcloudコマンド系---

https://qiita.com/masaaania/items/7a83c5e44e351b4a3a2c
https://blog.1q77.com/2020/01/gcloud-switch-account-and-project/
https://qiita.com/hnw/items/1e8ba8b6f64214205d89
https://qiita.com/zaburo/items/5091041a5afb2a7dffc8
https://www.apps-gcp.com/cloud-build-getting-started/
https://qiita.com/sonots/items/906798c408132e26b41c

---gunicorn系---  
https://blog.hirokiky.org/entry/2018/10/06/151830
https://blog.hirokiky.org/entry/2018/09/30/183840

---dockerコマンド系---
https://qiita.com/Esfahan/items/52141a2ad741933d7d4c


## 備忘録
`docker run -d -p 8080:80 container_name` したときにhttp://localhost:8080でアクセスできなかった原因は
docker内のFlaskで`app.tun(host='0.0.0.0', port='80')`を指定していなかったから
Flaskでデフォルトで外部に開いてはいない  
外部には開放されていないけど、内部からだったらアクセスできるのでlocalhost:5000でアクセスできてしまった  
これが勘違いの始まり
https://qiita.com/tomboyboy/items/122dfdb41188176e45b5
https://qiita.com/1ain2/items/194a9372798eaef6c5ab
