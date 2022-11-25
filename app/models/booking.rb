class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :animal
  validates :arrival_date, presence: true
  validates :end_date, presence: true
end
