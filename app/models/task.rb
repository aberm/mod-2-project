class Task < ApplicationRecord
  belongs_to :boss
  belongs_to :tasker
end
