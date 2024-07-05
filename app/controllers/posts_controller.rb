# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create update destroy]
  before_action :set_post, only: %i[update show destroy edit]

  def show
    @comment = PostComment.new
    @comments = @post.comments.includes(:user).arrange
  end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to post_path(@post), notice: t('.success')
    else
      render :new, status: :unprocessable_entity, notice: t('.failure')
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: t('.success')
    else
      render :edit, status: :unprocessable_entity, notice: t('.failure')
    end
  end

  def destroy
    if @post.destroy
      redirect_to root_path, notice: t('.success')
    else
      redirect_to post_path(@post), notice: t('.failure')
    end
  end

  private

  def post_params
    params.required(:post).permit(:title, :body, :category_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
