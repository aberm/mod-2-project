class Tasker < ApplicationRecord
  has_many :tasks
  has_one_attached :avatar
  has_many :bosses, through: :tasks
  validates :name, presence: true, length: { minimum: 4 }
  validates :email, confirmation: true, uniqueness: true
  validates :username, presence: true, uniqueness: true, length: { minimum: 5 }
  validates :bio, presence: true, length: { minimum: 10, maximum: 250 }
  validates :vehicle, inclusion: { in: [ true, false ] }

  has_secure_password

  def total_money
    self.tasks.map {|task| (task.price_rate / 100 * task.minutes / 60)}.inject(:+)
  end

  def average_rating
    ratings = self.tasks.map {|task| task.rating }.compact
    unless ratings.empty?
      (ratings.reduce(:+).to_f / ratings.size).round(2)
    else
      0
    end
  end

end
