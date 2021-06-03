class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user_posts = current_user.posts.page(params[:page]).per(10)
    @count = current_user.posts.count
  end

  def new
    @post = Post.new
  end

  def create
    @profile = current_user.profile
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
      flash[:notice] = "依頼を投稿したにゃ！"
    else
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
    if @post.start == @post.finish
      @day = 1
    else
      @day = ((@post.finish - @post.start) + 1).to_int
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @profile = current_user.profile
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "依頼を編集したにゃ！"
      redirect_to post_path(@post.id)
    else
      render "edit"
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:notice] = "依頼を削除したにゃ！"
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:start, :finish, :place, :feature).merge(
      user_id: current_user.id, profile_id: @profile.id
    )
  end
end
