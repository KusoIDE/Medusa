require 'test_helper'

class Api::V1::PackagesControllerTest < ActionController::TestCase
  test "should get archive_contents" do
    get :archive_contents
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

end
