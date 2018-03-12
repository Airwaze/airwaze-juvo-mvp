class OrderTransaction < ApplicationRecord
  belongs_to :issuer_wallet, class_name: 'Wallet'
  belongs_to :receiver_wallet, class_name: 'Wallet'
<<<<<<< HEAD

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validate :receiver_wallet_must_be_different_from_issuer_wallet
  validate :issuer_wallet_must_have_enough_balance
=======
  belongs_to :currency

  validates :amount, numericality: { greater_than: 0 }
  validate :receiver_wallet_must_be_different_from_issuer_wallet
  validate :issuer_wallet_must_have_enough_balance
  validate :currency_must_be_the_same_for_wallets

  scope :sent_or_received, -> (user) {
    where('issuer_wallet_id IN (?) OR receiver_wallet_id IN (?)', user.wallet_ids, user.wallet_ids)
  }
>>>>>>> airwaze-mvp/master

  private

  def issuer_wallet_must_have_enough_balance
<<<<<<< HEAD
    if issuer_wallet.juvo_token_balance < amount
=======
    return unless issuer_wallet && amount

    if issuer_wallet.balance < amount
>>>>>>> airwaze-mvp/master
      errors.add(:issuer_wallet, 'must have enough balance')
    end
  end

  def receiver_wallet_must_be_different_from_issuer_wallet
    if issuer_wallet == receiver_wallet
      errors.add(:receiver_wallet, 'must be different from Issuer wallet')
    end
  end
<<<<<<< HEAD
=======

  def currency_must_be_the_same_for_wallets
    return unless issuer_wallet && receiver_wallet

    if currency != issuer_wallet.currency || currency != receiver_wallet.currency
      errors.add(:currency, 'must be the same for wallets')
    end
  end
>>>>>>> airwaze-mvp/master
end
