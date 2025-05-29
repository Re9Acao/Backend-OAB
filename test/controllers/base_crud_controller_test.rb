require "test_helper"

class BaseCrudControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get base_crud_index_url
    assert_response :success
  end

  test "should get create" do
    get base_crud_create_url
    assert_response :success
  end

  test "should get show" do
    get base_crud_show_url
    assert_response :success
  end

  test "should get update" do
    get base_crud_update_url
    assert_response :success
  end

  test "should get destroy" do
    get base_crud_destroy_url
    assert_response :success
  end

  test "should get crud_model" do
    get base_crud_crud_model_url
    assert_response :success
  end

  test "should get create_params" do
    get base_crud_create_params_url
    assert_response :success
  end
end
