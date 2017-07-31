class PlayersTable < ActiveRecord::Migration[5.0]
  def change
  	create_table :players do |t|
  		t.string :name
  		t.integer :sport_id
  		t.string  :team_name
  	end
  end
end
