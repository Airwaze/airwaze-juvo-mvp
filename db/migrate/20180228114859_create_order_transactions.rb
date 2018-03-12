class CreateOrderTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :order_transactions do |t|
      t.references :issuer_wallet, references: :wallets
      t.references :receiver_wallet, references: :wallets
      t.decimal :amount, null: false

      t.timestamps
    end

    add_foreign_key :order_transactions, :wallets, column: :issuer_wallet_id
    add_foreign_key :order_transactions, :wallets, column: :receiver_wallet_id
  end
end
