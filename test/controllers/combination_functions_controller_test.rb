require 'test_helper'

class CombinationFunctionsControllerTest < ActionController::TestCase
  setup do
    @combination_function = combination_functions(:combination_functions_001)
  end

  test "should get new" do
    get :new, project_id: @project
    assert_response :success
  end

  test "should create combination_function" do
    assert_difference('CombinationFunction.count') do
      post :create, {project_id: @project, combination_function: { function: @combination_function.function, input_keys: @combination_function.input_keys, output_key: @combination_function.output_key, project_id: @combination_function.project_id, time_range: @combination_function.time_range }}
    end

    assert_redirected_to project_path(@project)
  end

  test "should get edit" do
    get :edit, project_id: @project, id: @combination_function
    assert_response :success
  end

  test "should update combination_function" do
    patch :update, project_id: @project, id: @combination_function, combination_function: { function: @combination_function.function, input_keys: @combination_function.input_keys, output_key: @combination_function.output_key, project_id: @combination_function.project_id, time_range: @combination_function.time_range }
    assert_redirected_to project_path(@project)
  end

  test "should destroy combination_function" do
    assert_difference('CombinationFunction.count', -1) do
      delete :destroy, project_id: @project, id: @combination_function
    end

    assert_redirected_to project_path(@project)
  end
end
