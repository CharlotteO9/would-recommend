class MembershipsController < ApplicationController
  def index
    @community = Community.find(params[:community_id])
    @memberships = Membership.all
  end

  def new
    @users = User.where.not(id: current_user.id)
    @community = Community.find(params[:community_id])
    @membership = Membership.new
  end

  def create
    @community = Community.find(params[:community_id])
    @membership = Membership.new(membership_params)
    @membership.community = @community
    @membership.status = "pending"
    if @membership.save
      redirect_to community_path(@community), notice: "Member added!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def membership_params
    params.require(:membership).permit(:user_id)
  end
end
