class AddStockInTableDevice < ActiveRecord::Migration[5.1]
  def change
    add_column :devices, :stock, :integer
  end
end
