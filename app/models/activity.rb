class Activity < ApplicationRecord
  belongs_to :user, through: :user_activities

  validates :act_name, presence: true
end