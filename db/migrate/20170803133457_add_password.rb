class AddPassword < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :password, :string
    remove_column :customers, :color
    remove_column :customers, :sport_id
    remove_column :customers, :player_id
    remove_column :customers, :size
    remove_column :customers, :lowest_price
    remove_column :players, :team_name
    drop_table :stock
    
  end
end
