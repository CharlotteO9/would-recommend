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

  end

  def destroy

  end
end
