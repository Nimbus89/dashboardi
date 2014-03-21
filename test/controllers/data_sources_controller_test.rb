require 'test_helper'

class DataSourcesControllerTest < ActionController::TestCase
  setup do
    @data_source = data_sources(:data_sources_001)
  end

  test "should get new" do
    get :new, data_source_type_id: @data_source.data_source_type_id
    assert_response :success
  end

  test "should create data_source" do
    assert_difference('DataSource.count') do
      post :create, data_source: { data_source_type_id: @data_source.data_source_type_id, project_id: @data_source.project_id, fields: @data_source.fields }
    end

   assert_redirected_to project_path(@project)
  end

  test "should get edit" do
    get :edit, id: @data_source
    assert_response :success
  end

  test "should update data_source" do
    patch :update, id: @data_source, data_source: { data_source_type_id: @data_source.data_source_type_id, project_id: @data_source.project_id, fields: @data_source.fields }
    assert_redirected_to project_path(@project)
  end

  test "should destroy data_source" do
    assert_difference('DataSource.count', -1) do
      delete :destroy, id: @data_source
    end

    assert_redirected_to project_path(@project)
  end
end
