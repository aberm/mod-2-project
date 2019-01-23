class Task < ApplicationRecord
  belongs_to :boss
  belongs_to :tasker, optional: true

  validates :location, presence: true
  validates :description, presence: true, length: { minimum: 50, maximum: 1000 }
  validates :vehicle, inclusion: { in: [ true, false ] }
  validates :rating, numericality: {greater_than: 0, less_than: 6}, allow_nil: true
  validates :review, presence: true, allow_nil: true
  validates :minutes, numericality: true
  validates :price_rate, presence: true, numericality: true
  # validates :completed, presence: true

end
