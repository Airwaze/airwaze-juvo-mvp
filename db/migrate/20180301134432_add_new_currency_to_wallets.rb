class AddNewCurrencyToWallets < ActiveRecord::Migration[5.1]
  def change
    add_column :wallets, :juvo_token_balance, :integer, default: 0
    add_column :wallets, :air_time_token_balance, :integer, default: 0
  end
end
