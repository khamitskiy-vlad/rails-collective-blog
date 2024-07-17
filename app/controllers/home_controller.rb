# frozen_string_literal: true

class HomeController < ApplicationController
  include Pagy::Backend

  def index
    @pagy, @posts = pagy(set_posts)
  end

  private

  def set_posts
    Post.order(created_at: :desc).includes(:likes, :comments, :creator, :category)
  end  
end
