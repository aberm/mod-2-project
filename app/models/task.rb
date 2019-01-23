class Task < ApplicationRecord
  belongs_to :boss
  belongs_to :tasker, optional: true

  validates :location, presence: true
  validates :description, presence: true, length: { minimum: 5, maximum: 250 }
  validates :vehicle, inclusion: { in: [ true, false ] }
  validates :minutes, presence: true, numericality: true
  validates :price_rate, presence: true, numericality: true

end
