class ReformatSchemaAgain < ActiveRecord::Migration[5.0]
  def change
    rename_column :customers, :sport, :sport_id
    rename_column :styles, :sport, :sport_id
    change_column :customers, :sport_id, :integer
    change_column :styles, :sport_id, :integer
  end
end
