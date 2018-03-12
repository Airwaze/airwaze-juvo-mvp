class OrderTransactionsController < ApplicationController
<<<<<<< HEAD
  def create
    order_transaction_params = params
      .require(:order_transaction)
      .permit(:issuer_wallet_id, :receiver_wallet_id, :amount)

    resource = OrderTransaction.new(order_transaction_params)
    resource.validate!

    ApplicationRecord.transaction do
      amount = resource.amount.to_i

      case resource.receiver_wallet.kind.to_sym
      when :user_wallet
        resource.issuer_wallet.juvo_token_balance -= amount
        resource.receiver_wallet.juvo_token_balance += amount

        flash[:notice] = success_message =
          "Success! Issued #{amount} Juvo Tokens \
          to #{resource.receiver_wallet.name}"
      when :merchant_wallet
        resource.issuer_wallet.juvo_token_balance -= amount
        resource.issuer_wallet.air_time_token_balance += amount
        resource.receiver_wallet.juvo_token_balance += amount

        flash[:notice] = success_message =
          "Success! Received #{amount} Air Time Tokens \
          in exchange of #{amount} Juvo Tokens"
      end

      resource.issuer_wallet.save!
      resource.receiver_wallet.save!
    end
  rescue => e
    flash[:error] = e.message
  ensure
    redirect_to resource.issuer_wallet
=======
  view_accessor :resource, :resources
  view_accessor :wallets, :amounts

  before_action :authenticate_user!

  def index
    self.resources = OrderTransaction.sent_or_received(current_user).order(created_at: :desc)
  end

  def new
    only_for_users! :merchant, :regular

    self.resource = OrderTransaction.new
    self.amounts = (0..1000).step(100)
    self.wallets = Wallet.except_user(current_user)
      .except_user(User.bank.first)
      .where(currency_id: current_user.main_sender_wallet.currency)
  end

  def redeem
    only_for_users! :regular

    self.resource = OrderTransaction.new(receiver_wallet: User.bank.first.wallets.for_currency(Currency.juvo_token.first).first)
    self.amounts = (0..1000).step(100)
  end

  def create
    only_for_users! :merchant, :regular

    order_transaction_params = params
      .require(:order_transaction)
      .permit(:receiver_wallet_id, :amount)
      .merge(issuer_wallet: current_user.main_sender_wallet)

    ApplicationRecord.transaction do
      case Wallet.find_by_id!(order_transaction_params[:receiver_wallet_id]).user.kind.to_sym
      when :regular, :merchant
        resource = process_order_transaction!(order_transaction_params)
        flash[:notice] =
          "Success! Issued #{resource.amount} #{resource.currency.name_plural.titleize} \
          to #{resource.receiver_wallet.user.name}"
      when :bank
        juvo_resource = process_order_transaction!(order_transaction_params)

        issuer_wallet = User.bank.first.main_sender_wallet
        days_of_air_time_resource = process_order_transaction!(
          issuer_wallet: issuer_wallet,
          receiver_wallet: current_user.wallets.for_currency(issuer_wallet.currency).first,
          amount: juvo_resource.amount
        )

        flash[:notice] =
          "Success! Received #{days_of_air_time_resource.amount} #{days_of_air_time_resource.currency.name_plural.titleize} \
          in exchange of #{juvo_resource.amount} #{juvo_resource.currency.name_plural.titleize}"
      end
    end

    redirect_to root_path
  rescue => e
    flash[:alert] = e.message
    redirect_back fallback_location: resource
  end

  private

  def process_order_transaction!(params)
    order_transaction = OrderTransaction.new(params.merge(currency: params[:issuer_wallet].currency))
    order_transaction.save!

    order_transaction.issuer_wallet.balance -= order_transaction.amount
    order_transaction.receiver_wallet.balance += order_transaction.amount

    order_transaction.issuer_wallet.save!
    order_transaction.receiver_wallet.save!
    order_transaction
>>>>>>> airwaze-mvp/master
  end
end
