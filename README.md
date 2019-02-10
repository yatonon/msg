# msg

## 開発の始め方

### Docker and Docker Compose
まずはDockerをインストールしてください。
Macの場合: https://hub.docker.com/editions/community/docker-ce-desktop-mac

```
git clone https://github.com/yatonon/msg.git && cd msg
docker-compose build
docker-compose up
docker-compose run --rm web rails db:setup db:seed

-> localhost:3000にアクセス
```

### ローカルでやる場合(時代遅れ)

#### 依存関係
* Ruby バージョン 2.5.1
* PostgreSQL 10.*

#### クローン〜バンドルインストールまで
```
git clone https://github.com/yatonon/msg.git
cd msg
bundle install --path vendor/bundle -j4
```

#### ポスグレのインストール〜設定
```
brew install postgres # インストール
pg_ctl -D /usr/local/var/postgres start # 起動
createuser -s -d -r -l -W postgres # パスワードを聞かれるので"postgres"と入力
psql -d postgres
ALTER ROLE postgres WITH SUPERUSER CREATEDB CREATEROLE; # ロールの作成
```

#### 起動まで
```
bin/rails db:setup db:seed
bin/rails s
```
