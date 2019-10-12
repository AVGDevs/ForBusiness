require 'test_helper'

class DepartamentoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get departamento_index_url
    assert_response :success
  end

end
