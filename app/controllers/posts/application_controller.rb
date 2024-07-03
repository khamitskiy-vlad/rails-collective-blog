# frozen_string_literal: true

class Posts::ApplicationController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
