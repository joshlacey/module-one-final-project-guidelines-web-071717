require_relative "../config/environment"
require 'open-uri'
require 'faker'

tennis_shoes = "https://store.nike.com/us/en_us/pw/mens-tennis-shoes/7puZoi3Zpd7"

lebron_shoes = "https://store.nike.com/us/en_us/pw/mens-lebron-basketball-shoes/7puZ9a3Z8r1Zoi3"
kobe_basketball_player = "https://store.nike.com/us/en_us/pw/mens-kobe-bryant-basketball-shoes/7puZa9hZ8r1Zoi3"
kyrie_basketball_player = "https://store.nike.com/us/en_us/pw/mens-kyrie-irving-basketball-shoes/7puZmuoZ8r1Zoi3"
durant_basketball_player = "https://store.nike.com/us/en_us/pw/mens-kevin-durant-basketball-shoes/7puZ8scZ8r1Zoi3"
paul_george_basketball_player = "https://store.nike.com/us/en_us/pw/mens-paul-george-basketball-shoes/7puZn69Z8r1Zoi3"
chris_paul_basketball_player = "https://store.nike.com/us/en_us/pw/mens-chris-paul-basketball-shoes/7puZb8uZ8r1Zoi3"
ronaldo_soccer_player = "https://store.nike.com/us/en_us/pw/mens-cristiano-ronaldo-soccer-shoes/7puZa04Z896Zoi3"
neymar_soccer_player = "https://store.nike.com/us/en_us/pw/mens-neymar-soccer-shoes/7puZ9a8Z896Zoi3"


load_db_with_html(url: lebron_shoes, sport: "basketball", player: "lebron james")
load_db_with_html(url: kyrie_basketball_player, sport: "basketball", player: "kyrie irving")
load_db_with_html(url: kobe_basketball_player, sport: "basketball", player: "kobe bryant")
load_db_with_html(url: durant_basketball_player, sport: "basketball", player: "kevin durant")
load_db_with_html(url: paul_george_basketball_player, sport: "basketball", player: "paul george")
load_db_with_html(url: chris_paul_basketball_player, sport: "basketball", player: "chris paul")
load_db_with_html(url: ronaldo_soccer_player, sport: "soccer", player: "cristiano ronaldo")
load_db_with_html(url: neymar_soccer_player, sport: "soccer", player: "neymar")
load_db_with_html(url: tennis_shoes, sport: "tennis")

def create_customers
  30.times do

    username = Faker::Name.unique.name.delete(" ").downcase

    max_price = rand(100..Style.maximum(:price)+75)

    customer = Customer.create(name: username,  highest_price: max_price)

    player_nums = Player.pluck(:id).sample(rand(1..4)).uniq.to_a
    player_nums.each do |num|
      PlayerAssociation.create(customer_id: customer.id, player_id: num)
    end

    sport_nums = Sport.pluck(:id).sample(rand(1..3)).uniq.to_a
    sport_nums.each do |num|
      SportAssociation.create(customer_id: customer.id, sport_id: num)
    end

  end
end

create_customers
