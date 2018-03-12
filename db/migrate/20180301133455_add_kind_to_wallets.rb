class AddKindToWallets < ActiveRecord::Migration[5.1]
  def change
    add_column :wallets, :kind, :integer, null: false, default: 0
  end
end
