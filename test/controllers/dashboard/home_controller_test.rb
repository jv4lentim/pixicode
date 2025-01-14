require "test_helper"

module Dashboard
  class HomeControllerTest < ActionDispatch::IntegrationTest
    test "should get index" do
      get dashboards_index_url
      assert_response :success
    end
  end
end
