class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_activities_today = @user.user_activities.where('created_at >= ?', Date.today).count
    @user_activities = @user.user_activities.order('user_activities.created_at DESC')

    @activity_lists = {}
    @user_activities.each do |user_activity|
      created_date = user_activity.created_at.to_date
      @activity_lists[created_date] = [] unless @activity_lists[created_date]
      @activity_lists[created_date] << user_activity
    end

    @friends = current_user.matchers
    
  end

  def index
    @friends = current_user.matchers
    @users = User.all
  end

  def search
    @search_friends = User.search(params[:keyword])
  end
end
