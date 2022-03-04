class HomesController < ApplicationController
  def index
    @activity = Activity.order("RAND()").limit(3)
  end
end
