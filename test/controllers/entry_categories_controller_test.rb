require 'test_helper'

class EntryCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entry_category = entry_categories(:one)
  end

  test "should get index" do
    get entry_categories_url, as: :json
    assert_response :success
  end

  test "should create entry_category" do
    assert_difference('EntryCategory.count') do
      post entry_categories_url, params: { entry_category: { category_id: @entry_category.category_id, entry_id: @entry_category.entry_id } }, as: :json
    end

    assert_response 201
  end

  test "should show entry_category" do
    get entry_category_url(@entry_category), as: :json
    assert_response :success
  end

  test "should update entry_category" do
    patch entry_category_url(@entry_category), params: { entry_category: { category_id: @entry_category.category_id, entry_id: @entry_category.entry_id } }, as: :json
    assert_response 200
  end

  test "should destroy entry_category" do
    assert_difference('EntryCategory.count', -1) do
      delete entry_category_url(@entry_category), as: :json
    end

    assert_response 204
  end
end
