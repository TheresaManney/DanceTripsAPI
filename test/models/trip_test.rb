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
    it "Trip must have a traveler_id, location, start_date, and end_date" do
      trip = trips(:trip_three)
      trip.valid?.must_equal true
    end

    REQUIRED_FIELDS.each do |field|
      it "Trip is not valid when #{field} is not present" do
        new_trip.valid?.must_equal false
        new_trip.errors.messages.must_include field.to_sym
      end
    end
  end
end

# validates :traveler_id, presence: true
# validates :location, presence: true
# validates :start_date, presence: true
# validates :end_date, presence: true
