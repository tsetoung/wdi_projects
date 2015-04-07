class Transaction < ActiveRecord::Base
  belongs_to :account
  validates :name,    presence: true
  validates :amount,  presence: true
  # good validations and use of `to_s` !
  def to_s
    return "id: #{id} {name: #{name}, amount: #{amount}, category: #{category}}"
  end

end
