class SportAssociation < ActiveRecord::Base
  belongs_to :customer
  belongs_to :sport

  
end
