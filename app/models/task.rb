class Task < ApplicationRecord
  belongs_to :boss
  belongs_to :tasker, optional: true

  validates :location, presence: true
  validates :description, presence: true, length: { minimum: 5, maximum: 250 }
  validates :vehicle, inclusion: { in: [ true, false ] }
  validates :minutes, presence: true, numericality: true
  validates :price_rate, presence: true, numericality: true


 TaskList = ["Cleaning", "Decoration", "Delivery", "Errands", "Event-Planning", "Event-Staffing", "Personal Assistant", "Furniture Assembly", "Help Moving", "Heavy Lifting", "Home Repairs", "Mounting", "Organization", "Shopping", "Waiting-in-Line", "Carpentry", "Deep Cleaning", "Electrician", "Plumbing", "Yard Work"]
end
