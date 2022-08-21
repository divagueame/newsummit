class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @daily_goals = get_daily_goals
  end

  private

  def get_daily_goals
    goals = []
    return [120,150,180,233,442,3603]
  end
end
