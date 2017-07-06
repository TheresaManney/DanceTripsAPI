require "test_helper"

describe CompetitionsController do
  KEYS = %w(id level comp_type finals placement trip_id)

  describe "index" do
    it "is a real working route" do
      get competitions_url
      must_respond_with :success
    end

    it "returns json" do
      get competitions_url
      response.header['Content-Type'].must_include 'json'
    end

    it "returns an Array" do
      get competitions_url
      body = JSON.parse(response.body)
      body.must_be_kind_of Array
    end

    # TODO: will need to change this to be more specific to returning all competitions with similar traveler and trip ids combined
    it "returns all of the competitions" do
      get competitions_url
      body = JSON.parse(response.body)
      body.length.must_equal Competition.count
    end

    it "returns competitions with exactly the required fields" do
      get competitions_url
      body = JSON.parse(response.body)
      body.each do |competition|
        competition.keys.sort.must_equal KEYS.sort
      end
    end
  end
end
