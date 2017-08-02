require 'faker'

class Cli
  attr_accessor :new_customer

  # def initialize
  #   @new_customer = Customer.find_by(name: "har j")
  # end

  def greeting
    puts "Welcome to Nike please, create your account."
  end

  def login_or_create_account
      puts "Hi welcome to Nike! Have you used our service before? Please type 'yes' or 'no'"
      # binding.pry
      response = gets.chomp.downcase
      if response == "yes"
        puts "Please type in your username"
        username = gets.chomp
        checking_customer = Customer.find_by(name: username)
              if checking_customer
                @new_customer = checking_customer
                #move on to next method
              else
                puts "User does not exist. Try again? 'y' 'n'"
                response = gets.chomp.downcase
                if response == "n"
                create_username
                else
                login_or_create_account
                end
              end
      elsif response == "no"
        create_username
      else
        puts "Invalid input, please try again."
        login_or_create_account
      end
    end

    def create_username #was git name
      puts "Please create your username"
      username = gets.chomp.downcase
      tester = Customer.find_by(name: username)
      if tester
        puts "Sorry that username is taken"
        create_username
      else
        @new_customer = Customer.create(name: username)
      end
    end

  # def get_name
  #   puts "What is your first and last name?"
  #   first_last_name = gets.chomp
  #   @new_customer = Customer.new
  #   @new_customer.name = first_last_name
  # end  ##what if customer already has an account? maybe create a login option?

  def get_sport
    puts  "Here is a list of sports we cater to. Choose what sports interest you or type 'quit' to exit."
    Sport.all.each {|sports| puts sports.sport}
    sport = gets.chomp.downcase
    if sport == "quit"
      puts "Great"
     else
      found_sport =  Sport.find_by(sport: sport)
      if found_sport
        SportAssociation.create(customer_id:@new_customer.id, sport_id: found_sport.id)
        get_sport
      else
        puts "Please pick a sport from the list"
        get_sport
      end
    end

    # @new_customer.sport_id = Sport.find_by(sport: sport).id
end #what sports are you interested in?

  def fav_player #if sport matches player sport_id display players
    puts "Here are a list of athletes for the sport(s) you've chosen."
    # binding.pry
    arr = @new_customer.sports.map {|sportt| sportt.id}
    arr.each do |id|
      Player.where("sport_id = #{id}").each_with_index {|player,idx| puts "#{player.sport.sport}: #{idx+1}.#{player.name}"}
    end
    puts "Please pick a player from the list by typing in the name."
    input = gets.chomp.downcase
    found_player = Player.find_by(name: input)
    if found_player
      PlayerAssociation.create(customer_id:@new_customer.id, player_id: found_player.id)
    else
      puts "Please pick a player from the list by typing in the name"
      fav_player
    end
  end

     #We have some shoes by some basketball players
    #lists players numbered based on the sports that they choose. asks user to type number corresponding to the player
    #saves player_id to user's favorite players. Customer has many players

  # def get_size
  #   puts "What's your shoe size?"
  #   @new_customer.size = gets.chomp
  # end

  def get_pricerange
    puts "What is the most you are willing to spend?"
    @new_customer.highest_price = gets.chomp
    puts "What is the least amount you are willing to spend?"
    @new_customer.lowest_price = gets.chomp
    @new_customer.save
  end

  def here_suggestions
    puts "Here are some suggestions!"
    if @new_customer.cart == []
      puts "Sorry there are no suggestions based on your criteria."
    else
      puts @new_customer.cart
    end
    loop do
    puts "Do you want to look at shoes from another player? 'yes' or 'no'"
    response = gets.chomp
    if response == "yes"
      fav_player
    elsif response == "no"
      puts "Thanks for visiting us at Nike.com"
      break
    else
      puts "Invalid response"
  end
end
end

  ##asdf


#test#










end
