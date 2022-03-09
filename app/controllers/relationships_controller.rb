class RelationshipsController < ApplicationController
  def create
    Relationship.create(create_params)
    redirect_to user_path(params[:user_id]), notice: "Requested successfully!"
  end

  def destroy
    @user = current_user
    @relationship =  Relationship.where(following_id: params[:id],follower_id:@user.id)
    @relationship.destroy_all
    redirect_to user_path(params[:id])
  end

  private

  def create_params
    params.permit(following_id: current_user.id, follower_id: params[:user_id])
  end
end
