# msg
## 依存関係
* Ruby バージョン 2.5.1
* PostgreSQL 10.*

## 開発の始め方
### クローン〜バンドルインストールまで
```
git clone https://github.com/yatonon/msg.git
cd msg
bundle install --path vendor/bundle -j4
```

### ポスグレのインストール〜設定
```
brew install postgres # インストール
pg_ctl -D /usr/local/var/postgres start # 起動
createuser -s -d -r -l -W postgres # パスワードを聞かれるので"postgres"と入力
psql -d postgres
ALTER ROLE postgres WITH SUPERUSER CREATEDB CREATEROLE; # ロールの作成
```

### 起動まで
```
bin/rails db:setup db:seed
bin/rails s
```
