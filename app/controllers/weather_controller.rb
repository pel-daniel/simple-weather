class WeatherController < ApplicationController
  def index
  end

  def search
    @weather = OpenWeatherService.get_weather(params[:location])
  end
end
