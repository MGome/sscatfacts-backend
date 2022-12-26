class CatFact < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
end
