require 'test_helper'

class CombinationFunctionsControllerTest < ActionController::TestCase
  setup do
    @combination_function = combination_functions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:combination_functions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create combination_function" do
    assert_difference('CombinationFunction.count') do
      post :create, combination_function: { function: @combination_function.function, input_keys: @combination_function.input_keys, output_key: @combination_function.output_key, project_id: @combination_function.project_id, time_range: @combination_function.time_range }
    end

    assert_redirected_to combination_function_path(assigns(:combination_function))
  end

  test "should show combination_function" do
    get :show, id: @combination_function
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @combination_function
    assert_response :success
  end

  test "should update combination_function" do
    patch :update, id: @combination_function, combination_function: { function: @combination_function.function, input_keys: @combination_function.input_keys, output_key: @combination_function.output_key, project_id: @combination_function.project_id, time_range: @combination_function.time_range }
    assert_redirected_to combination_function_path(assigns(:combination_function))
  end

  test "should destroy combination_function" do
    assert_difference('CombinationFunction.count', -1) do
      delete :destroy, id: @combination_function
    end

    assert_redirected_to combination_functions_path
  end
end
