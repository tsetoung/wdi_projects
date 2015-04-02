require 'active_record'
require 'pry'
require 'pg'

require_relative 'db/connection'
require_relative 'lib/account'
require_relative 'lib/transaction'

# binding.pry
# puts "Current Total Balance is:"
# puts Transaction.sum(:amount)


def selected_account
  puts "What account do you want, enter the associated number?"
  puts Account.all
  id = gets.chomp
  return your_account = Account.find_by(id: id)
end

def new_transaction
  transaction_attr = {}
  puts "What is the name?"
  transaction_attr[:name] = gets.chomp
  puts "How much is the amount?"
  transaction_attr[:amount] = gets.chomp
  puts "What category? (deposit or withdraw)"
  transaction_attr[:category] = gets.chomp
  return transaction_attr
end

def menu
  puts "Choose an option:
  1. See all Transactions by Account
  2. Edit an exisiting Transaction
  3. Delect an exisiting Transaction
  4. See Current Balance
  5. See all Transactions by Category
  6. See Ballance of all Transactions
  7. Quit"
  return gets.chomp
end

choice = menu
case choice

  when "1"
    puts selected_account.transactions
  when "2"
    from_account = selected_account
    new_action = Transaction.create(new_transaction)
    new_action.transactions = from_account
    new_action.save

end



# def choose_account
#   puts "Which Account do you want to see?"
#   puts Account.all
#   name_input = gets.chomp
#   return Account.find_by(name: name_input)
# end
#
# def acct_name
#   return choose_name
# end
#
#
#
#

#
#
#
#
# # chase_bank = Account.find_by(name: "Chase Bank")
# # chase_bank.tranasations.all
#
# when "2"
#   account = choose_account
#   puts account.transactions
# when "3"
#
# when "4"
#   my_acct = choose_account
#   drink = get_drink(my_acct)
#   puts "What is the new size?"
#   new_size = gets.chomp
#   drink.size = new_size
#   drink.save
# end
