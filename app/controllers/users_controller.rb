class UsersController < ApplicationController
  before_action :authenticate_user!

  def likes
    @likes = current_user.liked_posts.page(params[:page]).per(8)
    @count = current_user.liked_posts.count
    @like = Like.new
  end

  def show
    @profile = current_user.profile
  end
end
