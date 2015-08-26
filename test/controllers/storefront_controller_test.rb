require 'test_helper'

class StorefrontControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select '.panel', 2
    assert_select 'h4', 'MyString'
  end

end
