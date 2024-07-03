# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    @post_liked = posts(:one)
    @post_unliked = posts(:two)
  end

  test 'should create like' do
    sign_in @user

    post post_likes_path(@post_unliked)
    like = PostLike.find_by({ post: @post_unliked, user: @user })

    assert { like }
    assert_redirected_to post_url(@post_unliked)
  end

  test 'should destroy like' do
    sign_in @user

    like = post_likes(:one)
    delete post_like_path(@post_liked, like)

    assert_redirected_to post_url(@post_liked)
    assert_not PostLike.find_by(id: like.id)
  end
end
