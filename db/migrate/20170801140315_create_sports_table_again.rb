class CreateSportsTableAgain < ActiveRecord::Migration[5.0]
  def change
  	create_table :sports do |t|
  		t.string :sport
  	end
  end
end
