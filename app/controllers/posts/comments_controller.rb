# frozen_string_literal: true

class Posts::CommentsController < Posts::ApplicationController
  before_action :authenticate_user!

  def create
    @comment = resource_post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to resource_post, notice: t('.success')
    else
      redirect_back(fallback_location: resource_post)
      flash[:notice] = t('.failure')
    end
  end

  def destroy
    @comment = set_comment

    if user_verified?
      @comment.destroy
      flash[:notice] = t('.success')
    else
      flash[:notice] = t('.failure')
    end
    redirect_to resource_post
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
