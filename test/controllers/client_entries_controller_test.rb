require 'test_helper'

class ClientEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client_entry = client_entries(:one)
  end

  test "should get index" do
    get client_entries_url, as: :json
    assert_response :success
  end

  test "should create client_entry" do
    assert_difference('ClientEntry.count') do
      post client_entries_url, params: { client_entry: { client_id: @client_entry.client_id, entry_id: @client_entry.entry_id } }, as: :json
    end

    assert_response 201
  end

  test "should show client_entry" do
    get client_entry_url(@client_entry), as: :json
    assert_response :success
  end

  test "should update client_entry" do
    patch client_entry_url(@client_entry), params: { client_entry: { client_id: @client_entry.client_id, entry_id: @client_entry.entry_id } }, as: :json
    assert_response 200
  end

  test "should destroy client_entry" do
    assert_difference('ClientEntry.count', -1) do
      delete client_entry_url(@client_entry), as: :json
    end

    assert_response 204
  end
end
