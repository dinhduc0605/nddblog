require 'test_helper'

class Admin::StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get admin_static_pages_dashboard_url
    assert_response :success
  end

end
