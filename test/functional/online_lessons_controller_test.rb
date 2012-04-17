require 'test_helper'

class OnlineLessonsControllerTest < ActionController::TestCase
  setup do
    @online_lesson = online_lessons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:online_lessons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create online_lesson" do
    assert_difference('OnlineLesson.count') do
      post :create, online_lesson: { description: @online_lesson.description, online_course_id: @online_lesson.online_course_id, price_in_pennies: @online_lesson.price_in_pennies, title: @online_lesson.title, video_uid: @online_lesson.video_uid }
    end

    assert_redirected_to online_lesson_path(assigns(:online_lesson))
  end

  test "should show online_lesson" do
    get :show, id: @online_lesson
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @online_lesson
    assert_response :success
  end

  test "should update online_lesson" do
    put :update, id: @online_lesson, online_lesson: { description: @online_lesson.description, online_course_id: @online_lesson.online_course_id, price_in_pennies: @online_lesson.price_in_pennies, title: @online_lesson.title, video_uid: @online_lesson.video_uid }
    assert_redirected_to online_lesson_path(assigns(:online_lesson))
  end

  test "should destroy online_lesson" do
    assert_difference('OnlineLesson.count', -1) do
      delete :destroy, id: @online_lesson
    end

    assert_redirected_to online_lessons_path
  end
end
