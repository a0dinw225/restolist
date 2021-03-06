class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  
  has_many :likes
  has_many :like_restaurants, through: :likes, source: :restaurant
  has_many :posts, dependent: :destroy
  
  def like(restaurant)
    self.likes.find_or_create_by(restaurant_id: restaurant.id)
  end
  
  def unlike(restaurant)
    like = self.likes.find_by(restaurant_id: restaurant.id)
    like.destroy if like
  end
  
  def liked_by?(restaurant)
    self.like_restaurants.include?(restaurant)
  end
end
