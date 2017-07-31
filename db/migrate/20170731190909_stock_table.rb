class StockTable < ActiveRecord::Migration[5.0]
  def change
  	create_table :stock do |t|
  		t.integer :shoe_id
  		t.integer :size
  		t.integer :quantity
  		t.string  :color
  	end
  end
end
