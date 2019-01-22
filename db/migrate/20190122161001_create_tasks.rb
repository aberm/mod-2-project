class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :location
      t.text :description
      t.string :category
      t.integer :boss_id
      t.integer :tasker_id
      t.boolean :vehicle
      t.integer :rating
      t.text :review
      t.integer :minutes
      t.integer :price_rate
      t.boolean :completed

      t.timestamps
    end
  end
end
