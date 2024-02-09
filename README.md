# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| first_name_full    | string | null: false |
| last_name_full     | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| year_of_birth      | string | null: false |
| month_of_birth     | string | null: false |
| day_of_birth       | string | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :orders


## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| price              | integer| null: false |
| category           | integer| null: false |
| condition          | integer| null: false |
| shipping_cost      | integer| null: false |
| shipping_area      | integer| null: false |
| estimated_shipping | integer| null: false |
| user               | references   | null: false, foreign_key: true |

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
| user               | references   | null: false, foreign_key: true |
| item               | references   | null: false, foreign_key: true |
| shipping_address   | references   | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :shipping_address


## shipping_address テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| address            | string | null: false |
| order              | references | null: false, foreign_key: true |


### Association

- belongs_to :order