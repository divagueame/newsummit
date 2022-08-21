class HomeController < ApplicationController
  include GoalCalculator
  before_action :authenticate_user!
  def index
    @daily_goals = get_daily_goals
  end

end
