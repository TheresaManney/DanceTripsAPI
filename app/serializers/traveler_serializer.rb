class TravelerSerializer < ApplicationSerializer
  attributes :id, :first_name, :last_name#, :show
  attribute :email
  has_many :trips

  # object is the record of the user
  # def show
  #   TravelersController.render(:show, assigns: { traveler: object }, layout: false ).squish
  # end
end
