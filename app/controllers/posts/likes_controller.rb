# frozen_string_literal: true

class Posts::LikesController < Posts::ApplicationController
  before_action :authenticate_user!

  def create
    if like_does_not_exist?
      resource_post.likes.create(user_id: current_user.id)
    else
      flash[:notice] = t('.failure')
    end
    redirect_to resource_post
  end

  def destroy
    @like = set_like

    if user_verified?
      @like.destroy
    else
      flash[:notice] = t('.failure')
    end
    redirect_to resource_post
  end

  private

  def set_like
    resource_post.likes.find(params[:id])
  end

  def like_does_not_exist?
    !PostLike.exists?(user_id: current_user.id,
                      post_id: resource_post.id)
  end

  def user_verified?
    current_user == @like.user
  end
end
