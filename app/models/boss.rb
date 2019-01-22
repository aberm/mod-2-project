class Boss < ApplicationRecord
  has_many :tasks
  has_many :taskers, through: :tasks

  validates :name, presence: true, length: { minimum: 5}
  validates :email, confirmation: true, uniqueness: true, length: { minimum: 5}
  validates :username, presence: true, uniqueness: true, length: { minimum: 5}
  validates :city, presence: true


  def average_rating
    ratings = self.tasks.map {|task| task.boss_rating }
    ratings.reduce(:+).to_f / ratings.size
  end
end
