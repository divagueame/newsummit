class HomeController < ApplicationController
  include GoalCalculator
  before_action :authenticate_user!

  def index
    @today = Day
      .where(date: Date.today.beginning_of_day..Date.today.end_of_day, user_id: current_user.id)
      .select(:time)
      .first

    @daily_goals = get_daily_goals
  end

end
