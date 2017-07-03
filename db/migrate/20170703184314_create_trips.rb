class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.string :location
      t.datetime :dates
      t.boolean :event_paid
      t.boolean :hotel_reserved
      t.boolean :flight_paid

      t.timestamps
    end
  end
end
