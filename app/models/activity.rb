class Activity < ApplicationRecord
  has_many :user_activities

  validates :activity, presence: true
end
