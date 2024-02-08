class Category < ApplicationRecord
  belongs_to :user
  has_many :entities

  validates :name, presence: true
  validates :icon, presence: true
end
