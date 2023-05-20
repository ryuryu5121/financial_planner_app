require "test_helper"

class FinancialPlannerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get financial_planner_new_url
    assert_response :success
  end

  test "should get show" do
    get financial_planner_show_url
    assert_response :success
  end
end
