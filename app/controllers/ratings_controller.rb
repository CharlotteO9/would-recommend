class RatingsController < ApplicationController
  def create
    @rating = Rating.new(rating_params)
    @rating.user = current_user
    @recommendation = Recommendation.find(params[:recommendation_id])
    @rating.recommendation = @recommendation
    if @rating.save
      redirect_to recommendation_path(@recommendation)
    else
      render "recommendations/show", status: :unprocessable_entity
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:score, :comment)
  end
end
