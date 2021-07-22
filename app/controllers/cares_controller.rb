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
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end

      unless @isRoom
        @room = Room.new
        @entry = Entry.new
      end
    end
  end
end
