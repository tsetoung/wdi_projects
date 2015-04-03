require_relative 'spec_helper'
require_relative '../lib/finance'

describe 'account name' do
  it 'should return an account name' do
    expect(account_name(" ")).to eq("Chase Bank")
  end
end

describe 'transaction' do
  it 'should return a hash with transaction name, amount, and category' do
    expect(transaction(:name, :amount, :category)).to eq({name: "John", amount: 50, category: "deposit"})
  end
end
