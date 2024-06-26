# frozen_string_literal: true

require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
  end

  test 'should get root' do
    get root_url
    assert_response :success
  end

  test 'user should get create new post button if authorized' do
    sign_in @user

    get root_url

    assert_select 'a', 'Написать пост'
  end

  test "user shouldn't get create new post button if unauthorized" do
    get root_url

    assert_select 'a', { count: 0, text: 'Написать пост' }
  end
end
