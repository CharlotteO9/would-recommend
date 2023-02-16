class MembershipsController < ApplicationController
  def new
    @community = Community.find(params[:community_id])
    membership_user_id = Membership.where(community_id: @community.id).map { |mb| mb.user_id }
    @membership_users = User.where.not(id: current_user.id).where.not(id: membership_user_id)
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
