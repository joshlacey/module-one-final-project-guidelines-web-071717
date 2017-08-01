class Player < ActiveRecord::Base
  has_many :player_associations
  has_many :customers, through: :player_associations
  belongs_to :sport

  

end
