# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create update destroy]
  before_action :set_post, only: %i[update show destroy edit]

  def show
    @comment = PostComment.new
    @comments = @post.comments.includes(:user).arrange
  end

  def new
    if user_signed_in?
      @post = Post.new
    else
      redirect_to root_path, notice: t('.failure')
    end
  end

  def edit
    if user_pass_check?
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
    if user_pass_check?
      @post.update(post_params)
      redirect_to post_path(@post), notice: t('.success')
    else
      render :edit, status: :unprocessable_entity, notice: t('.failure')
    end
  end

  def destroy
    if user_pass_check?
      @post.destroy
      redirect_to root_path, notice: t('.success')
    else
      redirect_to post_path(@post), notice: t('.failure')
    end
  end

  private

  def user_pass_check?
    @post.creator == current_user
  end

  def post_params
    params.required(:post).permit(:title, :body, :category_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
