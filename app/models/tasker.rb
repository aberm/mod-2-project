class Tasker < ApplicationRecord
  has_many :tasks
  has_many :bosses, through: :tasks
end
