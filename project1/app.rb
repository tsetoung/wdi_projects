require 'active_record'
require 'pry'
require 'pg'

require_relative 'db/connection'
require_relative 'lib/account'
require_relative 'lib/transaction'

# binding.pry

def border
  puts "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
end

# this method isn't clearly named... I think `get_account` or `prompt_for_account`
# would be better
def account
  puts "What account do you want, enter the associated number?"
  puts Account.all
  id = gets.chomp
  return Account.find_by(id: id)
end

# same as above, I think this makes more sense as `get_transaction` or
# `prompt_for_transaction`
def selected_transaction(account)
  puts "Which transaction?"
  puts account.transactions

  # this variable seems to be mis-named. You're using it below to find a transaction
  # by id, so I think it should be called transaction_id
  account_id = gets.chomp
  return account.transactions.find_by(id: account_id)
end

# again with naming, what does this method do? I think `get_transaction_input`
# might be better
def money_input
  money_attr = {}
  puts "What is the name?"
  money_attr[:name] = gets.chomp
  puts "What is the amount?"
  money_attr[:amount] = gets.chomp
  puts "What is the category? (deposit or withdraw)"
  money_attr[:category] = gets.chomp
  return money_attr
end

# this method (and the next one after) are confusingly named, as they don't
# 'show' credits and debits, they return credits and debits. It's later on
# in the menu code where you 'show' them by puts-ing.
def show_credit
  Transaction.where(category: "deposit")
end

def show_debit
  Transaction.where(category: "withdraw")
end

def show_balance
  balance = sum_deposits - sum_withdraws
  return balance
end

def sum_deposits
  Transaction.where(category: "deposit").sum(:amount)
end

def sum_withdraws
  Transaction.where(category: "withdraw").sum(:amount)
end

# this is the method we refactored in our one-on-one
def get_balance
  id = gets.chomp
  account = Account.find(id)
  account.balance
end

def clear
  system("clear")
end

def menu
  puts border
  puts "Choose an option:
  1. See all Transactions from a Specific Account
  2. Edit an exisiting Transaction
  3. Delete an exisiting Transaction
  4. Add a Transaction
  5. See Current Balance
  6. See all Transactions by Category
  7. See Balance of a Single Account
  8. Quit"
  puts border
  return gets.chomp
end

# good job keeping the menu code relatively clean!
loop do

# these two lines should be indented in 1 level, as they are inside the loop do...end
choice = menu 
case choice

  when "1"
    clear
    puts account.transactions
  when "2"
    clear
    updated_transaction = selected_transaction(account)
    puts "Update Amount"
    new_amount = gets.chomp
    puts "Update Category"
    new_category = gets.chomp
    updated_transaction.update(amount: new_amount, category: new_category)
    updated_transaction.save
    puts account.transactions
  when "3"
    clear
    trans = selected_transaction(account)
    trans.destroy
    puts account.transactions
  when "4"
    clear
    acct = account
    acct.transactions.create(money_input)
    acct.save
    puts account.transactions
  when "5"
    clear
    puts "Total Balance from all Accounts:"
    puts show_balance
  when "6"
    clear
    puts "All withdraws:"
    puts show_debit
    puts "All deposits:"
    puts show_credit
  when "7"
    clear
    puts "Choose an account:"
    puts Account.all
    puts "Balance of Transactions:"
    puts balance
  when "8"
    clear
    puts "Thank you for visiting.  Come back soon."
  break
  end
end
