class User < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :cat_facts, through: :likes

  validates :username, presence: true
  validates :username, uniqueness: true
end
