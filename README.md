# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

## usersテーブル

| Column       | Type     | Options         |
| ------------ | -------- | --------------- |
| name         | string   | null: false     |
| avator       | string   |                 |
| prefecture   | string   | null: false     |
| address      | string   | null: false     |
| birth-date   | string   | null: false     |
| credit_id    | integer  | null: false     |
| introduction | text     |                 |

### Association
- has_many :products, through: :user_products
- has_many :user_products
- has_many :item_comments
- has_many :rates
- has_many :credits


## ratesテーブル

| Column     | Type     | Options     |
| ---------- | -------- | ----------- |
| rank       | integer  | null: false |
| comment    | text     |             |
| user_id    | integer  | null: false |
| product_id | integer  | null: false |

### Association
belongs_to :user
belongs_to :product


## creditsテーブル

| Column        | Type     | Options                       |
| ------------- | -------- | ----------------------------- |
| credit_number | integer  | null: false                   |
| user_id       | integer  | null: false, foreign_key: true|
| expiry_date   | integer  | null: false                   |
|security_code  | integer  | null: false                   |

### Association
belongs_to :user


## user-products(likeテーブル)

| Column     | Type     | Options     |
| ---------- | -------- | ----------- |
| product_id | string   | null: false |
| user_id    | string   | null: false |

### Association
belongs_to :user
belongs_to :product


## item-commentsテーブル

| Column     | Type     | Options     |
| ---------- | -------- | ----------- |
| comment    | Text     |             |
| user_id    | integer  | null: false |
| product_id | integer  | null: false |

### Association
belongs_to :user
belongs_to :product


## productsテーブル

| Column          | Type     | Options     |
| --------------- | -------- | ----------- | 
| name            | string   | null: false |
| description     | text     | nUll: false |
| price           | integer  | null: false |
| condition       | integer  | null: false |
| delivery_method | integer  | null: false |
| delivery_day    | integer  | null: false |
| prefecture      | string   | null: false |
| postage         | integer  | null: false |
| size_id         | integer  | null: false |
| image_id        | integer  | null: false |
| brand_id        | integer  | null: false |
| seller_id       | integer  | null: false |
| buyer_id        | string   |             |
| status          | string   | null: false |

### Association
has_many :users, through: :user_products
has_many :rates
has_many :item_comments
has_many :images
has_many :categorys, through: :category_products
belongs_to :size
belongs_to :delivery
belongs_to :brand


## categoriesテーブル

| Column        | Type     | Options  |
| ------------- | -------- | -------- |
| name          | string   |          |
| parent_id     | integer  |          |


### Association
has_many :products, through:category_products


## categorie_productsテーブル
| Column        | Type     | Options  |
| ------------- | -------- | -------- |
| category_id   | integer  |null:false|
| products_id   | integer  |null:false|

### Association
belongs_to :category
belongs_to :product


## sizesテーブル

| Column       | Type     | Options  |
| ------------ | -------- | -------- |
| clothes_size | string   |          |
| shoes_size   | string   |          |

### Association
has_many :products


## deliveriesテーブル

| Column         | Type     | Options         |
| -------------- | -------- | --------------- |
| days_to_ship   | date     | null: false     |
| mode           | string   | null: false     |
| charge         | integer  | null: false     |
| shipping-place | string   | null: false     |

### Association
has_many :products


## brandsテーブル

| Column   | Type     | Options  |
| -------- | -------- | -------- |
| name     | string   | Text     |

### Association
has_many :products


## imagesテーブル　

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
|     1      | string  | null: false |
|     2      | string  |             |
|     3      | string  |             |
|     4      | string  |             |
|     5      | string  |             |
|     6      | string  |             |
|     7      | string  |             |
|     8      | string  |             |
|     9      | string  |             |
|     10     | string  |             |
| product_id | integer | null: false |

### Association
belongs_to :product


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
