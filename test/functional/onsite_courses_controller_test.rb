require 'test_helper'

class OnsiteCoursesControllerTest < ActionController::TestCase
  setup do
    @onsite_course = onsite_courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:onsite_courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create onsite_course" do
    assert_difference('OnsiteCourse.count') do
      post :create, onsite_course: { description: @onsite_course.description, down_payment_price_in_pennies: @onsite_course.down_payment_price_in_pennies, price_in_pennies: @onsite_course.price_in_pennies, title: @onsite_course.title }
    end

    assert_redirected_to onsite_course_path(assigns(:onsite_course))
  end

  test "should show onsite_course" do
    get :show, id: @onsite_course
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @onsite_course
    assert_response :success
  end

  test "should update onsite_course" do
    put :update, id: @onsite_course, onsite_course: { description: @onsite_course.description, down_payment_price_in_pennies: @onsite_course.down_payment_price_in_pennies, price_in_pennies: @onsite_course.price_in_pennies, title: @onsite_course.title }
    assert_redirected_to onsite_course_path(assigns(:onsite_course))
  end

  test "should destroy onsite_course" do
    assert_difference('OnsiteCourse.count', -1) do
      delete :destroy, id: @onsite_course
    end

    assert_redirected_to onsite_courses_path
  end
end
