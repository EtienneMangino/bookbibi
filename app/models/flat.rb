class Flat < ActiveRecord::Base
  belongs_to :user
  has_many :bookings
  has_many :availabilities

  validates :address, :title, :description, :user_id, presence: true

end
