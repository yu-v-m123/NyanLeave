class ReviewsController < ApplicationController
  def create
    @user = User.find(params[:id])
    @review = @user.reviews.build(review_params)
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
    params.require(:review).permit(:content).merge(user_id: @user.id, contributor_id: current_user.id)
  end
end
