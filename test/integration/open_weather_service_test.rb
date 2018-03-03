require 'test_helper'

class OpenWeatherServiceTest < ActionDispatch::IntegrationTest
  test "get weather of correct location" do
    response = OpenWeatherService.get_weather('mexico city')

    assert_not_nil response['weather']
    assert response['main']&.keys, %w(temp pressure humidity temp_min temp_max)
  end

  test "non-existent location" do
    response = OpenWeatherService.get_weather('rubbish')

    assert response, { error: 'not-found' }
  end
end
