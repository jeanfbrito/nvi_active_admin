require 'test_helper'

class OnlineCoursesControllerTest < ActionController::TestCase
  setup do
    @online_course = online_courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:online_courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create online_course" do
    assert_difference('OnlineCourse.count') do
      post :create, online_course: { description: @online_course.description, market_sector_id: @online_course.market_sector_id, position: @online_course.position, price_in_pennies: @online_course.price_in_pennies, title: @online_course.title }
    end

    assert_redirected_to online_course_path(assigns(:online_course))
  end

  test "should show online_course" do
    get :show, id: @online_course
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @online_course
    assert_response :success
  end

  test "should update online_course" do
    put :update, id: @online_course, online_course: { description: @online_course.description, market_sector_id: @online_course.market_sector_id, position: @online_course.position, price_in_pennies: @online_course.price_in_pennies, title: @online_course.title }
    assert_redirected_to online_course_path(assigns(:online_course))
  end

  test "should destroy online_course" do
    assert_difference('OnlineCourse.count', -1) do
      delete :destroy, id: @online_course
    end

    assert_redirected_to online_courses_path
  end
end
