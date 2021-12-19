class Restaurant < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :photo, presence: true, length: { maximum: 50 }
  validates :address, presence: true, length: { maximum: 50 }
end
