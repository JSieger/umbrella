require "http"
require "json"

# puts "Agent! what is your location?!\n"

# location = gets.chomp

location = "sacramento"

# Assemble the full URL string by adding the first part, the API token, and the last part together
google_maps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + location + "&key=" + ENV.fetch("GMAPS_KEY")

# Place a GET request to the URL
gmaps_response = HTTP.get(google_maps_url)

gmaps_hash = JSON.parse(gmaps_response)

gmaps_hash.fetch("results")[0]["geometry"]["location"]

lat_long = gmaps_hash.fetch("results")[0]["geometry"]["location"]
lat = lat_long["lat"]
long = lat_long["lng"]

pirate_weather_url = "https://api.pirateweather.net/forecast/" + ENV.fetch("PIRATE_WEATHER_KEY") + "/#{lat},#{long}"

pirate_response = HTTP.get(pirate_weather_url)

pp pirate_response
