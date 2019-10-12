require 'test_helper'

class EmpresaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get empresa_index_url
    assert_response :success
  end

end
