require 'test_helper'

class PostControllerTest < ActionController::TestCase
  test "should get post_question" do
    get :post_question
    assert_response :success
  end

  test "should get post_answer" do
    get :post_answer
    assert_response :success
  end

  test "should get rate_question" do
    get :rate_question
    assert_response :success
  end

  test "should get rate_answer" do
    get :rate_answer
    assert_response :success
  end

end
