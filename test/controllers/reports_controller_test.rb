require "test_helper"

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get trial_balance" do
    get reports_trial_balance_url
    assert_response :success
  end

  test "should get income_statement" do
    get reports_income_statement_url
    assert_response :success
  end

  test "should get balance_sheet" do
    get reports_balance_sheet_url
    assert_response :success
  end
end
