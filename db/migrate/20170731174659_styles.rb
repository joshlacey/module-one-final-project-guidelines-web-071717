class Styles < ActiveRecord::Migration[5.0]
  def change
    create_table :styles do |t|
      t.string :description
      t.integer :price
      t.integer :player_id
      t.integer :sport_id
    end
  end
end


# sport_id, player_id, description, price,
