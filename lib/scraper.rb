require 'nokogiri'
require 'pry'
require 'open-uri'

basketball_html = "../fixtures/nike_basketball.html"
running_html = "../fixtures/nike_running.html"
soccer_html = "../fixtures/nike_soccer.html"
tennis_html = "../fixtures/nike_tennis.html"

def load_db_with_html
  basketball_html = "nike_basketball.html"
  running_html = "../fixtures/nike_running.html"
  soccer_html = "../fixtures/nike_soccer.html"
  tennis_html = "../fixtures/nike_tennis.html"
  doc = Nokogiri::HTML(open("https://store.nike.com/us/en_us/pw/mens-tennis-shoes/7puZoi3Zpd7"))


  doc.css("div.grid-item-box").each do |product|
    binding.pry

    product_name = product.css(".product-diplay-name").text
    product_description = product.css(".product-subtitle").text
    product_price = product.css("span.local").text

  end
end

load_db_with_html
