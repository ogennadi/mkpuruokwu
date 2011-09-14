require 'test_helper'

class EnglishEntriesControllerTest < ActionController::TestCase
  setup do
    @english_entry = english_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:english_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create english_entry" do
    assert_difference('EnglishEntry.count') do
      post :create, english_entry: @english_entry.attributes
    end

    assert_redirected_to english_entry_path(assigns(:english_entry))
  end

  test "should show english_entry" do
    get :show, id: @english_entry.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @english_entry.to_param
    assert_response :success
  end

  test "should update english_entry" do
    put :update, id: @english_entry.to_param, english_entry: @english_entry.attributes
    assert_redirected_to english_entry_path(assigns(:english_entry))
  end

  test "should destroy english_entry" do
    assert_difference('EnglishEntry.count', -1) do
      delete :destroy, id: @english_entry.to_param
    end

    assert_redirected_to english_entries_path
  end
end
