class Customer < ActiveRecord::Base
  has_many :styles
  has_many :players
  has_many :colors



end
