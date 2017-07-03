class DropDetails < ActiveRecord::Migration[5.0]
  def change
    drop_table :details
  end
end
