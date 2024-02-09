# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| name               | string | null: false |
| address            | string | null: false |
| phone_num          | string | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :orders


## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| price              | integer| null: false |
| category           | string | null: false |
| condition          | string | null: false |
| shipping_cost      | string | null: false |
| shipping_area      | string | null: false |
| estimated_shipping | string | null: false |
| user_id            | references   | null: false, foreign_key: true |
| status             | string | null: false |

### Association

- belongs_to :user
- has_many :comments
- has_one :order


## comments テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| content            | text   | null: false |
| user               | references   | null: false, foreign_key: true |
| item               | references   | null: false, foreign_key: true |


### Association

- belongs_to :item
- belongs_to :user


## orders テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| order_date         | string   | null: false |
| ship_date          | string   | null: false |
| shipping_num       | string   | null: false |
| user               | references   | null: false, foreign_key: true |
| item               | references   | null: false, foreign_key: true |


### Association

- belongs_to :item
- belongs_to :user