class ActivitiesController < ApplicationController
  before_action :move_to_root

  def new
    @activities = Activity.new
  end

  def create
  end

  private

  def move_to_root
    redirect_to root_path unless user_signed_in?
  end
end
