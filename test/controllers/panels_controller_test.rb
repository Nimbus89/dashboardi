require 'test_helper'

class PanelsControllerTest < ActionController::TestCase
  setup do
    @panel = panels(:panels_001)
  end

  test "should create panel" do
    assert_difference('Panel.count') do
      post :create, format: 'js', panel: { x: @panel.x, y: @panel.y, page_id: @panel.page_id, panel_type_id: @panel.panel_type_id }
    end

    assert_redirected_to panel_path(assigns(:panel))

  end

  test "should show panel" do
    get :show, format: 'js', id: @panel
    assert_response :success
  end

  test "should get edit" do
    get :edit, format: 'js', id: @panel
    assert_response :success
  end

  test "should update panel" do
    patch :update, format: 'js', id: @panel, panel: { x: @panel.x, y: @panel.y, page_id: @panel.page, panel_type_id: @panel.panel_type, properties: @panel.properties }
    assert_response :success
  end

  test "should destroy panel" do
    assert_difference('Panel.count', -1) do
      delete :destroy, format: 'js', id: @panel
    end

    assert_response :success
  end
end
