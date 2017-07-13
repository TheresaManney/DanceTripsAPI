class TravelerSerializer < ApplicationSerializer
  attributes :id, :first_name, :last_name, :show
  attribute: :email
  has_many :trips
  def show
    TravelersController.render(:show, assigns: { traveler: object }, layout: false ).squish
  end
end
