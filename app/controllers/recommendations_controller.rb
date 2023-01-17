class RecommendationsController < ApplicationController
  before_action :set_community, only: %i[show new create]

  def index
    @recommendations = Recommendation.where(community_id: @community.id)
  end

  def show
    @recommendation = Recommendation.find(params[:id])
    @ratings = Rating.where(recommendation_id: @recommendation.id)
  end

  def new
    @recommendation = Recommendation.new
  end

  def create
    @recommendation = Recommendation.new(recommendation_params)
    @recommendation.community = @community
    @recommendation.user = User.first #current_user
    if @recommendation.save
      redirect_to community_recommendations_path(@community)
    else
      render :new, status: :unprocessable_entity, notice: "didn't work"
    end
  end

  def edit
    @recommendation = Recommendation.find(params[:id])
  end

  def update

  end

  def destroy
    @recommendation = Recommendation.find(params[:id])
    @recommendation.destroy
    redirect_to recommendations_path, notice: "Recommendation deleted!"
  end

  private

  def set_community
    @community = Community.find(params[:community_id])
  end

  def recommendation_params
    params.require(:recommendation).permit(:category, :title, :description, :address, :photo)
  end
end
