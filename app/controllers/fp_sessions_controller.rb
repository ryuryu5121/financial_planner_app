class FpSessionsController < ApplicationController
  def new
  end

  def create
    financial_planner = FinancialPlanner.find_by(email: params[:session][:email].downcase)
    if financial_planner && financial_planner.authenticate(params[:session][:password])
      reset_session
      financial_planner_log_in financial_planner
      redirect_to financial_planner
    else
      flash.now[:danger] = '無効なメールアドレス・パスワードです'
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    log_out
    redirect_to root_url, status: :see_other
  end
end
