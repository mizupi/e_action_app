class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    redirect_to user
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    redirect_to user
  end

  private

  def create_params
    params.permit(following_id: current_user.id, follower_id: params[:user_id])
  end
end
