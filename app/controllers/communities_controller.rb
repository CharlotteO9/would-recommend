class CommunitiesController < ApplicationController
  def index
    @communities = Community.all
  end

  def show
    @community = Community.find(params[:id])
  end

  def new
    @community = Community.new
  end

  def create
    @community = Community.new(params_communities)
    if @community.save
      redirect_to community_path(@community)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @community = Community.find(params[:id])
    @community.destroy
    redirect_to communities_path, notice: "Community deleted!"
  end

  private

  def params_communities
    params.require(:restaurant).permit(:name, :address, :rating)
  end

end
