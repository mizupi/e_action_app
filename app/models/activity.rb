class Activity < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :act_name

  validates :act_name_id
end
