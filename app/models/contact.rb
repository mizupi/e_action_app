class Contact < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { maximum: 10 }
  validates :content, presence: true, length: { maximum: 100 }
end
