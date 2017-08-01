class Sport < ActiveRecord::Base
  has_many :players
  has_many :sport_associations
  has_many :customers, through: :sport_associations

end
