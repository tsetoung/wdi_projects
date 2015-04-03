class Transaction < ActiveRecord::Base
  belongs_to :account
  validates_format_of :name,  
  def to_s
    return "id: #{id} {name: #{name}, amount: #{amount}, category: #{category}}"
  end

end
