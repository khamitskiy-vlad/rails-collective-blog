# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.includes(:creator)
    @comments = @user.comments.includes(:user, :post)
  end
end
