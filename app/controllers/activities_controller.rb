class ActivitiesController < ApplicationController
  before_action :move_to_root

  def new
    @user_activity = Activity.new
    @activities = Activity.all
  end

  def create
    @user_activity = UserActivity.new({activity_id: params[:user_activity][:activity_id], user_id: current_user.id})
    @user_activity.save
  end

  private

  def move_to_root
    redirect_to root_path unless user_signed_in?
  end
end
