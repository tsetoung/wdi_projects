class Account < ActiveRecord::Base
  has_many :transactions, dependent: :destroy

 def to_s
   return "#{id} #{name}"
 end

end
