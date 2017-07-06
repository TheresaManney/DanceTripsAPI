require "test_helper"

describe Traveler do
  let(:new_traveler) { Traveler.new }

  REQUIRED_FIELDS = %w(name email)

  describe "Traveler relationships" do
    it 'Traveler can have many trips' do
      the_traveler = travelers(:traveler_four)
      the_traveler.trips.must_include trips(:trip_two)
      the_traveler.trips.must_include trips(:trip_three)
    end
  end

  describe "Traveler validations" do
    it "Traveler must have a name and an email" do
      traveler = travelers(:traveler_four)
      traveler.valid?.must_equal true
    end

    REQUIRED_FIELDS.each do |field|
      it "Traveler is not valid when #{field} is not present" do
        new_traveler.valid?.must_equal false
        new_traveler.errors.messages.must_include field.to_sym
      end
    end

    it "Traveler is not valid if email is not unique" do
      first_traveler = travelers(:traveler_one)
      second_traveler = Traveler.new(name: "Rainbow", email: travelers(:traveler_one).email)

      first_traveler.valid?.must_equal true
      second_traveler.valid?.must_equal false
    end
  end
end
