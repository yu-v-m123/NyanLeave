class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end
  
  def create
    @profile = Profile.find_by(params[:id])
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
      flash[:notice] = "投稿しました"
    else
      render "new"
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    if @post.start == @post.finish
      @day = 1
    else 
      @day = ((@post.finish - @post.start)+1).to_int
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @profile = Profile.find_by(params[:id])
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      flash[:notice] = "投稿を編集しました"
      redirect_to post_path(@post)
    else
      render "edit"
    end
  end

  def destroy
    post = Post.find_by(id: params[:id])
    post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:start, :finish, :place, :feature).merge(user_id: current_user.id, profile_id: @profile.id)
  end
end
