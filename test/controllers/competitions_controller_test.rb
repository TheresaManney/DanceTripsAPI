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

    it "returns an understanable error message if competitors were not found" do
      competitions = Competition.destroy_all
      get competitions_url
      body = JSON.parse(response.body)
      body.must_equal "no_competitions" => "Competitions were not found"
      Competition.count.must_equal 0
      must_respond_with :not_found
    end
  end
  describe "show" do
    it "must get a competition" do
      get competition_path(competitions(:comp_one).id)
      must_respond_with :success
      body = JSON.parse(response.body)
      body.must_be_instance_of Hash
      body.keys.sort.must_equal KEYS.sort
    end

    it "responds correctly when the competition is not found" do
      no_id = (Competition.count) + 1
      get competition_path(no_id)
      body = JSON.parse(response.body)
      body["errors"].must_equal "id" => ["Competition '#{no_id}' not found"]
      # puts "***********"
      # puts "#{no_id}"
      must_respond_with :not_found
    end

    it "when we get a competition it has the right information" do
      get competition_path(competitions(:comp_one).id)
      body = JSON.parse(response.body)

      KEYS.each do |key|
        body[key].must_equal competitions(:comp_one)[key]
      end
    end

    it "returns an understandable error message if customers were not found" do
      no_id = (Competition.count + 1)
      get competition_path(no_id)
      body = JSON.parse(response.body)
      body.must_equal "errors" => { "id" => ["Competition '#{no_id}' not found"] }
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
