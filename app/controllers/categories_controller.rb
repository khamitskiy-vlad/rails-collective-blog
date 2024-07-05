# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category

  def show; end

  private

  def set_category
    @category = Category.find_by(route: params[:route])
  end
end
