require 'test_helper'

class LeavesControllerTest < ActionController::TestCase
  setup do
    @leafe = leaves(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leaves)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create leafe" do
    assert_difference('Leafe.count') do
      post :create, leafe: { compoffs: @leafe.compoffs, createdby: @leafe.createdby, els: @leafe.els, employee_id: @leafe.employee_id, is_special: @leafe.is_special, lops: @leafe.lops, modifiedby: @leafe.modifiedby, nels: @leafe.nels }
    end

    assert_redirected_to leafe_path(assigns(:leafe))
  end

  test "should show leafe" do
    get :show, id: @leafe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @leafe
    assert_response :success
  end

  test "should update leafe" do
    put :update, id: @leafe, leafe: { compoffs: @leafe.compoffs, createdby: @leafe.createdby, els: @leafe.els, employee_id: @leafe.employee_id, is_special: @leafe.is_special, lops: @leafe.lops, modifiedby: @leafe.modifiedby, nels: @leafe.nels }
    assert_redirected_to leafe_path(assigns(:leafe))
  end

  test "should destroy leafe" do
    assert_difference('Leafe.count', -1) do
      delete :destroy, id: @leafe
    end

    assert_redirected_to leaves_path
  end
end
