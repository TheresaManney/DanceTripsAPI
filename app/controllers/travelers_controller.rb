class TravelersController < ApplicationController
  # require 'bcrypt'
  # might not need this before action since its in the application controller
  # before_action :authenticate_traveler
  # before_action :get_traveler
  # before_action :set_traveler, only: [:show, :create, :update, :destroy]

  # skip_before_action :authenticate_traveler, only: [:create]
  # before_action :authenticate_traveler, except: [:create]
  # before_action :set_current_traveler, except: [:create]


  # def current
  #   render json: current_user
  # end
  # NOTE: (FOR AUTHENTICATING TRAVELER)
  # You can access the current traveler in your controller with current_user.
  # You also have access directly to current_traveler which will try to authenticate or return nil:
    #   def index
    #     if current_user
    #       # do something
    #     else
    #       # do something else
    #     end
    #   end

  # this was a test
  def index
    # return all of the travelers
    # travelers = Traveler.all
    # if travelers.length >= 1
    #   render json: travelers.as_json(except: [:updated_at, :created_at]), status: :ok
    # else
    #   render json: { no_travelers: "Travelers were not found" }, status: :not_found
    # end

    # @travelers = Traveler.all
    # render json: @travelers, each_serializer: TravelerSerializer
    puts "&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
    puts "#{current_traveler.id}"
    puts "#{current_traveler.first_name}"
    puts "#{current_traveler.last_name}"
    puts "#{current_traveler.email}"

    if current_traveler
      # current_traveler.id
      # current_traveler.first_name
      # current_traveler.last_name
      # current_traveler.email
      @travelers = Traveler.all

    end

  end

  def show
    # render json: @traveler, serializer: TravelerSerializer
    render json: Traveler.find(current_traveler)
  end

  def create
    @traveler = Traveler.new(traveler_params)
    puts "testtestttesttest"
    puts "#{@traveler.email}"

    if @traveler.save
      # render status: :ok, json: {first_name: @traveler.first_name}
      render json: @traveler, each_serializer: TravelerSerializer
    else
      render status: :bad_request, json: { errors: @traveler.errors.messages }
    end
  end

  def update
    if @traveler.update(traveler_params)
      render json: @traveler
    else
      render json: @traveler.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @traveler.destroy
  end

  private
  def traveler_params
    params.require(:traveler).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
