class Entity < ApplicationRecord
  belongs_to :author, class_name: :User
  belongs_to :category

  validates :name, presence: true
  validates :amount, presence: true, numericality: { only_integer: true }
end
