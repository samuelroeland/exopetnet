class User < ApplicationRecord
  has_many :bookings
  has_many :animals
  validates :username, presence: true
  validates :user_type, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
