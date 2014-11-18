class Booking < ActiveRecord::Base
  belongs_to :flat
  belongs_to :user
  has_many :availabilities

  validates :user_id, :flat_id, :start_date, :end_date, presence: true
  validate :validatation_of_booking

  after_save :complete_availabilities

  private

  def validatation_of_booking
    if start_date.nil?  || end_date.nil?
      return
    end
    if start_date > end_date
      return errors.add(:start_date, " can't be superior to end date")
    end
    flat = Flat.find(flat_id)
    for date in start_date..end_date
      if (flat.availabilities.find_by day: date).nil?
        return errors.add( :base, "#{date} can't be booked")
      else
        if flat.availabilities.find_by(day: date).booking.present?
          return errors.add( :base,"#{date} is already booked")
        end
      end
    end
  end

  def complete_availabilities
    flat = Flat.find(flat_id)
    for date in start_date..end_date
        availability = flat.availabilities.find_by day: date
        availability.booking_id = id
        availability.save
    end
  end
end
