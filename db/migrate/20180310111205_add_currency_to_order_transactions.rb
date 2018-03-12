class AddCurrencyToOrderTransactions < ActiveRecord::Migration[5.1]
  def change
    add_reference :order_transactions, :currency, foreign_key: true
  end
end
