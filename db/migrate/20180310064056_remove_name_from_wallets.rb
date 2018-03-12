class RemoveNameFromWallets < ActiveRecord::Migration[5.1]
  def change
    remove_column :wallets, :name, :string
  end
end
