class TravelersController < ApplicationController

  # this was a test
  def index
    # return all of the travelers
    travelers = Traveler.all
    if travelers.length >= 1
      render json: travelers.as_json(except: [:updated_at, :created_at]), status: :ok
    else
      render json: { no_travelers: "Travelers were not found" }, status: :not_found
    end
  end

  def create
    traveler = Traveler.new(traveler_params)

    if traveler.save
      render status: :ok, json: {name: traveler.name}
    else
      render status: :bad_request, json: { errors: traveler.errors.messages }

    end
  end

  private
  # allowed info to prevent bad data

  def traveler_params
    params.require(:traveler).permit(:name, :email)
  end

end
