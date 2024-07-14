# frozen_string_literal: true

class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(id: params[:id])
    @posts = @category.posts.includes(:likes, :comments, :creator)
  end
end
