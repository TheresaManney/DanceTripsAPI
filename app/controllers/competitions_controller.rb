class CompetitionsController < ApplicationController
  def index
  end

  def create
    competition = Competition.new(competition_params)

    if competition.save
      render status: :of, json: { id: competition.id }
    else
      render status: :bad_request, json: { errors: trip.errors.messages }
    end
  end

  private
  def competition_params
    params.require(:competition).permit(:level, :type, :finals, :placement, :trip_id)
  end
end
