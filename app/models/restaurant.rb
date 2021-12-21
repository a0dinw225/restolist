class Restaurant < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :photo, presence: true, length: { maximum: 50 }
  validates :address, presence: true, length: { maximum: 50 }
  
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes, source: :user
  has_many :posts, dependent: :destroy
end
