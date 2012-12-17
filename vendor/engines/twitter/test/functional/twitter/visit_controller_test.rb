require 'test_helper'

module Twitter
  class VisitControllerTest < ActionController::TestCase
    test "should get index" do
      get :index
      assert_response :success
    end
  
  end
end
