class Address < ApplicationRecord
  #OaXnqpKJOsMuS3vEapwgmBMUS0GG81Yf
  include HTTParty

  def getHighTemp(zipcode)
    responseForLocation = HTTParty.get("http://dataservice.accuweather.com/locations/v1/postalcodes/search?apikey=OaXnqpKJOsMuS3vEapwgmBMUS0GG81Yf&q=#{zipcode}")[0]["Key"]
    responseForHigh = HTTParty.get("http://dataservice.accuweather.com/forecasts/v1/daily/1day/#{responseForLocation}?apikey=OaXnqpKJOsMuS3vEapwgmBMUS0GG81Yf")["DailyForecasts"][0]["Temperature"]["Maximum"]["Value"]
  end


end
