require 'active_record'
require 'pry'

require_relative 'connection'
require_relative '../lib/account'
require_relative '../lib/transaction'

Account.destroy_all
Transaction.destroy_all

accounts = Account.create([
  {name: "Chase Bank", category: "savings"},
  {name: "Bank of America", category: "Roth IRA"},
  {name: "TD Bank", category: "checking"}
  ])

transactions = Account.find_by(name:"Chase Bank").transactions.create([
    {name: "James Brown",amount: 500, category: "deposit"},
    {name: "Jack Rummy",amount: 200, category: "deposit"}
    ])

transactions = Account.find_by(name:"Bank of America").transactions.create([
    {name: "John Hancock",amount: 200, category: "deposit"},
    {name: "Ruth Babe",amount: 200, category: "deposit"}
    ])

transactions = Account.find_by(name:"TD Bank").transactions.create([
    {name: "Department of State",amount: 3000, category: "deposit"},
    {name: "Diana Ross",amount: 200, category: "withdraw"},
    {name: "Arbys",amount: 100, category: "withdraw"},
    {name: "McDonalds",amount: 50, category: "withdraw"},
    {name: "Barnes and Noble",amount: 75, category: "withdraw"}
    ])


binding.pry
