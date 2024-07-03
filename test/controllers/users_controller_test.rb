# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test 'should get show user comments and posts count' do
    get user_url(@user)

    assert_select 'span', '1'
    assert_select 'span', '2'
  end
end
