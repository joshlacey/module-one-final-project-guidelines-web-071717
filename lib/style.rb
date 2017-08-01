class Style < ActiveRecord::Base

  # def self.load_db_with_html
  #
  #   doc = Nokogiri::HTML(open("https://store.nike.com/us/en_us/pw/mens-tennis-shoes/7puZoi3Zpd7"))
  #
  #   doc.css("div.grid-item-box").each do |product|
  #     new_style = self.new
  #     new_style.name = product.css(".product-diplay-name").text
  #     new_style.description = product_description = product.css(".product-subtitle").text
  #     new_style.price = product.css("span.local").text.delete("$").to_i
  #     binding.pry
  #     new_style.save
  #   end
  # end


end

# Style.load_db_with_html
