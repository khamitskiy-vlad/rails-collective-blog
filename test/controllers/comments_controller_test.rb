# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    @post = posts(:one)
    @comment = post_comments(:one)
    @attributes = { content: Faker::Lorem.paragraph }
    @locale = { locale: I18n.default_locale }
  end

  test 'should create comment' do
    sign_in @user

    post post_comments_path(@post, @locale), params: { post_comment: @attributes }

    post_comment = PostComment.find_by @attributes.merge(post_id: @post.id, user_id: @user.id)

    assert { post_comment }
    assert_redirected_to post_url(@post, @locale)
  end

  test 'should create ancestry comment' do
    sign_in @user

    @ancestry_comment = @attributes.merge({ parent_id: @comment.id.to_s })

    post post_comments_path(@post, @locale), params: { post_comment: @ancestry_comment }

    post_comment = PostComment.find_by @attributes.merge(post_id: @post.id, user_id: @user.id)

    assert { post_comment }
    assert { post_comment.ancestry == "/#{@comment.id}/" }
    assert_redirected_to post_url(@post, @locale)
  end

  test 'should destroy comment' do
    sign_in @user

    delete post_comment_path(@post, @comment, @locale)

    assert_redirected_to post_url(@post, @locale)
    assert_not PostComment.find_by(id: @comment.id)
  end
end
