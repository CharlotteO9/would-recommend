class CommunitiesController < ApplicationController
  before_action :set_community, only: %i[show edit update destroy]

  def index
    @communities = Community.where(user_id: current_user)
  end

  def show
    @recommendations = Recommendation.where(community_id: @community.id)
    @memberships = Membership.where(community_id: @community.id)
    @recommendation = Recommendation.new
  end

  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)
    @community.user = current_user
    if @community.save
      redirect_to community_path(@community)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @community = Community.find(params[:id])
    @community.update(community_params)
    if @community.save
      redirect_to community_path(@community)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @community.destroy
    redirect_to communities_path, notice: "Community deleted!"
  end

  private

  def community_params
    params.require(:community).permit(:name, :photo)
  end

  def set_community
    @community = Community.find(params[:id])
  end

end
