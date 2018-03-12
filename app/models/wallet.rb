class Wallet < ApplicationRecord
<<<<<<< HEAD
  validates :name, :kind, :juvo_token_balance, :air_time_token_balance, presence: true
  validates :juvo_token_balance, :air_time_token_balance, numericality: { greater_than_or_equal_to: 0 }

  enum kind: {
    user_wallet: 0,
    merchant_wallet: 1
  }
=======
  belongs_to :user
  belongs_to :currency

  validates :balance, numericality: { greater_than_or_equal_to: 0 }

  scope :except_user, -> (user) {
    joins(:user).where.not(users: {id: user})
  }

  scope :for_currency, -> (currency) { where(currency_id: currency) }
>>>>>>> airwaze-mvp/master
end
