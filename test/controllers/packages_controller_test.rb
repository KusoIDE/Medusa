require 'test_helper'

class PackagesControllerTest < ActionController::TestCase
  test "should get archive_contents" do
    get :archive_contents
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
