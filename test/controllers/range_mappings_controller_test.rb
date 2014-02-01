require 'test_helper'

class RangeMappingsControllerTest < ActionController::TestCase
  setup do
    @range_mapping = range_mappings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:range_mappings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create range_mapping" do
    assert_difference('RangeMapping.count') do
      post :create, range_mapping: { mapping_function_id: @range_mapping.mapping_function_id, max_value: @range_mapping.max_value, min_value: @range_mapping.min_value, output_value: @range_mapping.output_value }
    end

    assert_redirected_to range_mapping_path(assigns(:range_mapping))
  end

  test "should show range_mapping" do
    get :show, id: @range_mapping
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @range_mapping
    assert_response :success
  end

  test "should update range_mapping" do
    patch :update, id: @range_mapping, range_mapping: { mapping_function_id: @range_mapping.mapping_function_id, max_value: @range_mapping.max_value, min_value: @range_mapping.min_value, output_value: @range_mapping.output_value }
    assert_redirected_to range_mapping_path(assigns(:range_mapping))
  end

  test "should destroy range_mapping" do
    assert_difference('RangeMapping.count', -1) do
      delete :destroy, id: @range_mapping
    end

    assert_redirected_to range_mappings_path
  end
end
