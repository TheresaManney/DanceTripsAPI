class AddFKeys < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :details, :text

    add_reference :trips, :traveler
    add_reference :competitions, :trip
  end
end
