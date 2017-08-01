class Customer < ActiveRecord::Base
  has_many :player_associations
  has_many :players, through: :player_associations
  has_many :sport_associations
  has_many :sports, through: :sport_associations

  def self.favorite_player
    # Player.all.select do |player|
    #   player.customers !=[]
    # end.map{|player| puts player.name puts player.customers.count}
  end

  def self.favorite_sport
  end

  def cart
    Style.all.select do |shoe|
       ( (self.lowest_price <= shoe.price && shoe.price <= self.highest_price) && (self.sports.include?(shoe.sport)) ) || self.players.map{|player| player.id}.include?(shoe.player_id)
     end.map{|shoe| shoe.url }
  end
end
