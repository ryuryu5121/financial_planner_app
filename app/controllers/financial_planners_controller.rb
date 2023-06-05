class FinancialPlannersController < ApplicationController
  def new
    @financial_planner = FinancialPlanner.new
  end

  def show
    @financial_planner = FinancialPlanner.find(params[:id])
    @status = params[:status]
    @financial_planner_before_reservations = Reservation.where(fp_id: current_fp.id).where(day: (Date.current)..(Date.current.since(3.month)))
    @financial_planner_after_reservations = Reservation.where(fp_id: current_fp.id).where("day <= ?", Date.current)
    @select_fp_schedules = Reservation.all.where(day: (Date.current)..(Date.current.since(3.month))).where(fp_id: current_fp.id).order(day: :desc)
  end

  def create
    @financial_planner = FinancialPlanner.new(financial_planner_params)
    if @financial_planner.save
      reset_session
      fp_log_in @financial_planner
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

