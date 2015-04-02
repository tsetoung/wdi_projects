class Transaction < ActiveRecord::Base
  belongs_to :account

  def to_s
    return "{name: #{name}, amount: #{amount}, category: #{category}}"
  end

end
