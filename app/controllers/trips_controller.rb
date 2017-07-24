class TripsController < ApplicationController
  # before_action :authenticate_traveler
  # before_action :set_traveler
  # before_action :set_current_traveler



  def index
    # return all of the trips for specific traveler
    # traveler = Traveler.find_by[params: email]
    # trips = Trip.all
    #
    # if trips.length >= 1
    #   render json: trips.as_json(except: [:updated_at, :created_at]), status: :ok
    # else
    #   render json: { no_trips: "Trips were not found" }, status: :not_found
    # end

    # current_traveler = Traveler.find_by_id(Traveler.to_token_payload["sub"])
    puts "********************"
    puts "#{current_traveler.id}"
    if current_traveler
      @trips = current_traveler.trips
      render json: @trips, each_serializer: TripSerializer
    end
  end

  def show
    trip = Trip.find_by(id: params[:id])
    if trip
      render json: trip.as_json(except: [:created_at, :updated_at]), status: :ok
    else
      render json: { errors: {id: ["Trip id '#{params[:id]}' not found"]} }, status: :not_found
    end
    # render json: @trip, serializer: TripSerializer
  end

  def create

    # logger.debug "================="


    # if current_traveler
      trip = Trip.new(trip_params)
      # trip.traveler_id = current_traveler.id
      logger.debug "================="
      puts "#{trip}"
      logger.debug "================="
      logger.debug "================="
      trip.validate
      puts trip.errors.messages
      if trip.save

        logger.debug "worked"
        render status: :ok, json: { location: trip.location }
      else
        logger.debug "fail #{trip.errors.messages}"
        render status: :bad_request, json: { errors: trip.errors.messages }
      end
    # end
  end

  def update
  end

  private

  def set_current_traveler
    @traveler = Traveler.find(params[:id])
  end

  def set_trips
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:location, :start_date, :end_date, :event_paid, :hotel_reserved, :flight_paid, :details, :traveler_id, :event_name)
  end
end
