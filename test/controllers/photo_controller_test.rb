require "test_helper"

class PhotoControllerTest < ActionDispatch::IntegrationTest
  test "should get rock_id:integer" do
    get photo_rock_id:integer_url
    assert_response :success
  end

  test "should get url:string" do
    get photo_url:string_url
    assert_response :success
  end
end
