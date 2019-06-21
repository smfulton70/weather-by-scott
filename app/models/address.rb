class Address < ApplicationRecord
  validates :zipcode, presence: true

  include HTTParty

  def getLocationKey(zipcode)
    locationKey = HTTParty.get("http://dataservice.accuweather.com/locations/v1/postalcodes/search?apikey=#{AUTH_DETAILS}&q=#{zipcode}")[0]["Key"]
  end

  def getTemps
    locationKey = getLocationKey(zipcode)
    high_and_low = HTTParty.get("http://dataservice.accuweather.com/forecasts/v1/daily/1day/#{locationKey}?apikey=#{AUTH_DETAILS}")["DailyForecasts"][0]["Temperature"]
    high = high_and_low["Maximum"]["Value"]
    low = high_and_low["Minimum"]["Value"]
    current = HTTParty.get("http://dataservice.accuweather.com/currentconditions/v1/#{locationKey}?apikey=#{AUTH_DETAILS}")[0]["Temperature"]["Imperial"]["Value"]
    five = HTTParty.get("http://dataservice.accuweather.com/forecasts/v1/daily/5day/#{locationKey}?apikey=#{AUTH_DETAILS}")
    temps = {high_temp: high, low_temp: low, current_temp: current}
  end
end
