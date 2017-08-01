require 'nokogiri'
require 'pry'
require 'open-uri'
require_relative '../config/environment'

def load_db_with_html(url:, sport: nil, player: nil)

  doc = Nokogiri::HTML(open(url))
  if sport
    new_sport = Sport.find_or_create_by(sport: sport)
  end
  if player
    new_player = Player.find_or_create_by(name: player, sport_id: new_sport.id)
  end
  doc.css("div.grid-item-box").each do |product|
    new_style = Style.new
    new_style.name = product.css("p.product-display-name").text
    new_style.description = product_description = product.css(".product-subtitle").text
    new_style.price = product.css("span.local").text.delete("$").to_i
    new_style.url = product.at("a").map{|link| link}[0].last
    if new_player
      new_style.player_id = new_player.id
    end
    if new_sport
      new_style.sport_id = new_sport.id
    end
    #binding.pry
    new_style.save
  end
end
