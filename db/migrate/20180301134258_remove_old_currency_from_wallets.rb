class RemoveOldCurrencyFromWallets < ActiveRecord::Migration[5.1]
  def change
    remove_column :wallets, :currency_name
    remove_column :wallets, :balance
  end
end
