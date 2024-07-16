# frozen_string_literal: true

class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @posts = @category.posts.includes(:creator)
  end
end
