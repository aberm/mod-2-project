class Tasker < ApplicationRecord
  has_many :tasks
  has_many :bosses, through: :tasks
  validates :name, presence: true, length: { minimum: 4 }
  validates :email, confirmation: true, uniqueness: true
  validates :username, presence: true, uniqueness: true, length: { minimum: 5 }
  validates :bio, presence: true, allow_blank: false, length: { minimum: 50, maximum: 1000 }
  validates :vehicle, inclusion: { in: [ true, false ] }
end
