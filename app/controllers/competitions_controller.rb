class CompetitionsController < ApplicationController
  before_action :authenticate_traveler
  before_action :find_trip
  # before_action :set_current_traveler
  def index
    # find_trip
    puts "777777777777"
    puts "#{@trip.id}"
    # competitions = Competition.all
    puts "..................."
    puts "#{@trip.competitions.length}"
    puts "#{params[:trip_id]}"
    # if @trip.competitions
    if params[:trip_id]
      @competitions = Competition.includes(:trips).where(trips: { id: params[:trip_id]})
      puts "#{@competitions}"



      # @trips = current_traveler.trips

      # competitions = @trip.competitions

      if @trip.competitions.length >= 1
        render json: @trip.competitions, each_serializer: CompetitionSerializer
        # render json: @trip.competitions.as_json(except: [:updated_at, :created_at]), status: :ok
      else
        render json: { no_competitions: "Competitions were not found" }, status: :not_found
      end
    end
  end

  def show
    competition = Competition.find_by(id: params[:id])
    # raise
    if competition
      render json: competition.as_json(except: [:created_at, :updated_at]), status: :ok
    else
      render json: { errors: { id: ["Competition '#{params[:id]}' not found"] } }, status: :not_found
    end
  end

  def create
    if params[:trip_id]
      # trip = Trip.find_by(id: params[:id])
      competition = Competition.new(competition_params)
      competition.trip_id = @trip.id
      if competition.save
        render status: :of, json: { id: competition.id }
      else
        render status: :bad_request, json: { errors: competition.errors.messages }
      end
    end
  end

  def update
  end

  private
  def find_trip
    @trip = Trip.find_by(id: params[:trip_id])
  end
  def competition_params
    params.require(:competition).permit(:level, :comp_type, :finals, :placement, :trip_id)
  end
end
