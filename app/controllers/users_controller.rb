class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_activities_today = @user.user_activities.where('created_at >= ?', Date.today).count
    @user_activities = @user.user_activities
    # @activities = @user.user_activities.map(&:activity)
    @activity_lists = @user.user_activities.includes(:activity).order('user_activities.created_at DESC')
  end
end
