require 'test_helper'

class OnsiteLessonsControllerTest < ActionController::TestCase
  setup do
    @onsite_lesson = onsite_lessons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:onsite_lessons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create onsite_lesson" do
    assert_difference('OnsiteLesson.count') do
      post :create, onsite_lesson: { description: @onsite_lesson.description, down_payment_price_in_pennies: @onsite_lesson.down_payment_price_in_pennies, price_in_pennies: @onsite_lesson.price_in_pennies, title: @onsite_lesson.title }
    end

    assert_redirected_to onsite_lesson_path(assigns(:onsite_lesson))
  end

  test "should show onsite_lesson" do
    get :show, id: @onsite_lesson
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @onsite_lesson
    assert_response :success
  end

  test "should update onsite_lesson" do
    put :update, id: @onsite_lesson, onsite_lesson: { description: @onsite_lesson.description, down_payment_price_in_pennies: @onsite_lesson.down_payment_price_in_pennies, price_in_pennies: @onsite_lesson.price_in_pennies, title: @onsite_lesson.title }
    assert_redirected_to onsite_lesson_path(assigns(:onsite_lesson))
  end

  test "should destroy onsite_lesson" do
    assert_difference('OnsiteLesson.count', -1) do
      delete :destroy, id: @onsite_lesson
    end

    assert_redirected_to onsite_lessons_path
  end
end
