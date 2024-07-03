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

  test 'should get show post' do
    get post_url(@post)
    assert_response :success
  end

  test 'should get new post' do
    sign_in @user

    get new_post_url
    assert_response :success
  end

  test 'should create post' do
    sign_in @user

    post posts_path, params: { post: @attributes }

    new_post = Post.find_by(@attributes.merge(creator_id: @post.creator.id))

    assert { new_post }
    assert_redirected_to post_url(new_post)
  end

  test 'should get edit post' do
    get edit_post_path(@post)
    assert_response :success
  end

  test 'should update post' do
    sign_in @user

    patch post_url(@post), params: { post: @attributes }
    assert_redirected_to post_url(@post)

    @post.reload

    assert { @post.title == @attributes[:title] }
  end

  test 'should destroy post' do
    sign_in @user

    delete post_url(@post)

    assert_redirected_to root_path

    assert { !Post.exists? @post.id }
  end
end
