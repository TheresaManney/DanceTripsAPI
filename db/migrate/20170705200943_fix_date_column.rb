class FixDateColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :trips, :dates

    add_column :trips, :start_date, :datetime
    add_column :trips, :end_date, :datetime
  end
end
