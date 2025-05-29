require "test_helper"

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get metodo_teste" do
    get questions_metodo_teste_url
    assert_response :success
  end
end
