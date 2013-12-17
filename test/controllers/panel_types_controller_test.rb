require 'test_helper'

class PanelTypesControllerTest < ActionController::TestCase
  setup do
    @panel_type = panel_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:panel_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create panel_type" do
    assert_difference('PanelType.count') do
      post :create, panel_type: { name: @panel_type.name }
    end

    assert_redirected_to panel_type_path(assigns(:panel_type))
  end

  test "should show panel_type" do
    get :show, id: @panel_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @panel_type
    assert_response :success
  end

  test "should update panel_type" do
    patch :update, id: @panel_type, panel_type: { name: @panel_type.name }
    assert_redirected_to panel_type_path(assigns(:panel_type))
  end

  test "should destroy panel_type" do
    assert_difference('PanelType.count', -1) do
      delete :destroy, id: @panel_type
    end

    assert_redirected_to panel_types_path
  end
end
