class ChangeTasksDefaults < ActiveRecord::Migration[5.2]
  def up
   change_column :tasks, :completed, :boolean, default: false
   change_column :tasks, :vehicle, :boolean, default: false
  end

  def down
   change_column :tasks, :completed, :boolean, default: nil
   change_column :tasks, :vehicle, :boolean, default: nil
  end
end
