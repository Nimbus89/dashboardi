require 'test_helper'

class MappingFunctionsControllerTest < ActionController::TestCase
  setup do
    @mapping_function = mapping_functions(:mapping_functions_001)
  end

  test "should get new" do
    get :new, project_id: @project
    assert_response :success
  end

  test "should create mapping_function" do
    assert_difference('MappingFunction.count') do
      post :create, {project_id: @project, mapping_function: { default_value: @mapping_function.default_value, input_key: @mapping_function.input_key, output_key: @mapping_function.output_key, project_id: @mapping_function.project_id }}
    end

    assert_redirected_to project_path(@project)
  end

  test "should get edit" do
    get :edit, id: @mapping_function, project_id: @project
    assert_response :success
  end

  test "should update mapping_function" do
    patch :update, project_id: @project, id: @mapping_function, mapping_function: { default_value: @mapping_function.default_value, input_key: @mapping_function.input_key, output_key: @mapping_function.output_key, project_id: @mapping_function.project_id }
    assert_redirected_to project_path(@project)
  end

  test "should destroy mapping_function" do
    assert_difference('MappingFunction.count', -1) do
      delete :destroy,project_id: @project,  id: @mapping_function
    end

    assert_redirected_to project_path(@project)
  end
end
