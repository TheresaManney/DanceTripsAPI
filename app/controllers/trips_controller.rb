class TripsController < ApplicationController
  before_action :authenticate_traveler
  def index
    # return all of the trips for specific traveler
    # traveler = Traveler.find_by[params: email]
    trips = Trip.all

    if trips.length >= 1
      render json: trips.as_json(except: [:updated_at, :created_at]), status: :ok
    else
      render json: { no_trips: "Trips were not found" }, status: :not_found
    end

  end

  def show
    trip = Trip.find_by(id: params[:id])
    if trip
      render json: trip.as_json(except: [:created_at, :updated_at]), status: :ok
    else
      render json: { errors: {id: ["Trip id '#{params[:id]}' not found"]} }, status: :not_found
    end
  end

  def create
    trip = Trip.new(trip_params)
    puts "#{trip}"
    if trip.save
      render status: :ok, json: { location: trip.location }
    else
      render status: :bad_request, json: { errors: trip.errors.messages }
    end
  end

  private
  def trip_params
    params.require(:trip).permit(:location, :start_date, :end_date, :event_paid, :hotel_reserved, :flight_paid, :details, :traveler_id, :event_name)
  end
end
