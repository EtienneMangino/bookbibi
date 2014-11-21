class Flat < ActiveRecord::Base
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :availabilities, dependent: :destroy

  validates :address, :city, :title, :description, :user_id, presence: true

  has_attached_file :picture,
    styles: { large: "450x450#", medium: "300x300#", thumb: "150x150#" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  validates_attachment_presence :picture


  before_validation :strip_whitespace
  after_save :set_availabilities

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  private
  def set_availabilities
    (0..90).each do |i|
        date = Date.today+i
        availability = self.availabilities.new(day:date)
        availability.save
    end
  end
  def strip_whitespace
    self.title = self.title.strip
    self.address = self.address.strip
    self.city = self.city.strip
  end
end
