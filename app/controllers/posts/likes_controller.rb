# frozen_string_literal: true

class Posts::LikesController < Posts::ApplicationController
  before_action :set_like, only: :destroy

  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @post.likes.create(user_id: current_user.id)
    end
    redirect_to post_path(@post)
  end

  def destroy
    if already_liked?
      @like.destroy
    else
      flash[:notice] = 'Cannot unlike'
    end
    redirect_to post_path(@post)
  end

  private

  def set_like
    @like = @post.likes.find(params[:id])
  end

  def already_liked?
    PostLike.exists?(user_id: current_user.id,
                     post_id: params[:post_id])
  end
end
