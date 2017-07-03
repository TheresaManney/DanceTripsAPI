require "test_helper"

describe TravelersController do
  it "should get index" do
    get travelers_index_url
    value(response).must_be :success?
  end

end
