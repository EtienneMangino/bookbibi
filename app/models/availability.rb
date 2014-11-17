class Availability < ActiveRecord::Base
  belongs_to :flat
  belongs_to :booking

  validates :day, :flat_id, presence: true

end
