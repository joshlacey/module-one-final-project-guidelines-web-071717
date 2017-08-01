class DeleteSportTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :sports
    rename_column :styles, :sport_id, :sport
    change_column :styles, :sport, :string
  end
end
