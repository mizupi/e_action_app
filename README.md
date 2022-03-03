# E-Actionのテーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many :activities, through: :user_activities
- has_many :relationships

## relationships テーブル

| Column      | Type       | Options                                     |
| ------------| ---------- | ------------------------------------------- |
| user        | references | null: false, foreign_key: true              |
| follow      | references | null: false, foreign_key: {to_table: users} |

### Association

- belongs_to :user

## activitiesテーブル

| Column     | Type       | Options             |
| ---------- | ---------- | ------------------- |
| act_name   | string     | null: false         |

### Association

- belongs_to :user, through: :user_activities

## user_activities テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| activity | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :activity