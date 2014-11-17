class Availability < ActiveRecord::Base
  belongs_to :flat
  belongs_to :booking
end
