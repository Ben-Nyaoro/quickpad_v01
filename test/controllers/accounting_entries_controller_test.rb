require "test_helper"

class AccountingEntriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get accounting_entries_index_url
    assert_response :success
  end

  test "should get show" do
    get accounting_entries_show_url
    assert_response :success
  end
end
