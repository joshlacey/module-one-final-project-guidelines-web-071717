class AdminCli

  def run
    puts "Here are some options for viewing customer responses:"
    puts "1- Most popular Player"
    puts "2- Most popular Sport"
    puts "3- Customer's Max budget"
    puts "What would you like to do? (type a corresponding number to select from above options or type exit to quit)"
    response = gets.chomp
    case response
    when "1"
        puts "\n"
        puts Customer.favorite_player.capitalize
        puts "\n"
        run
      when "2"
        puts "\n"
        puts Customer.favorite_sport.capitalize
        puts "\n"
        run
      when "3"
        puts "\n"
        puts "coming soon"
        puts "\n"
        run
      when "exit"
        puts "\n"
        puts "Goodbye"
        puts "\n"
        return "Goodbye"
      else
        puts "\n"
        puts "invalid input"
        puts "\n"
        run
    end
  end

end
