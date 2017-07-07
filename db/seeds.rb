
# Traveler seeds
JSON.parse(File.read('db/seeds/travelers.json')).each do |traveler|
  Traveler.create!(traveler)
end

# Trips seeds
JSON.parse(File.read('db/seeds/trips.json')).each do |trip|
  Trip.create!(trip)
end

# Competition seeds
JSON.parse(File.read('db/seeds/competitions.json')).each do |competition|
  Competition.create!(competition)
end
