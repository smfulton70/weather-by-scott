class Address < ApplicationRecord
  #OaXnqpKJOsMuS3vEapwgmBMUS0GG81Yf
  include HTTParty

  def getHighTemp(zipcode)
    responseForLocation = HTTParty.get("http://dataservice.accuweather.com/locations/v1/postalcodes/search?apikey=WrWJozdXHdavGnA2GPSgC2C8x13aatgB&q=#{zipcode}")[0]["Key"]
    responseForHigh = HTTParty.get("http://dataservice.accuweather.com/forecasts/v1/daily/1day/#{responseForLocation}?apikey=WrWJozdXHdavGnA2GPSgC2C8x13aatgB")["DailyForecasts"][0]["Temperature"]["Maximum"]["Value"]
  end

  def getLowTemp(zipcode)
    responseForLocation = HTTParty.get("http://dataservice.accuweather.com/locations/v1/postalcodes/search?apikey=WrWJozdXHdavGnA2GPSgC2C8x13aatgB&q=#{zipcode}")[0]["Key"]
    responseForLow = HTTParty.get("http://dataservice.accuweather.com/forecasts/v1/daily/1day/#{responseForLocation}?apikey=WrWJozdXHdavGnA2GPSgC2C8x13aatgB")["DailyForecasts"][0]["Temperature"]["Minimum"]["Value"]
  end

  def getCurrentTemp(zipcode)
    responseForLocation = HTTParty.get("http://dataservice.accuweather.com/locations/v1/postalcodes/search?apikey=WrWJozdXHdavGnA2GPSgC2C8x13aatgB&q=#{zipcode}")[0]["Key"]
    responseForCurrent = HTTParty.get("http://dataservice.accuweather.com/currentconditions/v1/#{responseForLocation}?apikey=WrWJozdXHdavGnA2GPSgC2C8x13aatgB")[0]["Temperature"]["Imperial"]["Value"]
  end


end
