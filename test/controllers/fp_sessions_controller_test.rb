require "test_helper"

class FpSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get fp_sessions_new_url
    assert_response :success
  end
end
