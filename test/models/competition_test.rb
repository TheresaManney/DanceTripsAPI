require "test_helper"

describe Competition do
  let(:competition) { Competition.new }

  it "must be valid" do
    value(competition).must_be :valid?
  end
end
