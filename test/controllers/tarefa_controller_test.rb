require 'test_helper'

class TarefaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tarefa_index_url
    assert_response :success
  end

end
