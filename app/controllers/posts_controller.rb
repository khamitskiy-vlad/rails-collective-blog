# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[update show destroy edit]

  def show; end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to post_path(@post), notice: 'Post created successfully'
    else
      render :new, status: :unprocessably_entity, notice: "Post couldn't be created"
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: 'Post updated successfully'
    else
      render :edit, notice: "Post couldn't be updated"
    end
  end

  def destroy
    if @post.destroy
      redirect_to root_path, notice: 'Post deleted successfully'
    else
      redirect_to post_path(@post), notice: "Post couldn't be deleted"
    end
  end

  private

  def post_params
    params.required(:post).permit(:title, :body, :creator_id, :category_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
