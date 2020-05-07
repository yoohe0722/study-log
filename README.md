# README

## アプリ名
Log-app

## 概要
学習時間を投稿するSNSアプリ。<br>
学習時間、内容の投稿、編集、削除<br>
学習時間の統計表示（累計、月ごと、週ごと、一日平均）<br>
投稿へのいいね、コメント機能（ajaxによる非同期通信）<br>
ユーザーのフォロー機能
<br>

## 本番環境
デプロイ先→https://study-log-app.herokuapp.com/
テストアカウント＆ID→
<br>

## 制作背景(意図)
「1万時間の法則」というものがあります。天才と言われるクリエイターやアスリート、起業家など何かで頂点を極めた者の共通点を科学者たちは徹底的に調べあげたところ、一万時間という鍛錬の期間があるそうです。<br>
独学によるプログラミング学習の挫折率は約70%といわれており、自分自身も学習をする中でエラー解決に時間がかかったり、思うようなコードが書けず苦労することが多々あったため挫折しそうになる気持ちもよくわかります。<br>
そこで、ユーザーが今までにプログラミング学習に使った内容の記録や、時間数の算出をすることにより、今まで積み上げてきたことを視覚化したいと考えました。<br>
挫折しやすいプログラミング学習を少しでも前向きに取り組むことができればと思いこのアプリの開発を始めることにしました。
<br>

## DEMO

<br>

## 工夫したポイント
実際のwebサービスでも実装されている機能を試したいと思い、TECH CAMPでのカリキュラムでは学習しなかった下記の機能を実装してみました。
- Dockerを用いた仮想環境での開発
- ユーザーのフォロー機能
- メディアクエリを使用して画面幅に合わせて表示の切り替え
- フォローしたユーザーの投稿やコメントした投稿など、絞りこんで表示をさせる機能
<br>

## 使用技術(開発環境)
Ruby on Rails、jQuery、開発環境MySQL/本番環境postgresql、heroku、Docker
<br>

## 課題や今後実装したい機能
学習時間のランキング機能の実装<br>
期間ごとの学習時間をグラフ等を用いて視覚化すること
<br>

## DB設計
### Usersテーブル
| Column         | Type        | option                         |
|:---------------|:------------|:-------------------------------|
| email          | string      | null: false, unique: true      |
| nick_name      | string      | null: false, default: ""       |
| encrypted_password| string   | null: false, default: ""       |
| image          | text        |                                |

### Association
- has_many :posts, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy

- has_many :active_relationships, class_name:  "Relationship",  
                                  foreign_key: "follower_id",  
                                  dependent:   :destroy  
- has_many :passive_relationships, class_name:  "Relationship",  
                                    foreign_key: "followed_id",  
                                    dependent:   :destroy
- has_many :following, through: :active_relationships, source: :followed
- has_many :followers, through: :passive_relationships, source: :follower

<br>


### Postsテーブル
| Column            | Type      | Options                        |
|:------------------|:----------|:-------------------------------|
| name              | string    | null: false                    |
| date              | date      | null: false                    |
| study_time        | integer   | null: false                    |
| text              | text      | null: false                    |
| comments_count    | integer   |                                |
| likes_count       | integer   |                                |
| user_id           | reference | null: false, foreign_key: true |



### Association
- belongs_to :user
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
<br>

### Commentsテーブル
| Column           | Type      | Options                        |
|:-----------------|:----------|:-------------------------------|
| user_id          | reference | null: false, foreign_key: true |
| post_id          | reference | null: false, foreign_key: true |
| text             | text      | null: false                    |

### Association
- belongs_to :user
- belongs_to :post
<br>

### Likesテーブル
| Column         | Type        | option                         |
|:---------------|:------------|:-------------------------------|
| user_id        | reference   | null: false, foreign_key: true |
| post_id        | reference   | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :post
<br>

### Relationshipsテーブル
| Column         | Type        | option                        |
|:---------------|:------------|:------------------------------|
| follower_id    | reference   |                               |
| followed_id    | reference   |                               |


### Association
- belongs_to :follower, class_name: "User"
- belongs_to :followed, class_name: "User"
<br>