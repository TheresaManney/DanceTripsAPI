require "test_helper"

describe Traveler do
  let(:traveler) { Traveler.new }

  it "must be valid" do
    value(traveler).must_be :valid?
  end
end
