class PlayerAssociations < ActiveRecord::Migration[5.0]
  def change
    create_table :player_associations do |t|
      t.integer :player_id
      t.integer :user_id
    end
  end
end
