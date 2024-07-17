# frozen_string_literal: true

class CategoriesController < ApplicationController
  include Pagy::Backend

  def show
    @category = set_category
    @pagy, @posts = pagy(set_posts)
  end

  private

  def set_category
    Category.find_by(route: params[:route])
  end

  def set_posts
    @category.posts.includes(:creator)
  end
end
