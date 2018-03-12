class AddKindToCurrency < ActiveRecord::Migration[5.1]
  def change
    add_column :currencies, :kind, :integer, null: false, default: 0
  end
end
