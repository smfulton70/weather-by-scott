class Address < ApplicationRecord
  validates :zipcode, presence: true


  include HTTParty

  def getLocationKey(zipcode)
    locationKey = HTTParty.get("http://dataservice.accuweather.com/locations/v1/postalcodes/search?apikey=WrWJozdXHdavGnA2GPSgC2C8x13aatgB&q=#{zipcode}")[0]["Key"]
  end

  def getTemps
    locationKey = getLocationKey(zipcode)
    high_and_low = HTTParty.get("http://dataservice.accuweather.com/forecasts/v1/daily/1day/#{locationKey}?apikey=WrWJozdXHdavGnA2GPSgC2C8x13aatgB")["DailyForecasts"][0]["Temperature"]
    high = high_and_low["Maximum"]["Value"]
    low = high_and_low["Minimum"]["Value"]
    current = HTTParty.get("http://dataservice.accuweather.com/currentconditions/v1/#{locationKey}?apikey=WrWJozdXHdavGnA2GPSgC2C8x13aatgB")[0]["Temperature"]["Imperial"]["Value"]
    temps = {high_temp: high, low_temp: low, current_temp: current}
  end
end
