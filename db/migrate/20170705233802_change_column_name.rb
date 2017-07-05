class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    remove_column :competitions, :type

    add_column :competitions, :comp_type, :string
  end
end
