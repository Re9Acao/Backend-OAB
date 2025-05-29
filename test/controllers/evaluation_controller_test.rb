require "test_helper"

class EvaluationControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get evaluation_create_url
    assert_response :success
  end

  test "should get crud_model" do
    get evaluation_crud_model_url
    assert_response :success
  end

  test "should get create_params" do
    get evaluation_create_params_url
    assert_response :success
  end
end
