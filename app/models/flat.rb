class Flat < ActiveRecord::Base
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :availabilities, dependent: :destroy

  validates :address, :city, :title, :description, :user_id, presence: true


  has_attached_file :picture,
    styles: { large: "500x500>", medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/


  after_save :set_availabilities

  private
  def set_availabilities
    (0..90).each do |i|
        date = Date.today+i
        availability = self.availabilities.new(day:date)
        availability.save
    end
  end
end
