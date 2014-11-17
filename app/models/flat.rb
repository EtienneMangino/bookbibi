class Flat < ActiveRecord::Base
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :availabilities, dependent: :destroy

  validates :address, :title, :description, :user_id, presence: true

end
