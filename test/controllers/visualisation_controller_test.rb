require 'test_helper'

class VisualisationControllerTest < ActionController::TestCase
  test "should get example" do
    get :example
    assert_response :success
  end

end
