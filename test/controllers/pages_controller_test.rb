require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  setup do
    @page = pages(:pages_001)
  end

  test "should create page" do
    assert_difference('Page.count') do
      post :create, page: { name: @page.name  + "_new", project_id: @project }
    end

    assert_redirected_to project_path(@project)
  end

  test "should show page" do
    get :show, id: @page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @page
    assert_response :success
  end

  test "should update page" do
    patch :update, id: @page, page: { name: @page.name }
    assert_redirected_to page_path(assigns(:page))
  end

  test "should destroy page" do
    assert_difference('Page.count', -1) do
      delete :destroy, id: @page
    end

    assert_redirected_to project_path(@project)
  end
end
