class Flat < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :reviews
  has_many :bookings
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_title_city_zipcode,
  against: [ :title, :city, :zipcode ],
  using: {
    tsearch: { prefix: true }
  }
end
