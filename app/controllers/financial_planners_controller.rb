class FinancialPlannersController < ApplicationController
  def new
    @financial_planner = FinancialPlanner.new
  end

  def show
    @financial_planner = FinancialPlanner.find(params[:id])
    @reservations = Reservation.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
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

