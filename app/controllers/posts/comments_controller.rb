# frozen_string_literal: true

class Posts::CommentsController < Posts::ApplicationController
  before_action :authenticate_user!

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
    @comment = set_comment

    if user_verified?
      @comment.destroy
      redirect_to post_path(resource_post), notice: t('.success')
    else
      redirect_to post_path(resource_post), notice: t('.failure')
    end
  end

  private

  def set_comment
    resource_post.comments.find(params[:id])
  end

  def user_verified?
    current_user == @comment.user
  end

  def comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end
end
