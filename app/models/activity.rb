class Activity < ApplicationRecord
  has_many :users, through: :user_activities

  validates :act_name, presence: true
end