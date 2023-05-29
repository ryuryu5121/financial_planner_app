class SchedulesController < ApplicationController
  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(FP_id: current_fp.id,**schedule_params)
    if @schedule.save
      flash[:success] = "Registration has been completed"
      redirect_to @current_fp
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:day, :start_time, :end_time)
  end
end
