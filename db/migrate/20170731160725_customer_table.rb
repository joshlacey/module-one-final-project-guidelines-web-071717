class CustomerTable < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :sport
      t.string :size
      t.integer :lowest_price
      t.integer :highest_price
      t.string  :color #"1,2,3,4"
  end
end
