class Cli

  def greeting
    puts "Welcome to Nike please, create your account."
    binding.pry
  end

  def get_name
    puts "What is your first and last name?"
    first_last_name = gets.chomp
    new_customer = Customer.create
    new_customer.update(name: first_last_name)
  end

  def get_sport

  end

  def get_size
  end

  def get_pricerange
    
  end





end
