class CaresController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.includes([:profile]).page(params[:page]).per(12)
    @count = Post.all.count
    @like = Like.new
  end

  def show
    @post = Post.find(params[:id])
    if @post.start == @post.finish
      @day = 1
    else
      @day = ((@post.finish - @post.start) + 1).to_int
    end
  end
  
  def owner
    @user = User.find(params[:id])
    @owner = @user.profile
    @review = Review.new
    # @review_owner = Review.find(params[:id])
    # @review_owner_id = @review_owner.owner_id
    @reviews = @user.reviews
  end
end
