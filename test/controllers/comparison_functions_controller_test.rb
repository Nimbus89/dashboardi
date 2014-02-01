require 'test_helper'

class ComparisonFunctionsControllerTest < ActionController::TestCase
  setup do
    @comparison_function = comparison_functions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comparison_functions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comparison_function" do
    assert_difference('ComparisonFunction.count') do
      post :create, comparison_function: { constant: @comparison_function.constant, function: @comparison_function.function, input_key: @comparison_function.input_key, output_key: @comparison_function.output_key, project_id: @comparison_function.project_id, second_input: @comparison_function.second_input }
    end

    assert_redirected_to comparison_function_path(assigns(:comparison_function))
  end

  test "should show comparison_function" do
    get :show, id: @comparison_function
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comparison_function
    assert_response :success
  end

  test "should update comparison_function" do
    patch :update, id: @comparison_function, comparison_function: { constant: @comparison_function.constant, function: @comparison_function.function, input_key: @comparison_function.input_key, output_key: @comparison_function.output_key, project_id: @comparison_function.project_id, second_input: @comparison_function.second_input }
    assert_redirected_to comparison_function_path(assigns(:comparison_function))
  end

  test "should destroy comparison_function" do
    assert_difference('ComparisonFunction.count', -1) do
      delete :destroy, id: @comparison_function
    end

    assert_redirected_to comparison_functions_path
  end
end
