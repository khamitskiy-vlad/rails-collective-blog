# frozen_string_literal: true

class HomeController < ApplicationController
  include Pagy::Backend

  def index
    @search_query = set_posts
    @pagy, @posts = pagy(@search_query.result
                                      .order(created_at: :desc)
                                      .includes(:likes, :comments, :creator, :category))
  end

  private

  def set_posts
    Post.ransack(params[:search_query])
  end
end
