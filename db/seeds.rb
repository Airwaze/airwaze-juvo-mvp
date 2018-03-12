<<<<<<< HEAD
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
=======
# Currencies
juvo_currency = Currency.find_or_create_by!(kind: :juvo_token)
days_of_air_time_currency = Currency.find_or_create_by!(kind: :days_of_air_time)

# Users
user_hashes = [
  # Merchant user
  {
    email: 'merchant@airwazetest.com',
    name: 'MERCHANT',
    password: 'merchantpassword',
    image_url: 'none',
    kind: :merchant,
    wallets: [
      Wallet.new(currency: juvo_currency, balance: 9999999),
      Wallet.new(currency: days_of_air_time_currency, balance: 0)
    ]
  },
  # Bank user
  {
    email: 'juvoairtimebank@airwazetest.com',
    name: 'JUVO AIR TIME BANK',
    password: 'juvoairtimebankpassword',
    image_url: 'none',
    kind: :bank,
    wallets: [
      Wallet.new(currency: juvo_currency, balance: 0),
      Wallet.new(currency: days_of_air_time_currency, balance: 9999999)
    ]
  },
  # Other users
  {
    email: 'georgewashington@airwazetest.com',
    name: 'George Washington',
    password: 'georgewashingtonpassword',
    image_url: 'none',
    wallets: [
      Wallet.new(currency: juvo_currency, balance: 100),
      Wallet.new(currency: days_of_air_time_currency, balance: 0)
    ]
  },
  {
    email: 'johnadams@airwazetest.com',
    name: 'John Adams',
    password: 'johnadamspassword',
    image_url: 'none',
    wallets: [
      Wallet.new(currency: juvo_currency, balance: 100),
      Wallet.new(currency: days_of_air_time_currency, balance: 0)
    ]
  },
  {
    email: 'andrewjackson@airwazetest.com',
    name: 'Andrew Jackson',
    password: 'andrewjacksonpassword',
    image_url: 'none',
    wallets: [
      Wallet.new(currency: juvo_currency, balance: 100),
      Wallet.new(currency: days_of_air_time_currency, balance: 0)
    ]
  }
]

user_hashes.each do |user_hash|
  User.create!(user_hash) unless User.find_by_email(user_hash[:email]).present?
end
>>>>>>> airwaze-mvp/master
