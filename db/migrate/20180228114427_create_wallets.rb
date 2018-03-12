class CreateWallets < ActiveRecord::Migration[5.1]
  def change
    create_table :wallets do |t|
      t.string :currency_name, null: false
      t.decimal :balance, null: false, default: 0.0

      t.timestamps
    end
  end
end
