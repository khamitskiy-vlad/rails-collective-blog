# frozen_string_literal: true

class CategoriesController < ApplicationController
  include Pagy::Backend

  def show
    @category = set_category
    @search_query = set_posts
    @pagy, @posts = pagy(@search_query.result.includes(:creator))
  end

  private

  def set_category
    Category.find_by(route: params[:route])
  end

  def set_posts
    @category.posts.ransack(params[:search_query])
  end
end
