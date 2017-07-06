require "test_helper"

describe Trip do
  let(:new_trip) { Trip.new }
  let(:a_trip) { Trip.new(
    traveler_id: travelers(:traveler_one).id,
    location: "Denver",
    event_name: "Camp Hollywood",
    start_date: trips(:trip_one).start_date,
    end_date: trips(:trip_one).end_date,
    event_paid: true,
    hotel_reserved: true,
    flight_paid: true
    )
  }

  REQUIRED_FIELDS = %w(traveler_id location start_date end_date)

  describe "Trip relationships" do
    it "Trip can have many competitions" do
      the_trip = trips(:trip_one)
      the_trip.competitions.must_include competitions(:comp_one)
      the_trip.competitions.must_include competitions(:comp_three)
    end

    it "Trip has the correct traveler" do
      a_trip.must_respond_to :traveler
      a_trip.traveler.must_be_kind_of Traveler
    end
  end

  describe "Trip validations" do
  end

end

# validates :traveler_id, presence: true
# validates :location, presence: true
# validates :start_date, presence: true
# validates :end_date, presence: true
