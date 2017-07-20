class TripSerializer < ApplicationSerializer
  attributes :id, :location, :start_date, :end_date, :event_paid, :hotel_reserved, :flight_paid, :details, :traveler_id, :event_name#, :show

  has_many :competitions

  # def show
  #   TripsController.render(:show, assigns: { trip: object }, layout: false ).squish
  # end
end
