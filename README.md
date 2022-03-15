

## users テーブル

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| user_name          | string   | null: false               |
| email              | email    | null: false, unique: true |
| encrypted_password | password | null: false               |

### Association

- has_many :user_activities
- has_many :active_relationships,  class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
- has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
- has_many :following, through: :active_relationships,  source: :followed
- has_many :followers, through: :passive_relationships, source: :follower

## relationships テーブル

| Column        | Type      |
| --------------| --------- |
| follower_id   | integer   |
| followed_id   | integer   |

### Association

- belongs_to :follower, class_name: 'User'
- belongs_to :followed, class_name: 'User'

## activitiesテーブル

| Column     | Type       | Options             |
| ---------- | ---------- | ------------------- |
| activity   | string     | null: false         |

### Association

- has_many :user_activities

## user_activities テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| activity | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :activity