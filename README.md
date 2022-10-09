# 概要
mozilla hubsをlocalで実行できるように改修  
adminはほぼ動かないので要改良

# 1 動作方法
前提  
docker-desktopとnodejs v14.19.1をインストールしておく

## 1.1 reticulumとdialogの起動
* dbのvolumeの作成(最初の一回だけ)    
 ```docker volume create --name volume_db```
* dockerでreticulumとdialogのビルド(最初の一回だけ)  
``` docker-compose build ```
* 起動  
``` docker-compose up -d ```  

* docker起動(dockerの中に入る)  
``` docker-compose exec ret bash ``` 

* reticulum modulesの更新  
``` root@***:/ret# mix ecto.create ```

* reticulum 起動  
``` root@***:/ret# iex -S mix phx.server ``` 

## 1.2 hubsの起動  
* hubs clientのインストールと起動
```
# 最初の一回だけ実行
cd hubs
npm ci
# 起動
npm run local
```
* hubs adminのインストールと起動
```
# 最初の一回だけ実行
cd hubs/admin
npm ci
# 起動
npm run local
```

## 1.3 spokeの起動
* spokeのインストールと起動  
```
最初の一回だけ実行
cd Spoke
npm install -g yarn
npm install -g cross-env
yarn install

# ここから起動
npm run run-local-reticulum
```

### 1.4 hostsファイルの編集  
hostsファイルに以下を記載

``` 
127.0.0.1 kubernetes.docker.internal
127.0.0.1 hubs.local
127.0.0.1 hubs-proxy.local
```

### 1.5 動作確認
hubsの動作(adminは動かないのでclient側だけ)  
https://hubs.local:4000/?skipadmin  
を確認  

spokeの動作(spokeからhubs.localにシーンをアップできる)  
https://hubs.local:9090/  
※ シーンアップロード時は、メール認証が求められるが、reticulumのログに認証urlが発行されるからクリックすることで認証突破可能  



