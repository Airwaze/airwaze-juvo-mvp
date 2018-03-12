class AddNameToWallet < ActiveRecord::Migration[5.1]
  def change
    add_column :wallets, :name, :string
  end
end
