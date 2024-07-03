# frozen_string_literal: true

class Posts::CommentsController < Posts::ApplicationController
  before_action :set_comment, only: :destroy

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to post_path(@post), notice: 'Comment was successfully created.'
    else
      redirect_to post_path(@post), status: :unprocessable_entity, notice: 'Comment has not been added'
    end
  end

  def destroy
    if @comment.destroy
      redirect_to post_path(@post), notice: 'Comment deleted successfully'
    else
      redirect_to post_path(@post), notice: "Comment couldn't be deleted"
    end
  end

  private

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end
end
