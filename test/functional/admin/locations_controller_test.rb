require 'test_helper'

class Admin::LocationsControllerTest < ActionController::TestCase
  setup do
    @admin_location = admin_locations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_locations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_location" do
    assert_difference('Admin::Location.count') do
      post :create, admin_location: { title: @admin_location.title }
    end

    assert_redirected_to admin_location_path(assigns(:admin_location))
  end

  test "should show admin_location" do
    get :show, id: @admin_location
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_location
    assert_response :success
  end

  test "should update admin_location" do
    put :update, id: @admin_location, admin_location: { title: @admin_location.title }
    assert_redirected_to admin_location_path(assigns(:admin_location))
  end

  test "should destroy admin_location" do
    assert_difference('Admin::Location.count', -1) do
      delete :destroy, id: @admin_location
    end

    assert_redirected_to admin_locations_path
  end
end
