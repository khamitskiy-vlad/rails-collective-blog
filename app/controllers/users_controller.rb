# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.includes(:creator)
    @comments = @user.comments.includes(:user, :post)
  end
end
