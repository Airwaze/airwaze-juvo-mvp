class RemoveNameFromCurrency < ActiveRecord::Migration[5.1]
  def change
    remove_column :currencies, :name, :string
  end
end
