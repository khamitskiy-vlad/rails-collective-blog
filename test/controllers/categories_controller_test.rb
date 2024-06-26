# frozen_string_literal: true

require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
    @post_one = posts(:one)
    @post_two = posts(:two)
    @post_three = posts(:three)
  end

  test "should get all category posts" do
    get category_url(@category)
    assert_response :success

    assert_select 'a', @post_one.title
    assert_select 'a', @post_two.title
    assert_select 'a', { count: 0, text: @post_three.title }
  end
end
