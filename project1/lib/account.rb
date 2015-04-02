class Account < ActiveRecord::Base
  has_many :transactions, dependent: :destroy

 def to_s
   return "#{id} #{name}"
 end

 # def debit(amount)
 #   account_name.balance -= amount
 # end
 #
 # def credit(amount)
 #   account_name.balance += amount
 # end
 #
 # def balance
 #   if initial_balance == 0
 #   balance = credit + debit
 #   return balance
 # end
end
