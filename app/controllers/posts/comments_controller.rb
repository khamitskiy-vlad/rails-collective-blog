# frozen_string_literal: true

class Posts::CommentsController < Posts::ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: :destroy

  def create
    @comment = resource_post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to post_path(resource_post), notice: t('.success')
    else
      redirect_to post_path(resource_post), status: :unprocessable_entity, notice: t('.failure')
    end
  end

  def destroy
    if @comment.user == current_user
      @comment.destroy
      redirect_to post_path(resource_post), notice: t('.success')
    else
      redirect_to post_path(resource_post), notice: t('.failure')
    end
  end

  private

  def set_comment
    @comment = resource_post.comments.find(params[:id])
  end

  def comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end
end
