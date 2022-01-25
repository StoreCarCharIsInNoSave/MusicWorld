class Unit < ApplicationRecord
  has_one_attached :image
  validates :name, presence: true, length: { minimum: 10 ,maximum: 50 }
  validates :description, presence: true, length: { minimum: 10 ,maximum: 100 }
end
