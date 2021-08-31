|記述すること|備考|
|---|---|
|アプリケーション名|BUCKET LIST|
|アプリケーション概要|目標をシェアし、ユーザー同士でコミュニケーションを取ることで、目標達成に向けて励まし合うことができる。|
|URL|http://00.00.000.000/|
|テスト用アカウント|・メールアドレス: test@test.com<br>・パスワード: test1234|
|利用方法|まず、トップページの一覧ページのヘッダーからユーザー新規登録を行う。新規目標投稿ボタンから、目標の内容を入力し投稿する。|
|アプリケーションを作成した背景|学生時代の友人に課題をヒアリングをし、「学習を継続できない」という課題を抱えていることが判明した。課題を分析した結果、「目標を共有する仲間や発信の場がない」が真因であると仮説を立てた。同様の問題を抱えているユーザーも多いと推測し、真因を解決するために、目標を共有しユーザー同士のコミュニケーションを促進できるSNSアプリケーションを開発することにした。|
|洗い出した要件|[要件定義を記載したシート](http://00.00.000.000/)|
|実装した機能についての画像やGIFおよびその説明|実装した機能について、それぞれどのような特徴があるのかを列挙する形で記述。画像はGyazoで、GIFはGyazoGIFで撮影すること。|
|実装予定の機能|現在、検索機能を実装中。今後は、ログイン時のSNS認証機能やSNSでの共有機能の実装を予定している。|
|データベース設計|[![Image from Gyazo](https://i.gyazo.com/21e2f0d2d056b724cfe1b4933e1ab5f3.png)](https://gyazo.com/21e2f0d2d056b724cfe1b4933e1ab5f3)|
|画面遷移図|[![Image from Gyazo](https://i.gyazo.com/b7bf1eabb85caa086bebfdbd254ab236.png)](https://gyazo.com/b7bf1eabb85caa086bebfdbd254ab236)|
|開発環境|・フロントエンド：HTML,CSS / JavaScript<br>・バックエンド：Ruby（ver 2.5.1） / Ruby on Rails（ver 6.0.4）<br>・インフラ：AWS（EC2 / S3）, Nginx, MySQL<br>・テスト：RSpec<br>・テキストエディタ：Visual Studio Code<br>・タスク管理：GitHubプロジェクトボード|
|ローカルでの動作方法|以下、コマンドを順に実行してください。<br>% git clone https://github.com/xxxxxxxx<br>% cd xxxxxxxx<br>% bundle install<br>% yarn install
```|
