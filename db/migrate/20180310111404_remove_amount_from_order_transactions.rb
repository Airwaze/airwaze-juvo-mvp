class RemoveAmountFromOrderTransactions < ActiveRecord::Migration[5.1]
  def change
    remove_column :order_transactions, :amount, :string
  end
end
