class Activity < ApplicationRecord
  has_many :user_activities

  validates :act_name, presence: true
end
