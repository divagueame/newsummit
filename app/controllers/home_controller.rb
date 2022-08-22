class HomeController < ApplicationController
  include GoalCalculator
  before_action :authenticate_user!

  def index
    @today = Day
      .where(date: Date.today.beginning_of_day..Date.today.end_of_day, user_id: current_user.id)
      .select(:time)
      .first
    
    @daily_goals = get_daily_goals

    user_days = current_user.days.count
    user_done_days = current_user.days.where(done:true).count
    @user_completed =  100 * user_done_days / user_days
    
    @days_left = (current_user.days.last.date.to_date - Date.today).to_i
  end

end
