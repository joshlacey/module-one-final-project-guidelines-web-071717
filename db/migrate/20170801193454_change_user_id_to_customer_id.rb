class ChangeUserIdToCustomerId < ActiveRecord::Migration[5.0]
  def change
    rename_column :player_associations, :user_id, :customer_id
  end
end
