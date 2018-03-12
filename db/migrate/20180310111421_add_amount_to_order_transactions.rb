class AddAmountToOrderTransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :order_transactions, :amount, :integer
  end
end
