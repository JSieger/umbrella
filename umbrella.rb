require "http"
require "json"

# puts "Agent! what is your location?!\n"

# location = gets.chomp

location = "sacramento"

# Assemble the full URL string by adding the first part, the API token, and the last part together
google_maps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + location + "&key=" + ENV.fetch("GMAPS_KEY")

# Place a GET request to the URL
raw_response = HTTP.get(google_maps_url)

gmaps_hash = JSON.parse(raw_response)

pp gmaps_hash.fetch("results")[0]

# lat_long = gmaps_hash[:results][0][:geometry][:location]
# lat = lat_long[:lat]
# long = lat_long[:lng]
# pp "latitude: #{lat}, longitude: #{long}"
