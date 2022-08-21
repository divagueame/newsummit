class DaysController < ApplicationController 
  before_action :set_day
  def update
    @day.update(day_params)
  end

private

  def set_day
    @day = Day.find(params[:id])
  end
 
  def day_params 
    # params.fetch(:day, :done)
    params.require(:day).permit(:done)
  end

 

end
