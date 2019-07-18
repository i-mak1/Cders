require 'test_helper'

class ShippingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get shippings_new_url
    assert_response :success
  end

end
