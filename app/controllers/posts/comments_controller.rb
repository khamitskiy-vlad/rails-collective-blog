# frozen_string_literal: true

class Posts::CommentsController < Posts::ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to post_path(@post), notice: 'Comment was successfully created.'
    else
      redirect_to post_path(@post), status: :unprocessable_entity, notice: 'Comment has not been added'
    end
  end

  def destroy
    @comment = PostComment.find(params[:id])
    @comment.destroy

    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:post_comment).permit(:body, :parent_id)
  end
end
