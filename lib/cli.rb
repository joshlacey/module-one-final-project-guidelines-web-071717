class Cli
  attr_accessor :new_customer

  def greeting
    puts "Welcome to Nike please, create your account."
    #binding.pry
  end

  def get_name
    puts "What is your first and last name?"
    first_last_name = gets.chomp
    @new_customer = Customer.new
    # binding.pry
    @new_customer.name = first_last_name

  end

  def get_sport
    puts "What sport are you looking for?"
    @new_customer.sport = gets.chomp.downcase
  end

  def fav_player
    puts "Who's you favorite player?"
     player = gets.chomp.downcase
     @new_customer.player_id = Player.find_by(name: player).id
  end

  def get_size
    puts "What's your shoe size?"
    @new_customer.size = gets.chomp
  end

  def get_pricerange
    puts "What is the most you are willing to spend?"
    @new_customer.highest_price = gets.chomp
    puts "What is the least amount you are willing to spend?"
    @new_customer.lowest_price = gets.chomp
    @new_customer.save
  end

  def here_suggestions
    puts "Here are some suggestions!"
    Style.select do |shoe|
      @new_customer.lowest_price <= shoe.price <= @new_customer.highest_price && shoe.sport_id == @new_customer.sport_id || shoe.player_id == @new_customer.player_id
    end.map{|shoe| shoe.url }
  end













end