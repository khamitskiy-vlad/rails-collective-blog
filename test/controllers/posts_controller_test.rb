# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)
    @user = users(:one)
    @category = categories(:one)
    @attributes = {
      title: Faker::Lorem.question,
      body: Faker::Lorem.paragraph_by_chars(number: 151, supplemental: false),
      category_id: @category.id
    }
  end

  test 'should get show' do
    get post_url(@post)
    assert_response :success
  end

  test 'should get new' do
    sign_in @user
    get new_post_url
    assert_response :success
  end

  test 'should get create' do
    sign_in @user

    post posts_path, params: { post: @attributes }

    new_post = Post.find_by(@attributes.merge(creator_id: @post.creator.id))

    assert { new_post }
    assert_redirected_to post_url(new_post)
  end

  test 'should get edit' do
    get edit_post_path(@post)
    assert_response :success
  end

  test 'should get update' do
    sign_in @user

    patch post_url(@post), params: { post: @attributes }
    assert_redirected_to post_url(@post)

    @post.reload

    assert { @post.title == @attributes[:title] }
  end

  test 'should get destroy' do
    sign_in @user

    delete post_url(@post)

    assert_redirected_to root_path

    assert { !Post.exists? @post.id }
  end
end
