class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_activities
  has_many :contacts

  has_many :active_relationships,  class_name: 'Relationship',
                                   foreign_key: 'follower_id',
                                   dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship',
                                   foreign_key: 'followed_id',
                                   dependent: :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_one_attached :image

  validates :user_name, presence: true, length: { maximum: 10 }

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates_format_of :password, with: PASSWORD_REGEX, message: 'が正しくありません。アルファベットと数字の両方を入れてください'

  # ユーザーをフォローする
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # ユーザーをフォロー解除する
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしていたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end

  # 現在のユーザーにフォローされていたらtrueを返す
  def followers?(other_user)
    followers.include?(other_user)
  end

  # ともだち判定
  def matchers
    following & followers
  end

  # ユーザー検索
  def self.search(search)
    User.where('user_name LIKE(?)', "%#{search}%") if search != ''
  end

  # ユーザー検索範囲から対象ユーザーを除く
  scope :others, ->(user) { where.not(id: user.id) }
end
