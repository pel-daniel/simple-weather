class WeatherController < ApplicationController
  def index
  end

  def search
    @location = params[:location]
  end
end
