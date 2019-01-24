class AddPasswordDigestToBossesAndTaskers < ActiveRecord::Migration[5.2]
  def change
    add_column :bosses, :password_digest, :string
    add_column :taskers, :password_digest, :string
  end
end
