class TableDepts < ActiveRecord::Migration[5.1]
  def change
    create_table :depts
    add_column :depts, :name, :string
  end
end
