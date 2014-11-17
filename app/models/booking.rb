class Booking < ActiveRecord::Base
  belongs_to :flat
  belongs_to :user
  has_many :availabilities

  validates :user_id, :flat_id, presence: true

end
