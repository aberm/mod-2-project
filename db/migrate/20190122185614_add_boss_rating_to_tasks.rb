class AddBossRatingToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :boss_rating, :integer
  end
end
