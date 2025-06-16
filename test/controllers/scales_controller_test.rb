require "test_helper"

class ScalesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get scales_new_url
    assert_response :success
  end

  test "should get create" do
    get scales_create_url
    assert_response :success
  end

  test "should get show" do
    get scales_show_url
    assert_response :success
  end

  test "should get index" do
    get scales_index_url
    assert_response :success
  end

  test "should get edit" do
    get scales_edit_url
    assert_response :success
  end

  test "should get update" do
    get scales_update_url
    assert_response :success
  end

  test "should get destroy" do
    get scales_destroy_url
    assert_response :success
  end
end
