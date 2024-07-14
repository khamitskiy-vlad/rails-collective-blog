# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit create update destroy]

  def show
    @post = set_post
    @comment = PostComment.new
    @comments = @post.comments.includes(:user, :post).arrange
    @comments_count = @post.comments.size
    @likes = @post.likes
    @category = @post.category
    @creator = @post.creator
  end

  def new
    @post = Post.new
  end

  def edit
    @post = set_post

    if user_verified?
      @post
    else
      redirect_to post_path(@post), notice: t('.failure')
    end
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to post_path(@post), notice: t('.success')
    else
      render :new, status: :unprocessable_entity, notice: t('.failure')
    end
  end

  def update
    @post = set_post

    if user_verified?
      @post.update(post_params)
      redirect_to post_path(@post), notice: t('.success')
    else
      render :edit, status: :unprocessable_entity, notice: t('.failure')
    end
  end

  def destroy
    @post = set_post

    if user_verified?
      @post.destroy
      redirect_to root_path, notice: t('.success')
    else
      redirect_to post_path(@post), notice: t('.failure')
    end
  end

  private

  def set_post
    Post.find_by(id: params[:id])
  end

  def user_verified?
    @post.creator == current_user
  end

  def post_params
    params.required(:post).permit(:title, :body, :category_id)
  end
end
