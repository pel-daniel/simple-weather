require 'test_helper'

class SearchTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path

    assert_select '#location'
    assert_response :success
  end

  test "show weather details of a location" do
    post '/search', params: { location: 'mexico city' }, xhr: true

    assert_response :success
    assert_equal 'text/javascript', @response.content_type
    assert_select 'dt', 4
  end

  test "show error message for non-existent location" do
    post "/search", params: { location: 'rubbish' }, xhr: true

    assert_response :success
    assert_equal 'text/javascript', @response.content_type
    assert_match /I don\\'t know that location/, @response.body
  end
end
