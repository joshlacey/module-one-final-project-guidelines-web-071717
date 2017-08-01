class UpdateColumnCustomers < ActiveRecord::Migration[5.0]
  def change
  	rename_column :customers, :player, :player_id
  end
end
