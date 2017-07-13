class TripSerializer < ApplicationSerializer
  attributes :id, :location, :start_date, :end_date, :event_paid, :hotel_reserved, :flight_paid, :details, :traveler_id, :event_name
end
