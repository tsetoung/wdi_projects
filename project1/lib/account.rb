class Account < ActiveRecord::Base
  has_many :transactions, dependent: :destroy
  validates :name, presence: true

 def to_s
   return "#{id} #{name}"
 end

 # this is the balance method that we wrote in our one-on-one.
 def balance
   # we can call `transactions` in the lines below, because an acct has_many
   # transactions, and this method is called on specific (instances) of 'Acconut'
   # doing so will return just the transactions associated with the account
   # that we're calling 'balance' on.
   deposit_sum = transactions.where(category: "deposit").sum(:amount)
   withdrawal_sum = transactions.where(category: "withdraw").sum(:amount)
   return depost_sum - withdrawal_sum
 end
end
