require "test_helper"

describe TravelersController do
  TRAVELER_KEYS = %w(id first_name last_name email password_digest)

  describe "index" do
    it "is a real working route" do
      get travelers_url
      must_respond_with :success
    end

    it "returns json" do
      get travelers_url
      response.header['Content-Type'].must_include 'json'
    end

    it "returns an Array" do
      get travelers_url
      body = JSON.parse(response.body)
      body.must_be_kind_of Array
    end

    # TODO: might not ever use this one...
    it "returns all of the travelers" do
      get travelers_url
      body = JSON.parse(response.body)
      body.length.must_equal Traveler.count
    end

    it "returns travelers with exactly the required fields" do
      get travelers_url
      body = JSON.parse(response.body)
      body.each do |traveler|
        traveler.keys.sort.must_equal TRAVELER_KEYS.sort
      end
    end

    it "returns an understanable error message if travelers were not found" do
      travelers = Traveler.destroy_all
      get travelers_url
      body = JSON.parse(response.body)
      body.must_equal "no_travelers" => "Travelers were not found"
      Traveler.count.must_equal 0
      must_respond_with :not_found
    end
  end

  # TODO: make tests for create
  # describe "create" do
  #   it "creates a new competition" do
  #     new_comp = Competition.new
  #   end
  # end

end
