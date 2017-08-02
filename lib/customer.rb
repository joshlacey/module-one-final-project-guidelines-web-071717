class Customer < ActiveRecord::Base
  has_many :player_associations
  has_many :players, through: :player_associations
  has_many :sport_associations
  has_many :sports, through: :sport_associations

  def self.favorite_player
    play_assoc = PlayerAssociation.group("player_id").order("count(*) DESC").limit(1)
    Player.find_by(id: play_assoc[0].player_id).player
  end

  def self.favorite_sport
    sport_assoc = SportAssociation.group("sport_id").order("count(*) DESC").limit(1)
    Sport.find_by(id: sport_assoc[0].sport_id).sport
  end

  def cart
    Style.all.select do |shoe|
       ( (self.lowest_price <= shoe.price && shoe.price <= self.highest_price) && (self.sports.include?(shoe.sport)) ) || self.players.map{|player| player.id}.include?(shoe.player_id)
     end.map{|shoe| shoe.url }

  end

end

# Style.where("(price <= ? AND price >= ?) OR player_id = ?", bob.highest_price, bob.lowest_price).
# count
