class RemoveLegacyFieldsFromWallets < ActiveRecord::Migration[5.1]
  def change
    remove_column :wallets, :kind, :string
    remove_column :wallets, :juvo_token_balance, :string
    remove_column :wallets, :air_time_token_balance, :string
  end
end
