class ReviewsController < ApplicationController
  def create
    @user = User.find(params[:id])
    @review = @user.reviews.build(review_params)
    @review.owner_id = @user.id
    @review.user_id = current_user.id
    @review.save
    render :index
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    render :index
  end

  private

  def review_params
    params.require(:review).permit(:content, :user_id)
  end
end
