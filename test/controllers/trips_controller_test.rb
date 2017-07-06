require "test_helper"

describe TripsController do
  TRIP_KEYS = %w(id traveler_id event_name location details start_date end_date event_paid hotel_reserved flight_paid)

  describe "index" do
    it "is a real working route" do
      get trips_url
      must_respond_with :success
    end

    it "returns json" do
      get trips_url
      response.header['Content-Type'].must_include 'json'
    end

    it "returns an Array" do
      get trips_url
      body = JSON.parse(response.body)
      body.must_be_kind_of Array
    end

    # TODO: will need to change this to be more specific to returning all trips for a specific traveler
    it "returns all of the competitions" do
      get trips_url
      body = JSON.parse(response.body)
      body.length.must_equal Trip.count
    end

    it "returns competitions with exactly the required fields" do
      get trips_url
      body = JSON.parse(response.body)
      body.each do |trip|
        trip.keys.sort.must_equal TRIP_KEYS.sort
      end
    end

    it "returns an understanable error message if competitors were not found" do
      tripss = Trip.destroy_all
      get trips_url
      body = JSON.parse(response.body)
      body.must_equal "no_trips" => "Trips were not found"
      Trip.count.must_equal 0
      must_respond_with :not_found
    end
  end
  describe "show" do
    it "must get a competition" do
      get trip_path(trips(:trip_one).id)
      must_respond_with :success
      body = JSON.parse(response.body)
      body.must_be_instance_of Hash
      body.keys.sort.must_equal TRIP_KEYS.sort
    end

    it "responds correctly when the competition is not found" do
      no_id = (Trip.count) + 1
      get trip_path(no_id)
      body = JSON.parse(response.body)
      body["errors"].must_equal "id" => ["Trip id '#{no_id}' not found"]
      must_respond_with :not_found
    end

    it "when we get a competition it has the right information" do
      get trip_path(trips(:trip_five).id)
      body = JSON.parse(response.body)

      TRIP_KEYS.each do |key|
        body[key].must_equal trips(:trip_five)[key]
      end
    end

    it "returns an understandable error message if customers were not found" do
      no_id = (Trip.count + 1)
      get trip_path(no_id)
      body = JSON.parse(response.body)
      body.must_equal "errors" => { "id" => ["Trip id '#{no_id}' not found"] }
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
