require 'test_helper'

class SetTopicControllerTest < ActionController::TestCase
  test "should get add_topic" do
    get :add_topic
    assert_response :success
  end

  test "should get delete_topic" do
    get :delete_topic
    assert_response :success
  end

  test "should get show_topics" do
    get :show_topics
    assert_response :success
  end

end
