require "test_helper"

class DiagnosticsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get diagnostics_index_url
    assert_response :success
  end

  test "should get show" do
    get diagnostics_show_url
    assert_response :success
  end
end
