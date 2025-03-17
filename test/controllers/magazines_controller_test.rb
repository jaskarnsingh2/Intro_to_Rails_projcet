require "test_helper"

class MagazinesControllerTest < ActionDispatch::IntegrationTest
  test "should get show_all" do
    get magazines_show_all_url
    assert_response :success
  end
end
