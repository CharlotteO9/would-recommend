class RatingsController < ApplicationController
  def create
    @recommendation = Recommendation.find(params[:id])
    @community = Community.find(params[:community_id])
    @rating = Rating.new(rating_params)
    @rating.user = current_user
    @rating.recommendation = @recommendation
    if @rating.save
      redirect_to community_recommendation_path(@community, @recommendation)
    else
      render "recommendations/show", status: :unprocessable_entity
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:score, :comment)
  end
end
