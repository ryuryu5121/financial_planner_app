class SchedulesController < ApplicationController
  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(FP_id: current_financial_planner.id,**schedule_params)
    if @schedule.save
      flash[:success] = "勤怠の登録が完了しました！"
      redirect_to @current_financial_planner
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:day, :start_time, :end_time)
  end
end
