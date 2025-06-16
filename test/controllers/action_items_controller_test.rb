require "test_helper"

class ActionItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get action_items_new_url
    assert_response :success
  end

  test "should get create" do
    get action_items_create_url
    assert_response :success
  end

  test "should get show" do
    get action_items_show_url
    assert_response :success
  end

  test "should get index" do
    get action_items_index_url
    assert_response :success
  end

  test "should get edit" do
    get action_items_edit_url
    assert_response :success
  end

  test "should get update" do
    get action_items_update_url
    assert_response :success
  end

  test "should get destroy" do
    get action_items_destroy_url
    assert_response :success
  end
end
