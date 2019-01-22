class Boss < ApplicationRecord
  has_many :tasks
  has_many :taskers, through: :tasks
  validates :name, presence: true
  validates :email, confirmation: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :city, presence: true, allow_blank: false
end
