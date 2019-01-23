class ChangeLocationToCity < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :location, :city
  end
end
