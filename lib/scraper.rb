require 'nokogiri'
require 'pry'
require 'open-uri'
require_relative '../config/environment'

basketball_html = "../fixtures/nike_basketball.html"
running_html = "../fixtures/nike_running.html"
soccer_html = "../fixtures/nike_soccer.html"
tennis_html = "../fixtures/nike_tennis.html"

tennis_shoes = "https://store.nike.com/us/en_us/pw/mens-tennis-shoes/7puZoi3Zpd7"

def load_db_with_html

  doc = Nokogiri::HTML(open("https://store.nike.com/us/en_us/pw/mens-tennis-shoes/7puZoi3Zpd7"))

  doc.css("div.grid-item-box").each do |product|
    new_style = Style.new
    new_style.name = product.css("p.product-display-name").text
    new_style.description = product_description = product.css(".product-subtitle").text
    new_style.price = product.css("span.local").text.delete("$").to_i
    new_style.url = product.at("a").map{|link| link}[0].last
    new_style.save
  end
end

load_db_with_html
