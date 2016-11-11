require 'test_helper'

class OwnerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get owner_new_url
    assert_response :success
  end

  test "should get create" do
    get owner_create_url
    assert_response :success
  end

  test "should get show" do
    get owner_show_url
    assert_response :success
  end

  test "should get edit" do
    get owner_edit_url
    assert_response :success
  end

  test "should get update" do
    get owner_update_url
    assert_response :success
  end

  test "should get destroy" do
    get owner_destroy_url
    assert_response :success
  end

end
