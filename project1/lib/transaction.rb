class Transaction < ActiveRecord::Base
  belongs_to :account
  validates :name,    presence: true
  validates :amount,  presence: true
  def to_s
    return "id: #{id} {name: #{name}, amount: #{amount}, category: #{category}}"
  end

end
