require 'active_record'
require_relative 'connection'
require_relative '../lib/fridge'
require_relative '../lib/food'
require_relative '../lib/drink'

account = Account.create([
  {name: "JP Morgan Chase", balance: 1000000}

  ])

transaction = Transaction.find_by(name: "JP Morgan Chase").transaction.create([
    {payee: "James Brown", amount: -5, date: , category: grocery},

    ])
