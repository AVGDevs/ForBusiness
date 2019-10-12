require 'test_helper'

class ColaboradorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get colaborador_index_url
    assert_response :success
  end

end
