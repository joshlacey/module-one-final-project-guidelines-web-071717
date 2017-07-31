class ChangeColumnAgain < ActiveRecord::Migration[5.0]
  def change
  	change_column :customers, :player_id, :integer
  end
end
