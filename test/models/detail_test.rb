require "test_helper"

describe Detail do
  let(:detail) { Detail.new }

  it "must be valid" do
    value(detail).must_be :valid?
  end
end
