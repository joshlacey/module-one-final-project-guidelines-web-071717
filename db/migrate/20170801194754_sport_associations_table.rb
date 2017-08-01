class SportAssociationsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :sport_associations do |t|
      t.integer :sport_id
      t.integer :customer_id
    end
  end
end
