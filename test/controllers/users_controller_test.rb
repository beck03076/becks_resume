require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { address: @user.address, email: @user.email, fb_link: @user.fb_link, fb_text: @user.fb_text, first_name: @user.first_name, github_link: @user.github_link, github_text: @user.github_text, last_name: @user.last_name, middle_name: @user.middle_name, mobile: @user.mobile, so_link: @user.so_link, so_text: @user.so_text, summary: @user.summary, twitter_link: @user.twitter_link, twitter_text: @user.twitter_text }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { address: @user.address, email: @user.email, fb_link: @user.fb_link, fb_text: @user.fb_text, first_name: @user.first_name, github_link: @user.github_link, github_text: @user.github_text, last_name: @user.last_name, middle_name: @user.middle_name, mobile: @user.mobile, so_link: @user.so_link, so_text: @user.so_text, summary: @user.summary, twitter_link: @user.twitter_link, twitter_text: @user.twitter_text }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
