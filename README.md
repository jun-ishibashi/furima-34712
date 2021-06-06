## usersテーブル

|Column           |Type    |Options      |
|-----------------|--------|-------------|
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false | 
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birth_date      | date   | null: false |

### Association
has_many :items
has_many :purchases

## itemsテーブル

|Column        |Type        |Options                         |
|--------------|------------|--------------------------------|
| image        | string     | null: false                    |
| name         | string     | null: false                    |
| description  | text       | null: false                    |
| category     | string     | null: false                    |
| condition    | string     | null: false                    |
| payment      | string     | null: false                    |
| prefecture   | string     | null: false                    |
| shipping_day | string     | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |


### Association
belongs_to :user
has_one :purchase

## purchasesテーブル

|Column       |Type        |Options                         |
|-------------|------------|--------------------------------|
| card_number | integer    | null: false                    |
| exp_month   | integer    | null: false                    |
| exp_year    | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :shipping_address

## shipping_addressesテーブル

|Column        |Type        |Options                         |
|--------------|------------|--------------------------------|
| postcode     | integer    | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| block        | string     | null: false                    |
| building     | string     | null: false                    |
| phone_number | integer    | null: false                    |
| purchase     | references | null: false, foreign_key: true |


### Association
belongs_to :purchase
