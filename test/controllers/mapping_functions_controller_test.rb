require 'test_helper'

class MappingFunctionsControllerTest < ActionController::TestCase
  setup do
    @mapping_function = mapping_functions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mapping_functions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mapping_function" do
    assert_difference('MappingFunction.count') do
      post :create, mapping_function: { default_value: @mapping_function.default_value, input_key: @mapping_function.input_key, output_key: @mapping_function.output_key, project_id: @mapping_function.project_id }
    end

    assert_redirected_to mapping_function_path(assigns(:mapping_function))
  end

  test "should show mapping_function" do
    get :show, id: @mapping_function
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mapping_function
    assert_response :success
  end

  test "should update mapping_function" do
    patch :update, id: @mapping_function, mapping_function: { default_value: @mapping_function.default_value, input_key: @mapping_function.input_key, output_key: @mapping_function.output_key, project_id: @mapping_function.project_id }
    assert_redirected_to mapping_function_path(assigns(:mapping_function))
  end

  test "should destroy mapping_function" do
    assert_difference('MappingFunction.count', -1) do
      delete :destroy, id: @mapping_function
    end

    assert_redirected_to mapping_functions_path
  end
end
