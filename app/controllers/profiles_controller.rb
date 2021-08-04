class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_post,only: [:edit]

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      flash[:notice] = "プロフィールを登録したにゃ！"
      redirect_to current_user
    else
      render "new"
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      flash[:notice] = "プロフィールを編集したにゃ！"
      redirect_to current_user
    else
      render "edit"
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:user_name, :address, :introduction, :cat_name, :age, :image)
  end

  def correct_post
    @profile = Profile.find(params[:id])
    unless @profile.user.id == current_user.id
      flash[:alert] = "URL直叩きはだめにゃ！"
      redirect_to root_path
    end
  end
end
