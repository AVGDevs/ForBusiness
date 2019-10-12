require 'test_helper'

class FatoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fato_index_url
    assert_response :success
  end

end
