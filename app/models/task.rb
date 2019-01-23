class Task < ApplicationRecord
  belongs_to :boss
  belongs_to :tasker, optional: true

  validates :city, presence: true
  validates :description, presence: true, length: { minimum: 5, maximum: 250 }
  validates :vehicle, inclusion: { in: [ true, false ] }
  validates :minutes, presence: true, numericality: true
  validates :price_rate, presence: true, numericality: true
  validate :date_cannot_be_in_the_past

  def date_cannot_be_in_the_past
    if time.present? && time < Date.today
      errors.add(:time, "can't be in the past")
    end
  end

  def time_view
    if self.time
      self.time.strftime("%I:%M %p, %d %B %Y")
    end
  end

  def hours_view
    if self.minutes
      self.minutes / 60.0
    end
  end

  def price_rate_view
    if self.price_rate
      self.price_rate / 100.0
    end
  end

end
