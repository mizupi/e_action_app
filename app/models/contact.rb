class Contact < ApplicationRecord
  validates :name, presence: true
  validates :contact, presence: true
end
