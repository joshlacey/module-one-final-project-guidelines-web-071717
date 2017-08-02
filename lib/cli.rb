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
      response = gets.chomp.downcase
      if response == "yes"
        puts "Please type in your username"
        username = gets.chomp
        checking_customer = Customer.find_by(name: username)
              if checking_customer
                @new_customer = checking_customer
                return "returning_customer"
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
        return "new_customer"
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
    @new_customer.save
  end

  def here_suggestions
    puts "Here are some suggestions!"
    if @new_customer.cart == []
      puts "Sorry there are no suggestions based on your criteria."
    else
<<<<<<< HEAD
      puts @new_customer.cart.sample(5)
=======
      puts @new_customer.cart.sample(7)
>>>>>>> dc595802ab36fca2ac08c460906ba24898f70bfe
    end
  end

  def what_next
    puts "What would you like to do now?"
    puts "1 - Account overview."
    puts "2 - Change sports or players"
    puts "3 - Delete your account"
    puts "4 - exit"
    response = gets.chomp
    case response
    when "1"
      puts "\n"
      puts @new_customer.account_overview
      puts "\n"
      what_next
    when "2"
      puts "\n"
      change_sport_player
      puts "\n"
      what_next
    when "3"
      puts "\n"
      puts delete_account
      puts "\n"
    when "4"
      puts "\n"
      puts "Goodbye"
      return nil
    else
      puts "Invalid Input"
      what_next
    end
  end

<<<<<<< HEAD
# def account_overview
#
#   puts "username:#{@new_customer.name}"
#   puts "\n"
#   puts "Favorite Players:"
#   @new_customer.players.each {|player|puts player.name}
#   puts "\n"
#   puts "Favorite Sports:"
#   arr = @new_customer.sports.map {|sport| sport.sport}.uniq
#   arr.each {|el| puts el }
#
# end

  ##asdf
=======
def delete_account
  puts "Are you sure you want to delete your account? (y/n)"
  response = gets.chomp
  if response.downcase == "y"
    @new_customer.delete
    puts "Account Deleted :'( "
    return nil
  elsif response.downcase == "n"
    what_next
  else
    puts "invalid input"
    delete_acount
  end
end
>>>>>>> dc595802ab36fca2ac08c460906ba24898f70bfe


  def change_sport_player
    puts "1 - Change Player ?"
    puts "2 - Change Sport ?"
    puts "3 - Return to main menu"
    response = gets.chomp
    case response
    when "1"
      puts @new_customer.players.map{|player| player.name}
      puts "Please type the name of the player you would like to remove from your list"
      player = gets.chomp
      found_player = Player.find_by(name: player)
      if found_player && @new_customer.players.include?(found_player)
        @new_customer.player_associations.destroy(PlayerAssociation.find_by(customer_id: @new_customer.id, player_id: found_player.id))
        puts "#{found_player.name} was deleted"
        puts @new_customer.player_associations
        change_sport_player
      else
        puts "Invalid input."
        change_sport_player
      end
    when "2"
      puts @new_customer.sports.map{|sport| sport.sport}
      puts "Please type the name of the sport you would like to remove from your list"
      sport = gets.chomp
      found_sport = Sport.find_by(sport: sport)
      if found_sport && @new_customer.sports.include?(found_sport)
        SportAssociation.find_by(customer_id: @new_customer.id, sport_id: found_sport.id).delete
        puts "#{found_sport.sport} was deleted"
        change_sport_player
      else
        puts "Invalid input."
        change_sport_player
      end
    when "3"
      what_next
    else
      puts "Invalid input."
      change_sport_player
    end
  end


  def run
    if self.login_or_create_account == "new_customer"

      self.get_sport

      self.fav_player

      self.get_pricerange

      self.here_suggestions

      self.what_next

    else

      self.what_next

    end
  end

end
