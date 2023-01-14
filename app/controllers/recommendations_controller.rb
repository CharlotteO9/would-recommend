class RecommendationsController < ApplicationController
  def index
    @recommendations = Recommendation.all
  end

  def show
    @recommendation = Recommendation.find(params[:id])
  end

  def new
    @recommendation = Recommendation.new
  end

  def create
    @recommendation = Recommendation.new(recommendation_params)
    if @recommendation.save
      redirect_to recommendation_path(@recommendation)
    else
      render :new, status: :unprocessable_entity
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

  def recommendation_params
    params.require(:recommendation).permit(:category, :title, :description, :address, :photo)
  end

end
