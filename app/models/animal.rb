class Animal < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :name, presence: true
  validates :specie, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :origin, presence: true
  has_many_attached :images
  include PgSearch::Model
  pg_search_scope :search_by_specie_and_origin,
  against: %i[specie origin],
  using:
  {
    tsearch: { prefix: true }
  }
end
