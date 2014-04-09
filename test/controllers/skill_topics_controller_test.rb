require 'test_helper'

class SkillTopicsControllerTest < ActionController::TestCase
  setup do
    @skill_topic = skill_topics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:skill_topics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create skill_topic" do
    assert_difference('SkillTopic.count') do
      post :create, skill_topic: {  }
    end

    assert_redirected_to skill_topic_path(assigns(:skill_topic))
  end

  test "should show skill_topic" do
    get :show, id: @skill_topic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @skill_topic
    assert_response :success
  end

  test "should update skill_topic" do
    patch :update, id: @skill_topic, skill_topic: {  }
    assert_redirected_to skill_topic_path(assigns(:skill_topic))
  end

  test "should destroy skill_topic" do
    assert_difference('SkillTopic.count', -1) do
      delete :destroy, id: @skill_topic
    end

    assert_redirected_to skill_topics_path
  end
end
