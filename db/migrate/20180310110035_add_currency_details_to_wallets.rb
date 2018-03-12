class AddCurrencyDetailsToWallets < ActiveRecord::Migration[5.1]
  def change
    add_reference :wallets, :currency, foreign_key: true
    add_column :wallets, :balance, :integer
  end
end
