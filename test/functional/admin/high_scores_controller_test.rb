require 'test_helper'

class Admin::HighScoresControllerTest < ActionController::TestCase
  setup do
    @admin_high_score = admin_high_scores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_high_scores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_high_score" do
    assert_difference('Admin::HighScore.count') do
      post :create, admin_high_score: { game: @admin_high_score.game, score: @admin_high_score.score }
    end

    assert_redirected_to admin_high_score_path(assigns(:admin_high_score))
  end

  test "should show admin_high_score" do
    get :show, id: @admin_high_score
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_high_score
    assert_response :success
  end

  test "should update admin_high_score" do
    put :update, id: @admin_high_score, admin_high_score: { game: @admin_high_score.game, score: @admin_high_score.score }
    assert_redirected_to admin_high_score_path(assigns(:admin_high_score))
  end

  test "should destroy admin_high_score" do
    assert_difference('Admin::HighScore.count', -1) do
      delete :destroy, id: @admin_high_score
    end

    assert_redirected_to admin_high_scores_path
  end
end
