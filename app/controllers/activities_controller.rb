class ActivitiesController < ApplicationController
  before_action :authenticate_user!

  def new
    @user_activity = Activity.new
    @activities = Activity.all
  end

  def create
    @user_activity = UserActivity.new({ activity_id: params[:activity][:activity_id], user_id: current_user.id })
    @user_activity.save
  end

end
