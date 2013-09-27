require 'test_helper'

class Admin::EmployessesControllerTest < ActionController::TestCase
  setup do
    @admin_employess = admin_employesses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_employesses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_employess" do
    assert_difference('Admin::Employess.count') do
      post :create, admin_employess: { address: @admin_employess.address, contact_no: @admin_employess.contact_no, createdby: @admin_employess.createdby, email: @admin_employess.email, empid: @admin_employess.empid, first_name: @admin_employess.first_name, last_name: @admin_employess.last_name, manager_id: @admin_employess.manager_id, modifiedby: @admin_employess.modifiedby, password_digest: @admin_employess.password_digest }
    end

    assert_redirected_to admin_employess_path(assigns(:admin_employess))
  end

  test "should show admin_employess" do
    get :show, id: @admin_employess
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_employess
    assert_response :success
  end

  test "should update admin_employess" do
    put :update, id: @admin_employess, admin_employess: { address: @admin_employess.address, contact_no: @admin_employess.contact_no, createdby: @admin_employess.createdby, email: @admin_employess.email, empid: @admin_employess.empid, first_name: @admin_employess.first_name, last_name: @admin_employess.last_name, manager_id: @admin_employess.manager_id, modifiedby: @admin_employess.modifiedby, password_digest: @admin_employess.password_digest }
    assert_redirected_to admin_employess_path(assigns(:admin_employess))
  end

  test "should destroy admin_employess" do
    assert_difference('Admin::Employess.count', -1) do
      delete :destroy, id: @admin_employess
    end

    assert_redirected_to admin_employesses_path
  end
end
