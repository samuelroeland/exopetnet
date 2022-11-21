class Animal < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, presence: true
  validates :specie, presence: true
  validates :description, presence:true
  validates :price, presence:true
  vaidates :origin, presence: true
end
