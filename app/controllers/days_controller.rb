class DaysController < ApplicationController 
  before_action :set_day
  def update
        respond_to do |format|
      if @day.update(day_params)
        format.html { redirect_to root_url, notice: "Day was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end

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
