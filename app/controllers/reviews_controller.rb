class ReviewsController < ApplicationController
  def create
    @user = User.find(params[:id])
    @review = @user.reviews.build(review_params)
    if @review.save
      redirect_back(fallback_location: root_path)
      flash[:notice] = "レビューを投稿したにゃ！"
    else
      redirect_back(fallback_location: root_path)
      flash[:alert] = "レビューを入力してにゃ"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_back(fallback_location: root_path)
    flash[:notice] = "レビューを削除したにゃ！"
  end

  private

  def review_params
    params.require(:review).permit(:content).merge(user_id: @user.id, contributor_id: current_user.id)
  end
end
