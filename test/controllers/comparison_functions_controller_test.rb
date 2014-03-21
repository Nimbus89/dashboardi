require 'test_helper'

class ComparisonFunctionsControllerTest < ActionController::TestCase
  setup do
    @comparison_function = comparison_functions(:comparison_functions_001)
  end

  test "should get new" do
    get :new, project_id: @project
    assert_response :success
  end

  test "should create comparison_function" do
    assert_difference('ComparisonFunction.count') do
      post :create, {project_id: @project, comparison_function: { constant: @comparison_function.constant, function: @comparison_function.function, input_key: @comparison_function.input_key, output_key: @comparison_function.output_key, project_id: @comparison_function.project_id, second_input: @comparison_function.second_input }}
    end

    assert_redirected_to project_path(@project)
  end

  test "should get edit" do
    get :edit, project_id: @project, id: @comparison_function
    assert_response :success
  end

  test "should update comparison_function" do
    patch :update, project_id: @project,  id: @comparison_function, comparison_function: { constant: @comparison_function.constant, function: @comparison_function.function, input_key: @comparison_function.input_key, output_key: @comparison_function.output_key, project_id: @comparison_function.project_id, second_input: @comparison_function.second_input }
    assert_redirected_to project_path(@project)
  end

  test "should destroy comparison_function" do
    assert_difference('ComparisonFunction.count', -1) do
      delete :destroy, project_id: @project,  id: @comparison_function
    end

    assert_redirected_to project_path(@project)
  end
end
