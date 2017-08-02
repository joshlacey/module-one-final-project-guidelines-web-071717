class Customer < ActiveRecord::Base
  has_many :player_associations
  has_many :players, through: :player_associations
  has_many :sport_associations
  has_many :sports, through: :sport_associations

  def self.favorite_player
    play_assoc = PlayerAssociation.group("player_id").order("count(*) DESC").limit(1)
    Player.find_by(id: play_assoc[0].player_id).name
  end

  def self.favorite_sport
    sport_assoc = SportAssociation.group("sport_id").order("count(*) DESC").limit(1)
    Sport.find_by(id: sport_assoc[0].sport_id).sport
  end

def self.max_budget
  puts Customer.average(:highest_price).to_s
end


  def cart
    Style.all.select do |shoe|
       ( (self.lowest_price <= shoe.price && shoe.price <= self.highest_price) && (self.sports.include?(shoe.sport)) ) || self.players.map{|player| player.id}.include?(shoe.player_id)
     end.map{|shoe| shoe.url }

  end

<<<<<<< HEAD

def account_overview

  puts "username:#{self.name}"
  puts "\n"
  puts "Favorite Players:"
  self.players.each {|player|puts player.name}
  puts "\n"
  puts "Favorite Sports:"
  arr = self.sports.map {|sport| sport.sport}.uniq
  arr.each {|el| puts el }
=======
  def account_overview
    puts "username:#{self.name}"
    puts "\n"
    puts "Favorite Players:"
    self.players.each {|player|puts player.name}
    puts "\n"
    puts "Favorite Sports:"
    self.sports.each {|sport|puts sport.sport}
    puts "\n"
    puts "Suggested Styles:"
    puts self.cart.sample(7)
  end
>>>>>>> dc595802ab36fca2ac08c460906ba24898f70bfe

end

# Style.where("(price <= ? AND price >= ?) OR player_id = ?", bob.highest_price, bob.lowest_price).
# count
end
