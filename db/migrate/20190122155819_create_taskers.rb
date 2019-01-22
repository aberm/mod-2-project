class CreateTaskers < ActiveRecord::Migration[5.2]
  def change
    create_table :taskers do |t|
      t.string :name
      t.string :email
      t.string :username
      t.string :city
      t.text :bio
      t.boolean :vehicle, default: false

      t.timestamps
    end
  end
end
