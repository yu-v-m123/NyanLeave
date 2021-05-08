class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      flash[:notice] = "プロフィールを登録しました。"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "プロフィール登録に失敗しました。"
      render "new"
    end
  end

  def edit
    @profile = Profile.find_by(params[:id])
  end

  def update
    @profile = Profile.find_by(params[:id])
    if @profile.update(profile_params)
      flash[:notice] = "プロフィールを更新しました。"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "プロフィール更新に失敗しました。"
      render "edit"
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:user_name, :address, :introduction, :cat_name, :age, :image).merge(user_id: current_user.id)
  end
end
