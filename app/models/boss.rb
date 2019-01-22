class Boss < ApplicationRecord
  has_many :tasks
  has_many :taskers, through: :tasks
end
