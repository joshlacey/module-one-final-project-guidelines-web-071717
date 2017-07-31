class AddPlayerColumn < ActiveRecord::Migration[5.0]
  def change
  	add_column :customers, :player, :string
  end
end
