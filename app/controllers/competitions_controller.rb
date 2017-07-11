class CompetitionsController < ApplicationController
  before_action :authenticate_traveler
  def index
    competitions = Competition.all

    if competitions.length >= 1
      render json: competitions.as_json(except: [:updated_at, :created_at]), status: :ok
    else
      render json: { no_competitions: "Competitions were not found" }, status: :not_found
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
    competition = Competition.new(competition_params)

    if competition.save
      render status: :of, json: { id: competition.id }
    else
      render status: :bad_request, json: { errors: competition.errors.messages }
    end
  end

  private
  def competition_params
    params.require(:competition).permit(:level, :comp_type, :finals, :placement, :trip_id)
  end
end
