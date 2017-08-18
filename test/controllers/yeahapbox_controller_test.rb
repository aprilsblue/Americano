require 'test_helper'

class YeahapboxControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get yeahapbox_create_url
    assert_response :success
  end

  test "should get destroy" do
    get yeahapbox_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get yeahapbox_edit_url
    assert_response :success
  end

  test "should get update" do
    get yeahapbox_update_url
    assert_response :success
  end

end
