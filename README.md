# README

## アプリ名
Log-app

## 概要
学習時間を投稿するSNSアプリ。
学習時間、内容の投稿、編集、削除
学習時間の統計表示（累計、月ごと、週ごと、一日平均）
投稿へのいいね、コメント機能（ajaxによる非同期通信）
ユーザーのフォロー機能


## 本番環境
デプロイ先→https://study-log-app.herokuapp.com/
テストアカウント＆ID→


## 制作背景(意図)
「1万時間の法則」というものがあります。天才と言われるクリエイターやアスリート、起業家など何かで頂点を極めた者の共通点を科学者たちは徹底的に調べあげたところ、一万時間という鍛錬の期間があるそうです。独学によるプログラミング学習の挫折率は約70%といわれており、自分自身も学習をする中で、エラー解決に時間がかかったり、思うようなコードが書けず苦労することが多々あるため挫折しそうになる気持ちもよくわかります。
そこで、ユーザーが今までにプログラミング学習に使った内容の記録や、時間数の算出をすることにより、今まで積み上げてきたことを視覚化したいと考えました。
挫折しやすいプログラミング学習を少しでも前向きに取り組むことができればと思いこのアプリの開発を始めることにしました。

 
## DEMO


## 工夫したポイント
実際のwebサービスでも実装されている機能を試したいと思い、TECH CAMPでのカリキュラムでは学習しなかった下記の機能を実装してみました。
・Dockerを用いた仮想環境での開発
・ユーザーのフォロー機能
・メディアクエリを使用して画面幅に合わせて表示の切り替え
・フォローしたユーザーの投稿やコメントした投稿など、絞りこんで表示をさせる機能


## 使用技術(開発環境)
Ruby on Rails、jQuery、開発環境MySQL/本番環境postgresql、heroku、Docker

## 課題や今後実装したい機能
学習時間のランキング機能の実装
期間ごとの学習時間をグラフ等を用いて視覚化すること

## DB設計
### Usersテーブル
| Column         | Type        | option                         |
|:---------------|:------------|:-------------------------------|
| nick_name      | string      | null: false                    |
| email          | string      | null: false, unique: true      |
| password       | string      | null: false                    |
| family_name    | string      | null: false                    |
| first_name     | string      | null: false                    |
| family_kana    | string      | null: false                    |
| first_kana     | string      | null: false                    |
| birth_year     | int         | null: false                    |
| birth_month    | int         | null: false                    |
| birth_day      | int         | null: false                    |
| phone_number   | string      | null: false, unique: true      |
| zip            | integer     | null: false                    |
| prefecture     | integer     | null: false                    |
| city           | string      | null: false                    |
| block          | string      | null: false                    |
| building       | string      | null: false                    |
| user_id        | reference   | null: false, foreign_key: true |
| profile        | text        |                                |
| payment_id     | reference   | foreign_key: true              |
| image          | text        |                                |

### Association
- has_many :items
- has_one :address,foreign_key: true
- has_one: payment, foreign_key: true



### Itemsテーブル
| Column            | Type      | Options                        |
|:------------------|:----------|:-------------------------------|
| name              | string    | null: false                    |
| price             | string    | null: false                    |
| description       | text      | null: false                    |
| condition         | string    | null: false                    |
| user_id           | reference | null: false, foreign_key: true |
| buyer_id          | reference | foreign_key: true              |
| size_id           | reference | foreign_key: true              |
| image_id          | reference | null: false, foreign_key: true |
| category_id       | reference | null: false, foreign_key: true |
| brand_id          | reference | foreign_key: true              |
| prefecture        | integer   | null: false                    |
| ship_fee          | string    | null: false                    |
| ship_method       | integer   | null: false                    |
| ship_date         | integer   | null: false                    |
| trading_condition | string    | null: false                    |


### Association
- belongs_to :user
- belongs_to :prefecture
- belongs_to :size
- belongs_to :brand
- belongs_to :category
- belongs_to :image :dependent => :destroy
- has_one: buyer_id ,foreign_key: “user_id”
- has_one: user_id, foreign_key: “buyer_id”


### Addressesテーブル
| Column           | Type      | Options                        |
|:-----------------|:----------|:-------------------------------|
| zip              | integer   | null: false                    |
| prefecture       | integer   | null: false                    |
| city             | string    | null: false                    |
| block            | string    | null: false                    |
| building         | string    | null: false                    |
| user_id          | reference | null: false, foreign_key: true |

### Association
- has_one :user, foreign_key: true


### Sizesテーブル
| Column         | Type        | option                        |
|:---------------|:------------|:------------------------------|
| name           | string      | null: false                   |
| path           | string      |                               |
| item_id        | refernce    | null: false foreign_key: true |

### Association
- has_many :items


### Categoriesテーブル
| Column         | Type        | option                        |
|:---------------|:------------|:------------------------------|
| name           | string      | null: false                   |
| path           | string      |                               |
| item_id        | refernce    | null: false foreign_key: true |

### Association
- has_many :items


### Brandsテーブル
| Column         | Type        | option                        |
|:---------------|:------------|:------------------------------|
| name           | string      | null: false                   |
| item_id        | refernce    | null: false foreign_key: true |

### Association
- has_many :items


### Imagesテーブル
| Column         | Type        | option                        |
|:---------------|:------------|:------------------------------|
| image          | string      | null: false                   |
| item_id        | refernce    | null: false foreign_key: true |

### Association
- belongs_to :item


### Paymentsテーブル
| Column         | Type        | option                        |
|:---------------|:------------|:------------------------------|
| user_id        | reference   | null: false foreign_key: true |
| customer_id    | reference   | null: false foreign_key: true |

### Association
- has_one :user, foreign_key: true
