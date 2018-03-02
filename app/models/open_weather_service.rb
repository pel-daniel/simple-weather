require 'open-uri'

class OpenWeatherService
  BASE_URL = "http://api.openweathermap.org/data/2.5/weather?appid=#{ENV['OPEN_WEATHER_API_KEY']}&units=metric"

  def self.get_weather(city)
    response_string = open("#{BASE_URL}&q=#{city}").read
    JSON.parse(response_string)
  end
end
