require_relative '../config/environment'

new_cli = Cli.new

# new_cli.greeting

# new_cli.get_name
new_cli.login_or_create_account

new_cli.get_sport

new_cli.fav_player

# new_cli.get_size

new_cli.get_pricerange
new_cli.here_suggestions


# def run_main
#   new_cli = Cli.new
#
#   if new_cli.login_or_create_account == 'returning customer'
#     run_existing_user
#   elsif new_cli.login_or_create_account == "new_customer"
#     run_new_user
#
# end
#
# def run_new_user
# end
#
# def run_existing_user
# end
#
# run_main
