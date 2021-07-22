class UsersController < ApplicationController
  before_action :authenticate_user!

  def likes
    @likes = current_user.liked_posts.includes([:profile]).page(params[:page]).per(12)
    @count = current_user.liked_posts.count
    @like = Like.new
  end

  def show
    @profile = current_user.profile
    @reviews = Review.where(user_id: current_user.id).includes(:contributor).order(created_at: :desc)
  end
end
