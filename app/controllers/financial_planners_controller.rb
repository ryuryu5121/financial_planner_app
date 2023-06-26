class FinancialPlannersController < ApplicationController
  def new
    @financial_planner = FinancialPlanner.new
  end

  def show
    @financial_planner = FinancialPlanner.find(params[:id])
    @status = params[:status]
    @financial_planner_future_reservations = Reservation.where(fp_id: current_financial_planner.id).where(day: (Date.current)..(Date.current.since(3.month)))
    @financial_planner_finished_reservations = Reservation.where(fp_id: current_financial_planner.id).where("day < ?", Date.current)
    @financial_planner_all_reservations = Reservation.where(fp_id: current_financial_planner.id)
    @select_fp_schedules = Reservation.all.where(day: (Date.current)..(Date.current.since(3.month))).where(fp_id: current_financial_planner.id).order(day: :desc)
  end

  def create
    @financial_planner = FinancialPlanner.new(financial_planner_params)
    if @financial_planner.save
      reset_session
      financial_planner_log_in @financial_planner
      flash[:success] = "FP向けFP App管理画面へようこそ！!"
      redirect_to @financial_planner
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def financial_planner_params
    params.require(:financial_planner).permit(:name, :email, :password, :password_confirmation)
  end
end

