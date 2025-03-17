require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get show_all" do
    get books_show_all_url
    assert_response :success
  end
end
