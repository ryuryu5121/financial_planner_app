class FinancialPlannersController < ApplicationController
  def new
    @financial_planner = FinancialPlanner.new
  end

  def show
    @financial_planner = FinancialPlanner.find(params[:id])
  end

  def create
    @financial_planner = FinancialPlanner.new(financial_planner_params)
    if @financial_planner.save
      reset_session
      fp_log_in @financial_planner
      flash[:success] = "Welcome to the FP App for FP!"
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

