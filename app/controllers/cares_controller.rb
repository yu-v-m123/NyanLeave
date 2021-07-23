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
    @reviews = Review.where(user_id: @user.id).includes(:contributor).order(created_at: :desc)
    @current_user_entry = Entry.where(user_id: current_user.id)
    @user_entry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @current_user_entry.each do |cu|
        @user_entry.each do |u|
          if cu.room_id == u.room_id
            @is_room = true
            @room_id = cu.room_id
          end
        end
      end

      unless @is_room
        @room = Room.new
        @entry = Entry.new
      end
    end
  end
end
