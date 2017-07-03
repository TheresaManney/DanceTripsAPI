class AddTripColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :event_name, :string
  end
end
