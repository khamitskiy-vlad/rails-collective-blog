# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @attributes = {
      id: @post.id,
      title: Faker::Lorem.question,
      body: @post.body,
      creator_id: @post.creator_id,
      category_id: @post.category_id 
    }
  end
  
  test 'should get show' do
    get post_url(@post)
    assert_response :success
  end

  test 'should get new' do
    get new_post_path
    assert_response :success
  end

  # test 'should get create' do
  #   attributes = {
  #     id: 2,
  #     title: @post.title,
  #     body: @post.body,
  #     creator_id: @post.creator_id,
  #     category_id: @post.category_id 
  #   }

  #   post posts_url, params: { post: attributes }

  #   post = Post.find_by attributes

  #   assert { post }
  #   assert_redirected_to post_url(post)
  # end

  test 'should get edit' do
    get edit_post_path(@post)
    assert_response :success
  end

  test 'should get update' do
    patch post_url(@post), params: { post: @attributes }
    assert_redirected_to post_url(@post)

    @post.reload

    assert { @post.title == @attributes[:title] }
  end

  test 'should get destroy' do
    delete post_url(@post)

    assert_redirected_to root_path

    assert { !Post.exists? @post.id }
  end
end
