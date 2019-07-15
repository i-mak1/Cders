require 'test_helper'

class AdminArtistsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_artists_new_url
    assert_response :success
  end

end
