class CatFact < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  validates :description, presence: true
  validates :description, uniqueness: true
end
