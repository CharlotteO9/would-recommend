class RatingsController < ApplicationController
  def create
    @rating = Rating.new(rating_params)
  end

  private

  def community_params
    params.require(:rating).permit(:score, :comment)
  end
end
