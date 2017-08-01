class PlayerAssociation < ActiveRecord::Base
  belongs_to :player
  belongs_to :customer

end
