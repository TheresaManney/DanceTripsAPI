require "test_helper"

describe Competition do
  let(:new_competition) { Competition.new }
  let(:competition) { Competition.new(trip_id: trips(:trip_one).id, level: "Invitational", comp_type: "Social", finals: true, placement: 3)}

  describe "Competition relationships" do
    it "Competition has the correct trip" do
      competition.must_respond_to :trip
      competition.trip.must_be_kind_of Trip
    end
  end

  describe "Competition valdations" do
    it "is valid with trip_id, level and comp_type" do
      competition = competitions(:comp_two)
      competition.valid?.must_equal true
    end

    REQUIRED_FIELDS = %w(trip_id level comp_type)

    REQUIRED_FIELDS.each do |field|
      it "Competition is not valid when #{field} id not present" do
        new_competition.valid?.must_equal false
        new_competition.errors.messages.must_include field.to_sym
      end
    end
  end
end
