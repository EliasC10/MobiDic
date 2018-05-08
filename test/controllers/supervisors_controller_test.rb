# frozen_string_literal: true

require 'test_helper'

class SupervisorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @supervisor = supervisors(:one)
  end

  test 'should get index' do
    get supervisors_url, as: :json
    assert_response :success
  end

  test 'should create supervisor' do
    assert_difference('Supervisor.count') do
      post supervisors_url, params: { supervisor: { institution_id: @supervisor.institution_id, name: @supervisor.name, password: @supervisor.password } }, as: :json
    end

    assert_response 201
  end

  test 'should show supervisor' do
    get supervisor_url(@supervisor), as: :json
    assert_response :success
  end

  test 'should update supervisor' do
    patch supervisor_url(@supervisor), params: { supervisor: { institution_id: @supervisor.institution_id, name: @supervisor.name, password: @supervisor.password } }, as: :json
    assert_response 200
  end

  test 'should destroy supervisor' do
    assert_difference('Supervisor.count', -1) do
      delete supervisor_url(@supervisor), as: :json
    end

    assert_response 204
  end
end
