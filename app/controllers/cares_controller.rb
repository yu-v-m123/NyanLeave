class CaresController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
    @count = @posts.count
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
  end
end
