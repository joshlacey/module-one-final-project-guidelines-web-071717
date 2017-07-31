class ChangeStylesTable < ActiveRecord::Migration[5.0]
  def change
  	add_column :styles, :url, :string
  	add_column :styles, :name, :string
  end
end
